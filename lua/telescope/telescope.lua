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
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.preview_scrolling_down,
                ["<C-p>"] = actions.preview_scrolling_up,
                ["<esc>"] = actions.close,
            }
        }
    },
    extensions = {
        coc = {
            theme = 'ivy',
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
            push_cursor_on_edit = true, -- save the cursor position to jump back in the future
            timeout = 3000, -- timeout for coc commands
        },
        fzf = {}
    },
})
require('telescope').load_extension('coc')
require('telescope').load_extension('fzf')
