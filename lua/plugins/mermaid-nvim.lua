return {
	"kevalin/mermaid.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("mermaid").setup({
			preview = {
				theme = "catppuccin-latte",
			},
		})

		-- Install the Tree-sitter parser:
		-- :TSInstall mermaid
	end,
}
