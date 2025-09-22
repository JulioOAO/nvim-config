return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	ft = "python",
	keys = {
		{ ",v", "<cmd>VenvSelect<cr>" },
	},
	opts = {
		search = {
			find_venvs_cmd = {
				command = "$FD Scripts//python.exe$ $CWD --full-path --color never -HI -a -L",
			},
			find_venvs_file = {
				command = "$FD Scripts//python.exe$ $FILE_DIR --full-path --color never -HI -a -L",
			},
		},
		options = {
			statusline_func = {
				lualine = function()
					local venv_path = require("venv-selector").venv()
					if not venv_path or venv_path == "" then
						return ""
					end

					local venv_name = vim.fn.fnamemodify(venv_path, ":t")
					if not venv_name then
						return ""
					end

					local output = "enviroment: " .. venv_name
					return output
				end,
			},
		},
	},
}
