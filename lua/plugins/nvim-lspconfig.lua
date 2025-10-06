return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	-- example using `opts` for defining servers
	opts = {
		servers = {
			pyright = {},
			pylsp = {},
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
		local project = require("utils.py_root_helper")
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		local lspconfig = require("lspconfig")
		-- local pyright_config = opts.servers.pyright
		-- pyright_config.capabilities = capabilities
		-- pyright_config.before_init = function(_, config)
		-- 	local python_executable = project.detect_venv_python(config.root_dir)
		-- 	if python_executable then
		-- 		vim.print("Pyright: Using Python executable -> ", python_executable)
		-- 		-- Le damos a Pyright la ruta exacta en lugar de dejar que la busque.
		-- 		config.settings.python = {
		-- 			pythonPath = python_executable,
		-- 		}
		-- 	else
		-- 		vim.print("Pyright: Could not find Python executable in venv.")
		-- 	end
		-- end
		-- lspconfig.pyright.setup(pyright_config)
		-- opts.servers.pyright = nil
		local pylsp_config = opts.servers.pylsp
		pylsp_config.capabilities = capabilities
		pylsp_config.before_init = function(_, config)
			local pylsp_executable = project.detect_venv_pylsp(config.root_dir)
			if pylsp_executable then
				vim.print("Pylsp: Using executable -> ", pylsp_executable)
				-- Le decimos a lspconfig exactamente qué ejecutable correr
				pylsp_config.cmd = { pylsp_executable }
			end
		end
		lspconfig.pylsp.setup(pylsp_config)
		opts.servers.pylsp = nil
		for server, config in pairs(opts.servers) do
			if server then
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end
		end
	end,
}
