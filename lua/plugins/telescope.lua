return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			layout_config = {
				horizontal = {
					preview_width = 0.5,
				},
			},
		},
		pickers = {
			buffers = {
				mappings = {
					i = {
						["<A-d>"] = require("telescope.actions").delete_buffer,
					},
					n = {
						["<A-d>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
		},
	},
}
