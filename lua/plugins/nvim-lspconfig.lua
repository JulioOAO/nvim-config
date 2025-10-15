return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"Saghen/blink.cmp",
	},
	config = function()
		vim.lsp.config["luals"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
						library = {
							"${3rd}/luv/library",
							unpack(vim.api.nvim_get_runtime_file("", true)),
						},
					},
				},
			},
		}
		vim.lsp.config["pyright"] = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_markers = {
				"pyproject.toml",
				"setup.py",
				"setup.cfg",
				"requirements.txt",
				"Pipfile",
				"pyrightconfig.json",
				".git",
			},
			settings = {
				pyright = {
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
						ignore = { "*" },
					},
				},
			},
		}
		vim.lsp.config["ruff"] = {
			init_options = {
				settings = {
					logLevel = "debug",
				},
			},
		}
		vim.lsp.enable({ "luals", "pyright", "ruff" })
	end,
}
