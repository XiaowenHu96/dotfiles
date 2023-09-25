-- Store plugins in user data dir (~/.local/nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- bootstrap lazy.nvim
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

require("lazy").setup({
    -- basics
    { "nvim-lua/popup.nvim" },             -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" },           -- Useful lua functions used lots of plugins
    { 'MunifTanjim/nui.nvim' },            -- UI Component Library for Neovim.
    -- Misc
    { "alexghergh/nvim-tmux-navigation" }, -- moved from vim-tmux-navigator
    {
        -- rainbow parenthesis
        "luochen1990/rainbow",
        ft = { 'lisp', 'scheme' }
    },
    { "souffle-lang/souffle.vim" },
    { "nvim-tree/nvim-web-devicons" },
    { "tpope/vim-surround" },          -- quoting/parenthesizing made simple
    { "tpope/vim-fugitive" },          -- A Git wrapper so awesome, it should be illegal
    { "tpope/vim-commentary" },        -- comment stuff out (see Comment.nvim and ts-context comment if looking for an upgrade)
    { 'vim-scripts/ReplaceWithRegister' },
    { 'norcalli/nvim-colorizer.lua' }, -- The fastest Neovim colorizer.
    { 'mhinz/vim-startify' },          -- switch to dashboard
    { 'windwp/nvim-autopairs' },       -- autopair neovim version
    {
        'vimwiki/vimwiki',             -- vimwiki -- switched to nvim-org
        config = function()
            vim.g.vimwiki_conceallevel = 0
        end
    },
    { 'nvim-orgmode/orgmode' },
    { 'godlygeek/tabular' },    -- vim tabular
    { 'tpope/vim-rhubarb' },    -- Add GBrowse feature for fugitive
    { "folke/which-key.nvim" }, -- WhichKey neovim (I switched from vim-which-key)
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies =
        { 'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'sharkdp/fd',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    { 'lewis6991/gitsigns.nvim' }, -- Moved from vim-gitgutter
    { 'nvim-tree/nvim-tree.lua' },
    { 'folke/todo-comments.nvim' },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    { 'lervag/vimtex' }, -- disable vimtex in favour of texlab
    { "akinsho/toggleterm.nvim" },

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },
    { 'arkav/lualine-lsp-progress' },
    --- completion
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { "saadparwaiz1/cmp_luasnip" },
    { 'hrsh7th/nvim-cmp' },
    { 'akh2008/cmp-omni' },
    -- LSP
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate"
    },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { 'lvimuser/lsp-inlayhints.nvim' }, -- temporary tool for inlay support.
    { 'jose-elias-alvarez/null-ls.nvim' },

    -- snip
    { 'L3MON4D3/LuaSnip' },
    { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

    -- treesitter
    { 'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate' },
    { 'nvim-treesitter/playground' },

    -- copilot
    { 'github/copilot.vim' },
    { 'hrsh7th/cmp-copilot' },

    -- chatgpt
    -- TODO: Choose alternative or re-config
    -- {
    --     "jackMort/ChatGPT.nvim",
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim"
    --     }
    -- },

    -- colorscheme
    { 'shaunsingh/nord.nvim' },
    { 'AlexvZyl/nordic.nvim' },
    { "folke/tokyonight.nvim" },
    { "catppuccin/nvim",         name = "catppuccin" },
    { "sainnhe/gruvbox-material" },

})
