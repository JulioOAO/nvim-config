local map = vim.keymap.set

-- Buffers
map("n", "<A-h>", "<cmd>bprev<CR>", { desc = "Buffer: move to the previous one" })
map("n", "<A-l>", "<cmd>bnext<CR>", { desc = "Buffer: move to the next one" })

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Tab: open [n]ew" })
map("n", "<leader>tc", "<cmd>tabc<CR>", { desc = "Tab: [c]lose current" })
map("n", "<S-Tab>", "gt", { desc = "Tab: move to next one" })

-- Windows
map("n", "<leader>nv", "<cmd>vne<CR>", { desc = "Windows: [n]ew [v]ertical window" })
map("n", "<leader>nh", "<cmd>new<CR>", { desc = "Windows: [n]ew [h]orizontal window" })
map("n", "<leader>sv", "<cmd>vsp<CR>", { desc = "Windows: [s]plit [v]ertically" })
map("n", "<leader>sh", "<cmd>sp<CR>", { desc = "Windows: [s]plit [h]orizontally" })
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
map("n", "<C-Up>", "<C-w>+", { desc = "Increase window height" })
map("n", "<C-Down>", "<C-w>-", { desc = "Decrease window height" })
map("n", "<C-Right>", "<C-w>>", { desc = "Increase window width" })
map("n", "<C-Left>", "<C-w><lt>", { desc = "Decrease window width" })

-- Clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Terminal
require("utils.terminal")
map({ "n", "t" }, "<A-t>", ToggleTerminal, { desc = "Terminal: [T]oggle window" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Terminal: [E]xit insert mode" })

-- Neotree
map("n", "<leader>e", "<cmd>Neotree filesystem reveal toggle<CR>", { desc = "Toggle Neotree" })

-- Diagnostic
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- File editing
map("n", "<C-s>", "<cmd>w<CR>", { desc = "[S]ave file in buffer" })
map("n", "<C-S>", "<cmd>wa<CR>", { desc = "[S]ave [A]ll files in buffers" })

-- Move lines
map("n", "<A-j>", ":m .+1<cr>==")
map("n", "<A-k>", ":m .-2<cr>==")
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi")
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi")
map("x", "<A-j>", ":m '>+1<cr>gv=gv")
map("x", "<A-k>", ":m '<-2<cr>gv=gv")

-- Gitsigns: hunk manipulation
map("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Gitsigns: [s]tage [h]unk" })
map("v", "<leader>hu", "<cmd>Gitsigns unstage_hunk<CR>", { desc = "Gitsigns: [u]nstage [h]unk" })
map("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Gitsigns: [r]eset [h]unk" })
map("n", "<leader>hi", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Gitsigns: preview [h]unk [i]nline" })
map("n", "<leader>hP", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Gitsigns: [P]review [h]unk" })
map("n", "<leader>hn", "<cmd>Gitsigns nav_hunk next<CR>", { desc = "Gitsigns: navigate to [n]ext hunk" })
map("n", "<leader>hp", "<cmd>Gitsigns nav_hunk prev<CR>", { desc = "Gitsigns: navigate to [p]revious hunk" })
map("n", "<leader>hq", "<cmd>Gitsigns setloclist<CR>", { desc = "Gitsigns: Show [h]unk location list" })

-- Gitsigns: blame
map("n", "<leader>gB", "<cmd>Gitsigns blame<CR>", { desc = "Gitsigns: [B]lame" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Gitsigns: [b]lame line" })
map(
	"n",
	"<leader>gt",
	"<cmd>Gitsigns toggle_current_line_blame<CR>",
	{ desc = "Gitsigns: [t]oggle current line blame" }
)

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope: find [f]iles" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: live [g]rep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope: [b]uffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: [h]elp tags" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Telescope: List normal mode [k]eymaps" })
map("n", "<leader>fc", builtin.git_commits, { desc = "Telescope: git [c]ommits" })
map("n", "<leader>fs", builtin.git_status, { desc = "Telescope: git [s]tatus" })
map("n", "<leader>fB", builtin.git_branches, { desc = "Telescope: [g]it [B]ranches" })
map("n", "<leader>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- Nvim-dap
local dap = require("dap")
map("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug: [t]oggle breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "Debug: [c]ontinue" })
map("n", "<leader>do", dap.step_over, { desc = "Debug: step [o]ver" })
map("n", "<leader>di", dap.step_into, { desc = "Debug: step [i]nto" })
map("n", "<leader>du", dap.step_out, { desc = "Debug: step o[u]t" })
