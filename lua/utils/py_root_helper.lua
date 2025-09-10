local M = {}

local project_roots = {}

---@param file string
---@return string|nil
function M.detect_root(file)
    if not file or file == "" then
        return nil
    end

    local bufnr = vim.api.nvim_get_current_buf()
    if project_roots[bufnr] then
        return project_roots[bufnr]
    end

    local found = vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, {
        upward = true,
        path = file,
        stop = vim.loop.os_homedir(),
    })[1]

    if found then
        local root = vim.fs.dirname(found)
        project_roots[bufnr] = root
        return root
    end
    return nil
end

return M
