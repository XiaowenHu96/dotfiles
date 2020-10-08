" Load plugin first
source $HOME/.config/nvim/vim-plug/plugins.vim
" Load keybindings
source $HOME/.config/nvim/keys/keys.vim
" Load general settings
source $HOME/.config/nvim/general/settings.vim
" Theme: Onedark
source $HOME/.config/nvim/vim-plug/onedark.vim

"
" Settings for plugins.
"

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-cpp-enhanced-highlight
let g:cpp_no_function_highlight = 1     " disable function highlight

" Vim-slime, send buffer to terminal
let g:slime_target = "tmux"
let g:slime_haskell_ghci_add_let = 0

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

" rnvimr -- ranger exploer in vim
let g:rnvimr_ex_enable = 1         " Set Ranger as default file exploer
let g:rnvimr_pick = 1              " Make Ranger to be hidden after pick a file

" Airline
" Note: From my experience airline is slow, 
" consider disable if performance is hurt.
source $HOME/.config/nvim/vim-plug/airline.vim

" Auto-pair
source $HOME/.config/nvim/vim-plug/auto-pair.vim

" fzf-vim
source $HOME/.config/nvim/vim-plug/fzf-vim.vim

" vimtex
source $HOME/.config/nvim/vim-plug/vimtex.vim

" LanguageClient-neovim
" source $HOME/.config/nvim/vim-plug/LanguageClient-neovim.vim

" nvim-colorizer
luafile $HOME/.config/nvim/vim-plug/nvim-colorizer.lua

" Ultisnips
source $HOME/.config/nvim/vim-plug/ultisnips.vim

" vim-startify
source $HOME/.config/nvim/vim-plug/vim-startify.vim

" Coc.nvim
source $HOME/.config/nvim/vim-plug/coc.vim

" Finally load which-key
source $HOME/.config/nvim/vim-plug/which-key.vim

" Coq
source $HOME/.config/nvim/vim-plug/coqtail.vim
