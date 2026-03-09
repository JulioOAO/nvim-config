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
		vim.lsp.enable({ "luals", "ty", "ruff", "postgres_lsp" })
	end,
}
