" Popup window movement
" Use <C-k> and <C-j> to move up and down in popup.
" Use <C-l> to accept suggestion.
" Use <Tab> to circle.
" pumvisible() ? A : B -> if cond then A else B
" inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-l>"
" inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
" NOTE: Since coc 0.8.x, custmized command is required to build autocomplete actions, see blow ../vim-plug/coc.vim

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Check link for color scheme and change them!
" https://yanpritzker.com/how-to-change-vim-syntax-colors-that-are-annoying-you-13ce55948760
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
