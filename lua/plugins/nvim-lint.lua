return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Configuramos sqlfluff para los archivos SQL
		lint.linters_by_ft = {
			sql = { "sqlfluff" },
			pgsql = { "sqlfluff" },
		}

		lint.linters.sqlfluff.args = {
			"lint",
			"--format=json",
			"--dialect=postgres", -- Asegúrate de que este sea tu dialecto
			"-", -- Este guion le dice a sqlfluff que lea de la memoria (stdin)
		}

		-- Grupo de autocomandos para ejecutar el linter automáticamente
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Ejecuta el linter al abrir el archivo, al guardar, y al salir del modo insertar
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
