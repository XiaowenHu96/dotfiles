call plug#begin('~/.config/nvim/autoload/plugged')

" Things you can do with fzf and Vim.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Show git diff in Vim
Plug 'airblade/vim-gitgutter'

" Move between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" Minimal completion engine.
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    " Dependecy for deoplete to run on vim only. Install them anyway.
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Minimal file exploer
if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Ranger file exploer
" Note: This is a less famous plugin, may have dev issue.
" Ranger.vim as alternative
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim' , {'for' : ['lisp', 'scheme'] }

" C++ highlight extentsion
Plug 'octol/vim-cpp-enhanced-highlight'

" Souffle syntax highlight"
Plug 'souffle-lang/souffle.vim'

" Haskell highlight
Plug 'neovimhaskell/haskell-vim'

" Vim Markdown enhancement "
Plug 'plasticboy/vim-markdown'

" Surround.vim: quoting/parenthesizing made simple 
Plug 'tpope/vim-surround'

" Commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" repeat.vim: enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" ReplaceWithRegister
Plug 'vim-scripts/ReplaceWithRegister'

" Auto closeof quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" Vim airline theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Multi-cursor
" Note: Bad performance, slow down vim.
" Plug 'terryma/vim-multiple-cursors'

" Gruvbox colorscheme
" Note: Use my own gurvbox which fix the haskell-vim theme overriden by the
Plug 'XiaowenHu96/gruvbox'

" Vim-dark colorscheme
Plug 'XiaowenHu96/onedark.vim', { 'branch': 'ALESupport' }

" Vim latex editor
Plug 'https://github.com/lervag/vimtex'

" LanguageClient-Neovim support Vim and NVim with LSP.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }

" Vim-slime, send buffer to terminal.
Plug 'jpalardy/vim-slime'

" Vim plugin that shows keybindings in popup
Plug 'liuchengxu/vim-which-key'

" The fastest Neovim colorizer.
" Note: Neovim ONLY
Plug 'norcalli/nvim-colorizer.lua'

" Snippet editor.
Plug 'SirVer/ultisnips'

" The fancy start screen for Vim. (Also a session manager)
Plug 'mhinz/vim-startify'

call plug#end()
