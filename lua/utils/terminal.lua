-- https://github.com/3BD-R/nvim/blob/041b8c018863c2460ca9e1e108f3bd8c376d73d0/lua/basic/term.lua
---@type integer|nil
local te_buf = nil

---@type integer|nil
local te_win_id = nil

local v = vim
local fun = v.fn
local cmd = v.api.nvim_command

---@return integer # 1 if id exists and the change were made, 0 otherwise
local gotoid = fun.win_gotoid

---@return integer
local getid = fun.win_getid

---@return nil
local function openTerminal()
    if fun.bufexists(te_buf) ~= 1 then
        cmd("au TermOpen * setlocal nonumber norelativenumber signcolumn=no")
        cmd("sp | winc J | res 10 | te")
        te_win_id = getid()
        te_buf = fun.bufnr('%')
    elseif gotoid(te_win_id) ~= 1 then
        cmd("sb " .. te_buf .. "| winc J | res 10")
        te_win_id = getid()
    end
    cmd("startinsert")
end

---@return nil
local function hideTerminal()
    if gotoid(te_win_id) == 1 then
        cmd("hide")
    end
end

---@return nil
function ToggleTerminal()
    if gotoid(te_win_id) == 1 then
        hideTerminal()
    else
        openTerminal()
    end
end
