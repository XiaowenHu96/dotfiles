-- Store plugins in user data dir (~/.local/nvim/)
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- auto install packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print "Installing packer ..."
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Done, please restart neovim"
    vim.cmd [[packadd packer.nvim]]
end

local packer = require("packer")

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Plugins goes here
return packer.startup(function(use)
    -- basics
    use "wbthomason/packer.nvim"          -- Have packer manage itself
    use "nvim-lua/popup.nvim"             -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"           -- Useful lua functions used lots of plugins
    -- Misc
    use "alexghergh/nvim-tmux-navigation" -- moved from vim-tmux-navigator
    use {                                 -- rainbow parenthesis
        "luochen1990/rainbow",
        ft = { 'lisp', 'scheme' }
    }
    use "souffle-lang/souffle.vim"
    use "nvim-tree/nvim-web-devicons"
    use "tpope/vim-surround"          -- quoting/parenthesizing made simple
    use "tpope/vim-fugitive"          -- A Git wrapper so awesome, it should be illegal
    use "tpope/vim-commentary"        -- comment stuff out (see Comment.nvim and ts-context comment if looking for an upgrade)
    use 'vim-scripts/ReplaceWithRegister'
    use 'norcalli/nvim-colorizer.lua' -- The fastest Neovim colorizer.
    use 'mhinz/vim-startify'          -- switch to dashboard
    -- use {
    --     'glepnir/dashboard-nvim',
    --     requires = { 'nvim-tree/nvim-web-devicons' }
    -- }
    use 'windwp/nvim-autopairs' -- autopair neovim version
    use { 'vimwiki/vimwiki',    -- vimwiki -- switched to nvim-org
        config = function()
            vim.g.vimwiki_conceallevel = 0
        end
    }
    use 'nvim-orgmode/orgmode'
    use 'godlygeek/tabular'    -- vim tabular
    use 'tpope/vim-rhubarb'    -- Add GBrowse feature for fugitive
    use "folke/which-key.nvim" -- WhichKey neovim (I switched from vim-which-key)
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires =
        { 'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'sharkdp/fd',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } }
    }
    use 'lewis6991/gitsigns.nvim' -- Moved from vim-gitgutter
    use 'nvim-tree/nvim-tree.lua'
    use 'folke/todo-comments.nvim'
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use { 'lervag/vimtex' } -- disable vimtex in favour of texlab
    use { "akinsho/toggleterm.nvim" }

    -- lualine
    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
    use 'arkav/lualine-lsp-progress'
    --- completion
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use "saadparwaiz1/cmp_luasnip"
    use 'hrsh7th/nvim-cmp'
    use 'akh2008/cmp-omni'
    -- LSP
    use { "williamboman/mason.nvim", run = ":MasonUpdate" }
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    use 'lvimuser/lsp-inlayhints.nvim' -- temporary tool for inlay support.
    use 'jose-elias-alvarez/null-ls.nvim'

    -- snip
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'

    -- copilot
    use 'github/copilot.vim'
    use 'hrsh7th/cmp-copilot'

    -- chatgpt
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

    -- colorscheme
    use { 'shaunsingh/nord.nvim' }
    use { 'AlexvZyl/nordic.nvim' }
    use { "folke/tokyonight.nvim" }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "sainnhe/gruvbox-material" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
