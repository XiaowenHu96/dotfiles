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

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print "Could not load packer..."
    return
end

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
    use "wbthomason/packer.nvim"         -- Have packer manage itself
    use "nvim-lua/popup.nvim"            -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"          -- Useful lua functions used lots of plugins
    --
    use "christoomey/vim-tmux-navigator" -- navigate seamlessly between vim and tmux
    use {                                -- rainbow parenthesis
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
    use 'mhinz/vim-startify'          -- The fancy start screen for Vim. (Also a session manager)
    use 'windwp/nvim-autopairs'       -- autopair neovim version
    use 'vimwiki/vimwiki'             -- vimwiki
    use 'godlygeek/tabular'           -- vim tabular
    use 'tpope/vim-rhubarb'           -- Add GBrowse feature for fugitive
    use "folke/which-key.nvim"        -- WhichKey neovim (I switched from vim-which-key)
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim',
                'BurntSushi/ripgrep', -- also require ripgrep on system
                'sharkdp/fd',
                { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } } }
    }
    use 'lewis6991/gitsigns.nvim' -- Moved from vim-gitgutter
    use 'nvim-tree/nvim-tree.lua'
    use 'folke/todo-comments.nvim'
    use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use { 'lervag/vimtex' }
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
    -- snip
    use 'L3MON4D3/LuaSnip'
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'

    -- colorscheme
    use 'shaunsingh/nord.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)