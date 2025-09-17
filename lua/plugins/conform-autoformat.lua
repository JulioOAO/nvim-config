-- lua/plugins/conform-autoformat.lua
return {
	-- Arreglo #1: El nombre del plugin se separa de la configuración.
	"stevearc/conform.nvim",

	-- El resto de la configuración va como claves de la tabla principal.
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Arreglo #2: Estructura explícita para el atajo de teclado,
			-- que aunque funcional, el linter estricto puede marcar.
			-- Separar la configuración en `opts` es más limpio.
			"<leader>bf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Buffer: [F]ormat current one",
		},
	},
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			toml = { "taplo" },
		},
	},
}
