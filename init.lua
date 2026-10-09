-- Force Neovim integrated terminal to use WSL instead of CMD
-- if vim.fn.has("win32") == 1 then
-- 	vim.o.shell = "wsl.exe"
-- 	vim.o.shellcmdflag = "-e"
-- end
pcall(require, "config.secrets")
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")
