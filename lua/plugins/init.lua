local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    { 'mbbill/undotree', },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { "numToStr/Comment.nvim", },
    { 'voldikss/vim-floaterm' },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },
    -- LSP Support
    -- {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v2.x',
    --     dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig', }, -- Required
    {                             -- Optional
        'williamboman/mason.nvim',
        run = function()
            vim.cmd('MasonUpdate')
        end,
    },
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    { 'j-hui/fidget.nvim',                tag = 'legacy', opts = {} },
    { 'folke/neodev.nvim', },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },     -- the completion plugin
    { 'hrsh7th/cmp-buffer' },   -- buffer completions
    { 'hrsh7th/cmp-path' },     -- path completions
    { 'hrsh7th/cmp-nvim-lsp' }, -- lsp completions
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        }
    }, -- Required
    --     }
    -- },
    { 'mhartington/formatter.nvim' },
    { 'nullishamy/autosave.nvim' }
}

local opts = {}

require("lazy").setup(plugins, opts)
