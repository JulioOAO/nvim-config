return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "cmake" },
	},
	opts = {
		defaults = {
			layout_config = {
				horizontal = {
					width = 0.99,
					height = 0.99,
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
		extensions = {
			fzf = {},
		},
	},
}
