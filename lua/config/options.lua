-- Basic settings
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.tabstop = 4 -- Number of spaces a tab represents
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Automatically indent new lines

-- vim.opt.wrap = false                    -- Disable line wrapping
vim.opt.cursorline = true -- Highlight the current line
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.mouse = "a" -- Can be useful for resizing splits
vim.opt.clipboard:append("unnamedplus") -- Append yanked text to system clipboclipboard
vim.opt.winborder = "single" -- Add border to hoover windows
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.g.have_nerd_font = true
vim.opt.inccommand = "split" -- o "nosplit"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "1" -- Show a fold tracking column on the left side
vim.opt.foldtext = "" -- Keeps original syntax highlighting on folded lines

-- Syntax highlighting and filetype plugins
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Neovim's Theme
require("catppuccin").setup()
vim.cmd.colorscheme("catppuccin")

-- LSP Configurations
vim.diagnostic.config({ virtual_lines = true })
