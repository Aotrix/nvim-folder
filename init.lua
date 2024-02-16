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
    { "rose-pine/neovim",
    config = function()
        require('theme/rose-pine')
    end,},
    
    -- LSP
    {
        {'VonHeikemen/lsp-zero.nvim',
        config = function()
            require('autocomplete/autocomplete')
        end
        },
        'neovim/nvim-lspconfig',


         {'williamboman/mason.nvim',
         config = function()
            require('mason').setup()
         end},
         'williamboman/mason-lspconfig.nvim' , -- Optional

         -- Autocompletion
         'hrsh7th/nvim-cmp' , -- Required
         'hrsh7th/cmp-nvim-lsp' , -- Required
         'hrsh7th/cmp-buffer' , -- Optional
         'hrsh7th/cmp-path' , -- Optional
         'saadparwaiz1/cmp_luasnip' , -- Optional
         'hrsh7th/cmp-nvim-lua' , -- Optional

         -- Snippets
         'L3MON4D3/LuaSnip' ,    -- Required
         'rafamadriz/friendly-snippets' , -- Optional
    },
    {"xiyaowong/transparent.nvim",
    config = function()
        require('transparent/transparent')
    end},

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
  'nvim-telescope/telescope-live-grep-args.nvim'},
      config = function()
          require('telescope/telescope')
      end
    }
})

-- nvim settings
require('nvim_settings/set')
require('nvim_settings/remap')
