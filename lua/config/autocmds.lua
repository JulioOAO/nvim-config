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
