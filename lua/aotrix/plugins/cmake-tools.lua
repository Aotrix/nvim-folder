return {
    'Civitasv/cmake-tools.nvim',
    opts = {},
    config = function()
        local osys = require("cmake-tools.osys")
        require("cmake-tools").setup {
            cmake_command = "cmake", -- this is used to specify cmake command path
            ctest_command = "ctest", -- this is used to specify ctest command path
            cmake_use_preset = true,
            cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
            cmake_generate_options = {"-DCMAKE_EXPORT_COMPILE_COMMANDS=1"}, -- this will be passed when invoke `CMakeGenerate`
            cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
            -- support macro expansion:
            --       ${kit}
            --       ${kitGenerator}
            --       ${variant:xx}
            cmake_build_directory = function()
                if osys.iswin32 then
                    return "out\\${variant:buildType}"
                end
                return "out/${variant:buildType}"
            end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
            cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
            cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
            cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
            cmake_variants_message = {
                short = {show = true}, -- whether to show short message
                long = {show = true, max_length = 40} -- whether to show long message
            },
            cmake_dap_configuration = { -- debug settings for cmake
                name = "cpp",
                type = "codelldb",
                request = "launch",
                stopOnEntry = false,
                runInTerminal = true,
                console = "integratedTerminal"
            },
            cmake_executor = { -- executor to use
                name = "toggleterm", -- name of the executor
                opts = {
                    toggleterm = {
                        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                        close_on_exit = false, -- whether close the terminal when exit
                        auto_scroll = true, -- whether auto scroll to the bottom
                        singleton = true -- single instance, autocloses the opened one, if present
                    }
                } -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
            },
            cmake_runner = { -- runner to use
                name = "toggleterm", -- name of the runner
                opts = {
                    toggleterm = {
                        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                        close_on_exit = false, -- whether close the terminal when exit
                        auto_scroll = true, -- whether auto scroll to the bottom
                        singleton = true -- single instance, autocloses the opened one, if present
                    }
                } -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
            },
            cmake_notifications = {
                runner = {enabled = true},
                executor = {enabled = true},
                spinner = {
                    "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧",
                    "⠇", "⠏"
                }, -- icons used for progress display
                refresh_rate_ms = 100 -- how often to iterate icons
            },
            cmake_virtual_text_support = false -- Show the target related to current file using virtual text (at right corner)
        }
        vim.keymap.set("n", "mt", "<CMD>CMakeRun<CR>")
    end
}
