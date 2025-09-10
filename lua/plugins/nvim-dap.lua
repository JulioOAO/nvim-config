return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'mfussenegger/nvim-dap-python',
    },
    config = function()
        local dap, dapui = require('dap'), require('dapui')
        local project = require("utils.py_root_helper")
        require('dap-python').setup()
        dapui.setup()
        dap.set_log_level("TRACE")
        dap.adapters.python = {
            type = 'executable',
            command = vim.fn.exepath('python'),
            args = { '-m', 'debugpy.adapter' },
        }
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file (script)",
                program = "${file}",
                console = "internalConsole",
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
    end
}
