return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },

	-- example using `opts` for defining servers
	opts = {
		servers = {
			pyright = {},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			},
		},
	},
	config = function(_, opts)
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities, if you've defined it
			config.capabilities = capabilities
			lspconfig[server].setup(config)
		end
	end,
}
