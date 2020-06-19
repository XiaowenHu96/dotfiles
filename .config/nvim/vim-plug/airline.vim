" config
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_spelllang=0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])

" Only show tab when we have >= 2 pages
set showtabline=1

" We don't need to see things like -- INSERT -- anymore
set noshowmode
