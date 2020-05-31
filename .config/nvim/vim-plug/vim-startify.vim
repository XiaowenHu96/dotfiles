let g:startify_bookmarks = [ 
            \ {'V' : '~/.config/nvim/'},
            \ {'X' : '~/.xmonad/xmonad.hs'},
            \ {'Z' : '~/.zshrc'},
            \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Recent Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']},
          \ { 'type': 'sessions',  'header': ['   Sessions']},
          \ ]


" If this option is enabled and you start Vim in a directory that contains a 'Session.vim',
" that session will be loaded automatically. Otherwise it will be shown as the top entry in the Startify buffer."
let g:startify_session_autoload = 0 " 0 for off

" Location to save me session
let g:startify_session_dir = '~/.config/nvim/session'

" Auto save a session before leave
let g:startify_session_persistence = 1
