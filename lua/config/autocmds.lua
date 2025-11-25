-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		-- Map <leader>ca to open the code action menu
		vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: [C]ode Action" })
		-- Map <leader>rn to rename symbols
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP: [R]ename" })
	end,
})
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client.name == "ruff" then
			-- Disable hover in favor of Pyright
			client.server_capabilities.hoverProvider = false
		end
	end,
	desc = "LSP: Disable hover capability from Ruff",
})
-- Refrescar Neo-tree git status al ganar foco o cerrar terminales
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	desc = "Actualizar estado git de Neo-tree al cambiar de contexto",
	group = vim.api.nvim_create_augroup("NeoTreeGitRefresh", { clear = true }),
	callback = function()
		-- Intentamos cargar el módulo de git_status
		local success, git_status = pcall(require, "neo-tree.sources.git_status")

		-- Solo ejecutamos el refresh si el módulo se cargó correctamente
		if success then
			git_status.refresh()
		end
	end,
})
