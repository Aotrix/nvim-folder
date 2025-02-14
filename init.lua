-- Use of lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy setup
require('lazy').setup({
    -- Loading theme
{
        "EdenEast/nightfox.nvim",
        config = function()
            require('theme/duskfox')
        end,
},
    
    -- LSP
{
         -- Autocompletion
        {'neoclide/coc.nvim' ,
        config = function()
            require('autocomplete/autocomplete')
        end ,
        branch="release"
	},

         -- Snippets
         'L3MON4D3/LuaSnip' ,    -- Required
         'rafamadriz/friendly-snippets' , -- Optional
},

{
	"xiyaowong/transparent.nvim",
	config = function()
		require('transparent/transparent')
	end
},

{
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require('treesitter/treesitter')
        end
},

{
        'nvim-lualine/lualine.nvim',
        -- dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('statusline/statusline')
        end
},

    -- Telescope
{
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim',
        'fannheyward/telescope-coc.nvim',
        'nvim-telescope/telescope-file-browser.nvim'
    	},
        config = function()
            require('telescope/telescope')
        end
},

{
        'ThePrimeagen/harpoon',
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            require('harpoon/harpoon')
        end
},

{
       'mfussenegger/nvim-dap',
       dependencies = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text',
            'nvim-neotest/nvim-nio',
            'williamboman/mason.nvim',
       },
       config = function()
           require('nvim_dap/nvim_dap')
       end
},

})

-- nvim settings
require('nvim_settings/set')
require('nvim_settings/remap')
require('nvim_settings/lsp')
