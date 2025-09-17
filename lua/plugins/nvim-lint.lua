-- lua/plugins/lint.lua
return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufReadPost", "InsertLeave" },
	config = function()
		-- Configura tus "linters" por tipo de archivo
		require("lint").linters_by_ft = {
			python = { "pylint" },
		}

		-- Activa el linting automáticamente con autocommands
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("linting", { clear = true }),
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
