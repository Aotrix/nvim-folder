return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        'nvim-telescope/telescope-ui-select.nvim',
    },

    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<esc>"] = actions.close,
                    }
                }
            },
            extensions = {
                fzf = {},
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        })

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        vim.keymap.set("n", "<leader>pv", function() require("telescope").extensions.file_browser.file_browser() end)
        vim.keymap.set("n", "<leader>pf", function() require("telescope.builtin").find_files() end)
        vim.keymap.set("n", "gd", function() require("telescope.builtin").lsp_definitions() end)

        require('aotrix.multigrep').setup()
    end
}
