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

" Filetype
filetype on

" Disable dir save in makeview
set viewoptions-=curdir
" Auto save view when exit file and auto load view when open
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup END


" file specific Setting
augroup FileSpecificSetting
    autocmd!
    " Set maximum line length when working in tex file
    autocmd FileType tex,vimwiki setlocal textwidth=79 fo+=l

    " Map shift-enter to formatting.
    " Note: keep an eye on it, maybe buggy.
    autocmd FileType tex,vimwiki inoremap <buffer> <expr><cr> __FormatIsEOL() ? "<esc>gqqA\<cr>" : "\<cr>"
    
    " Open spell checker when enter tex
    autocmd FileType tex,vimwiki setlocal spell spelllang=en_us

    " Add some customized autopairs
    " \( -> \(<cursor>\)
    autocmd FileType tex inoremap <buffer> \( \(\)<left><left>
    " \[ -> \[<cursor>\]
    autocmd FileType tex inoremap <buffer> \[ \[\]<left><left>
    " $ -> $cursor$
    autocmd FileType tex inoremap <buffer> $ $$<left>
    " $$ -> $$cursor$$
    autocmd FileType tex inoremap <buffer> $$ $$$$<left><left>

augroup END

function __FormatIsEOL()
    return col(".") == col("$")
endfunction


" Customize * search behavior

" https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
function! GetVisualSelection()
    if mode()=="v"
        let [line_start, column_start] = getpos("v")[1:2]
        let [line_end, column_end] = getpos(".")[1:2]
    else
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
    end
    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
        let [line_start, column_start, line_end, column_end] =
        \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
            return ''
    endif
    let lines[-1] = lines[-1][: column_end - 1]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! SelectSearch()
    let @/ = GetVisualSelection()
    " call feedkeys("/\<CR>")
    call feedkeys("n")
endfunction

" search current selected
vnoremap * :call SelectSearch()<cr>
" search current word, but do not advance
nnoremap * *N

" colorscheme: Edge
if has('termguicolors')
  set termguicolors
endif
" The configuration options should be placed before `colorscheme edge`.
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 0
" colorscheme edge
colorscheme nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
hi! link LineNr Comment
