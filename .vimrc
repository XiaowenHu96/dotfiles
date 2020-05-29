call plug#begin('~/.vim/plugged')

" Things you can do with fzf and Vim.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
map <C-W>\ :NERDTreeToggle<CR>


" Show git diff in Vim
Plug 'airblade/vim-gitgutter'

" Snippet editor.
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<C-n>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
let g:UltiSnipsEditSplit="horizontal"

" A code-completion engine for Vim 
" We set update to forzen because YCM is tricky to build and we better don't touch it.
" Plug 'Valloric/YouCompleteMe', { 'for' : ['c'] ,'frozen' : 1 }   
" let g:ycm_filetype_specific_completion_to_disable = {}
" let g:ycm_global_ycm_extra_conf = '~/ycm_temp/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_always_populate_location_list = 1 " Let YCM update loc list automatically
" let g:ycm_autoclose_preview_window_after_completion = 1
" Important config for ycm.conf, pass filetype to vim so ycm can choose compiler
" let g:ycm_extra_conf_vim_data = [ '&filetype' ]
" Optional: Setup python complete to use the correct py3	
" let g:ycm_python_binary_path = '/usr/bin/python3'
" Let YCm collect identifier from tags file
" let g:ycm_collect_identifiers_from_tags_files = 1


" Move between vim and tmux
Plug 'christoomey/vim-tmux-navigator'


" Interpreter color code and show color in vim
Plug 'ap/vim-css-color'


" Deoplete, autocomplete, use for file that YCM doesnot support
" use for : ['*'] to loaded for all ft
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
endif
" Dependecy for deoplete to run on vim. Install them anyway.
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_refresh_delay = 200
" Config: Use <C-k> and <C-j> to move up and down.
" Use <C-l> to accept suggestion.
" Use <Tab> to circle.
" pumvisible() ? A : B -> if cond then A else B
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-l>"
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<TAB>"

" Rainbow Parentheses
Plug 'junegunn/rainbow_parentheses.vim' , {'for' : ['lisp', 'scheme'] }


" C++ highlight extentsion"
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_no_function_highlight = 1 "disable function highlight


" Souffle syntax highlight"
Plug 'souffle-lang/souffle.vim'


" Haskell highlight
Plug 'neovimhaskell/haskell-vim'
" Config:
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords<Paste>
let g:haskell_indent_if = 2
let g:haskell_indent_do = 2

" Vim Markdown enhancement "
Plug 'plasticboy/vim-markdown'

" Vim Language enhancement Pack
" Don't really need it.
" Plug 'sheerun/vim-polyglot' 

" Vim Clang-format intergration
Plug 'rhysd/vim-clang-format'
" Config: Create keymapping for clang-format
autocmd FileType c,cpp,objc,java nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,java vnoremap <buffer><Leader>cf :ClangFormat<CR>


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
let g:airline_extensions = []
set laststatus=2
" Notice: May have bed performance and slow down vim.


" Multi-cursor
Plug 'terryma/vim-multiple-cursors'
" Notice: Bad performance, slow down vim.


" My Vim theme.
" Note: Use my own gurvbox which fix the haskell-vim theme overriden by the
" gruvbox
Plug 'XiaowenHu96/gruvbox'
" Config: Support italic
let g:gruvbox_italic=1

" Try another theme just for fun. Note: didn't like it.
Plug 'dracula/vim', { 'as': 'dracula' }

" Vim-one colorscheme
Plug 'rakr/vim-one'

" Vim-dark colorscheme
Plug 'XiaowenHu96/onedark.vim', { 'branch': 'ALESupport' }


" Vim Window resize helper
" Plug 'https://github.com/simeji/winresizer'


" Vim latex editor
Plug 'https://github.com/lervag/vimtex'
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" Support backward search form neo-vim
let g:vimtext_compiler_progname="nvr"


" Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support.
" Note: I disable ALE because it seems like to have less support than
" LanguageClient-Server.
" 1. ALE cannot use build-in formatting from the linter.
" 2. ALE does not provide renaming, references and document Symbol from the linter.
        " Plug 'dense-analysis/ale'
        " let g:ale_linters = {'haskell': ['hie']}
        " let g:ale_fixers = {'haskell': ['brittany']}
        " " Only run linter which we specified 
        " let g:ale_linters_explicit = 1
        " nmap <Leader>ad <Plug>(ale_go_to_definition)
        " nmap <Leader>ah <Plug>(ale_hover)
        " nmap <Leader>af <Plug>(ale_fix)


" LanguageClient-Neovim support Vim and NVim with LSP.
" Note: This is the coolest LSP I've ever seen. I should consider fully integrate
" with it.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }
let g:LanguageClient_serverCommands = { 
    \ 'haskell': ['hie-wrapper'],
    \ 'python' : ['pyls'],
	\ 'cpp' : ['clangd'],
	\ 'c' : ['clangd'],
    \ }
" Disable virtual text 
let g:LanguageClient_useVirtualText = "No"
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>le :call LanguageClient#explainErrorAtPoint()<CR>
map <Leader>lh :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>


" Vim-slime, send buffer to terminal.
Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_haskell_ghci_add_let = 0


call plug#end()

"""" 
"""" This section contains config for plugins that can only be set after plug#end().
""""

" Use space as leader key.
map <space> <leader>

set termguicolors

syntax on
filetype plugin indent on

" Open colorscheme
" gruvbox colorscheme
" colorscheme gruvbox

" Onedark colorscheme.
let g:onedark_terminal_italics = 1
" Change comment color and white color, it was too dark.
" Cterm and cterm16 are set to zero. Won't work if 24-bit is not supported.
" White: f2f2f2 (bright) or dedede (dark)
" TODO: I want to brighten all the color by around 10%.
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#616c86", "cterm": "0", "cterm16": "0" },
\ "white": {"gui": "#dedede", "cterm": "0", "cterm16": "0" },
\}
" Change the color of line number. It was too dark.
augroup colorset
	autocmd!
	let s:line_grey = { "gui": "#7f7f7f", "cterm": "145", "cterm16" : "7" }
	autocmd ColorScheme * call onedark#set_highlight("LineNr", { "fg": s:line_grey }) " `bg` will not be styled since there is no `bg` setting
augroup END

colorscheme onedark

"" dracula colorscheme
" colorscheme dracula 
" let g:airline_theme = 'dracula'


" Set GUI font.
" set term=xterm-256color " Note: when using xterm-256, cannot show undersocre
" set guifont=Menlo\ 18 "use for gvim syntax
" set guifont=FiraCode:h18 "use on nvim 

" Support mouse scroll in vim terminal
set mouse=a 

" Tab and Space
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Config: Use two space indent for scheme and Haskell file, not smart tab.
autocmd FileType scheme,haskell setlocal shiftwidth=2 tabstop=2 expandtab smarttab

" Line number
set relativenumber
set nu rnu

" Backspace configure for vim  (no need for neovim)
set backspace=indent,eol,start

" Following command change the cursor appearance according to insert/normal mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Following code fix terminal vim not displaying italics. 
" This issues may not happen on other computer, should be commented
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"

" Note: On my unbuntu18, pastes from vim to system buffer sometimes
" cause a pause (maybe due to improper flush)
set clipboard=unnamedplus

" Add keybind to enter normal mode in neovim terminal. 
" (Since Esc conflict with zsh-vim mode)
if has('nvim') 
tnoremap <C-[> <C-\><C-n>
endif 

"Turnoff beeping
set visualbell
" Disable window flashes (visual bell) but This turn on the sound bell again
set novb

" Customize Command to turn on spell checker
command SpellOn execute "set spell spelllang=en_us"
command SpellOff execute "set spell spelllang="
" map <leader>Ss -> spell suggest
map <Leader>Ss z=

" Let vim search tags file until meet root
set tags=tags;/ 

" Auto save view when exit file and auto load view when open
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" Map <leader>ff to FZF.vim
map <Leader>ff :Files <CR>

" This is nuts, check link for color scheme and change them!
" https://yanpritzker.com/how-to-change-vim-syntax-colors-that-are-annoying-you-13ce55948760
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

set encoding=UTF-8

" Solve Kitty display issue?
let &t_ut=''
