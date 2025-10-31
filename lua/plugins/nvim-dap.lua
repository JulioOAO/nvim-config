return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local project = require("utils.py_root_helper")
		dapui.setup()
		dap.set_log_level("TRACE")
		local function get_venv_python_path()
			local file = vim.fn.expand("%:p")
			local venv_python = project.detect_venv_python(file)
			return venv_python or "python"
		end
		dap.adapters.python = {
			type = "executable",
			command = vim.fn.exepath("python"),
			args = { "-m", "debugpy.adapter" },
		}
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file (script)",
				program = "${file}",
				console = "internalConsole",
				pythonPath = get_venv_python_path,
			},
			{
				type = "python",
				request = "launch",
				name = "Launch file (module or fallback)",
				module = function()
					local file = vim.fn.expand("%:p")
					local root = project.detect_root(file)

					if root then
						local rel = file:sub(#root + 2)
						rel = rel:gsub("/", "."):gsub("\\", "."):gsub("%.py$", "")
						return rel
					end
				end,
				console = "internalConsole",
				pythonPath = get_venv_python_path,
			},
			{
				type = "python",
				request = "launch",
				name = "Debug pytest (test under cursor)",
				module = "pytest",
				args = function()
					local test_name = vim.fn.expand("<cword>")
					local k_filter = vim.fn.input("Pytest filter: -k: ", test_name)
					if k_filter == "" then
						print("DAP launch aborted. There was not -k filter.")
						return nil
					end
					return {
						"-v",
						"-k",
						k_filter,
						"${file}",
					}
				end,
				console = "integratedTerminal",
				pythonPath = get_venv_python_path,
			},
		}
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
