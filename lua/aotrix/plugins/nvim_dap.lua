return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
    },

    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        require("dapui").setup()
        require("nvim-dap-virtual-text").setup()
        require("mason").setup()

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end

        vim.keymap.set("n", "<leader>b", function() require("dap").toggle_breakpoint() end)
        vim.keymap.set("n", "<leader>gb", function() require("dap").run_to_cursor() end)
        -- Eval var under cursor
        vim.keymap.set("n", "<leader>?", function()
            require("dapui").eval(nil, { enter = true })
        end)
        vim.keymap.set("n", "<F1>", function() require("dap").continue() end)
        vim.keymap.set("n", "<F2>", function() require("dap").step_into() end)
        vim.keymap.set("n", "<F3>", function() require("dap").step_over() end)
        vim.keymap.set("n", "<F4>", function() require("dap").step_out() end)
        vim.keymap.set("n", "<F5>", function() require("dap").step_back() end)
        vim.keymap.set("n", "<F13>", function() require("dap").restart() end)

    end,
}

