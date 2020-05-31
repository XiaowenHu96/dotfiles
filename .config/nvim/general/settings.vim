" set leader key
let g:mapleader = "\<Space>"

syntax enable 

" Multi buffers
set hidden

" Support mouse scroll in vim terminal
set mouse=a 

" Tab and Space
set tabstop=4               " 4 spaces for tab
set shiftwidth=4            " indentation spaces
set smarttab                " Smart tabs
set expandtab               " Expand tab to spaces.

" Indention
set autoindent

" Line number
set relativenumber
set nu rnu

" Set backspace behavior
set backspace=2

" Set how new window is placed
set splitright
"set splitbelow

" Copy paste system register
set clipboard=unnamedplus

"Turnoff beeping
set visualbell
set novb

" 'Set termguicolors' to use terminal color
set termguicolors

" Let vim search tags file until meet root (nvim does that by default)
set tags=tags;/ 

" leader key timeout
set timeoutlen=500 

" set colorscheme in seperate theme file

" For airline
set laststatus=2

" Auto save view when exit file and auto load view when open
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup END
