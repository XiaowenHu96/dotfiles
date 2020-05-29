" Load plugin first
source $HOME/.config/nvim/vim-plug/plugins.vim
" Load keybindings
source $HOME/.config/nvim/keys/keys.vim
" " Onedark
source $HOME/.config/nvim/vim-plug/onedark.vim
" " Load general settings
source $HOME/.config/nvim/general/settings.vim

"
" Settings for plugins.
"

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-cpp-enhanced-highlight
let g:cpp_no_function_highlight = 1     " disable function highlight

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords<Paste>
let g:haskell_indent_if = 2
let g:haskell_indent_do = 2

" vim-ariline
let g:airline_extensions = []

" vimtex
source $HOME/.config/nvim/vim-plug/vimtex.vim

" LanguageClient-neovim
source $HOME/.config/nvim/vim-plug/LanguageClient-neovim.vim

" Vim-slime, send buffer to terminal
let g:slime_target = "tmux"
let g:slime_haskell_ghci_add_let = 0

" Finally load which-key
source $HOME/.config/nvim/vim-plug/which-key.vim
