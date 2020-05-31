let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" Support backward search form neo-vim
let g:vimtext_compiler_progname="nvr"

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
    " using FileType doesn't seem to work.
    autocmd BufWinEnter *.tex setlocal textwidth=79 fo+=l
    " When enter new line, auto warp the text
    " TODO: need a if-test on text number
    "autocmd BufWinEnter *.tex inoremap <buffer> <cr> <esc>gqqo
    " Open spell checker when enter tex
    autocmd BufWinEnter *.tex setlocal spell spelllang=en_us
augroup END
