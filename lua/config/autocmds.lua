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
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP: code [a]ction" })
		vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP: re[n]ame" })
		vim.keymap.set(
			"n",
			"<leader>lt",
			vim.lsp.buf.type_definition,
			{ buffer = bufnr, desc = "LSP: [t]ype definition" }
		)
		vim.keymap.set(
			"n",
			"<leader>li",
			vim.lsp.buf.implementation,
			{ buffer = bufnr, desc = "LSP: [i]mplementation" }
		)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { buffer = bufnr, desc = "LSP: [r]eferences" })
	end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		if client == nil then
-- 			return
-- 		end
-- 		if client.name == "ruff" then
-- 			-- Disable hover in favor of Pyright
-- 			client.server_capabilities.hoverProvider = false
-- 		end
-- 	end,
-- 	desc = "LSP: Disable hover capability from Ruff",
-- })

-- vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
-- 	desc = "Update Neo-tree's git status in context shift",
-- 	group = vim.api.nvim_create_augroup("NeoTreeGitRefresh", { clear = true }),
-- 	callback = function()
-- 		local success, git_status = pcall(require, "neo-tree.sources.git_status")
--
-- 		if success then
-- 			git_status.refresh()
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
