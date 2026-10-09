return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Disable netrw at the very start of your init.lua / config
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			-- Add any custom settings here
			disable_netrw = false,
			hijack_netrw = true,
		})

		local api = require("nvim-tree.api")

		local function opts(desc)
			local bufnr = vim.api.nvim_get_current_buf()
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end
		-- Keymap to toggle the tree
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>, { silent = true }")
		vim.keymap.set("n", "<leader>v", api.node.open.vertical, opts("Open: Vertical Split"))
	end,
}
