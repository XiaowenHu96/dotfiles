" Custmoize fzf-vim Files command to open window in floating
" Return a floating window with preview option on.
function M_fzf_float_window()
    return fzf#vim#with_preview({
            \ 'up':'~90%', 
            \ 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' },
            \})
endfunction

" Open Files in float
command! -bang -nargs=? -complete=dir FloatFiles
    \ call fzf#vim#files(<q-args>, M_fzf_float_window(), <bang>0)


" Open recent buffer in float
command! FloatHistory
    \ call fzf#vim#history(M_fzf_float_window())
