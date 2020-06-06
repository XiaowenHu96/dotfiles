"
" I use vimtex for building latex.
" And texlab for linting, completion.
"
" Vimtex is great for building, getting feedback but not so good 
" for providing completion, linting.
"
"

let g:tex_flavor = "latex"
let g:vimtex_view_method = 'zathura'
let g:vimtext_compiler_progname="nvr"


" Note: The Zathura and MuPDF viewers, if used, add a hook to this list in
"       order to store the viewer X window ID in order to prevent multiple
"       viewer windows. (See help vim-tex)
let g:vimtex_compiler_callback_hooks = ['ZathuraHook']

function! ZathuraHook(status)
  echom a:status
endfunction

" Basic compile flags
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" Manage compile output 1 for on 0 for off
let g:vimtex_quickfix_latexlog = {
      \ 'default' : 1,
      \ 'general' : 1,
      \ 'references' : 1,
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'font' : 1,
      \ 'packages' : {
      \   'default' : 1,
      \   'general' : 1,
      \   'babel' : 1,
      \   'biblatex' : 1,
      \   'fixltx2e' : 1,
      \   'hyperref' : 1,
      \   'natbib' : 1,
      \   'scrreprt' : 1,
      \   'titlesec' : 1,
      \ },
      \}

" Tex file specific command
augroup TexFileSetting
    autocmd!
    " Set maximum line length when working in tex file
    autocmd FileType tex setlocal textwidth=79 fo+=l

    " When enter new line, auto warp the text
    " TODO: need a if-test on text number
    "autocmd BufWinEnter *.tex inoremap <buffer> <cr> <esc>gqqo
    
    " Open spell checker when enter tex
    autocmd FileType tex setlocal spell spelllang=en_us

    " Add some customized autopairs
    " \( -> \(<cursor>\)
    autocmd FileType tex inoremap <buffer> \( \(\)<left><left>
    " $ -> $cursor$
    autocmd FileType tex inoremap <buffer> $ $$<left>
    " $$ -> $$cursor$$
    autocmd FileType tex inoremap <buffer> $$ $$$$<left><left>

augroup END
