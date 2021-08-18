" Onedark colorscheme. For neovim <0.5 without treesitter
" let g:onedark_terminal_italics = 1

" " Change comment color and white color, it was too dark.
" " Cterm and cterm16 are set to zero. Won't work if 24-bit is not supported.
" " white: f2f2f2 (bright) or dedede (dark)
" let g:onedark_color_overrides = {
" \ "comment_grey": {"gui": "#616c86", "cterm": "0", "cterm16": "0" },
" \ "white": {"gui": "#dedede", "cterm": "0", "cterm16": "0" },
" \}

" " Change the color of line number. It was too dark.
" augroup colorset
" 	autocmd!
" 	let s:line_grey = { "gui": "#7f7f7f", "cterm": "145", "cterm16" : "7" }
" 	autocmd ColorScheme * call onedark#set_highlight("LineNr", { "fg": s:line_grey }) " `bg` will not be styled since there is no `bg` setting
" augroup END
" colorscheme onedark



" Onedark colorscheme. For neovim >0.5 with treesitter
let g:onedark_style = 'dark'
colorscheme onedark
