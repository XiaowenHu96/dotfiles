" vim-which-key is vim port of emacs-which-key that displays available keybindings in popup.
" Every customize command should go here with proper descriptions.

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" Do not use float window
let g:which_key_use_floating_win = 0

" s for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }

" l for langauge
let g:which_key_map.l = {
      \ 'name' : '+langauge' ,
      \ 'c' :  [":call LanguageClient_contextMenu()<CR>"                , "context menu"],
      \ 'e' :  [":call LanguageClient#explainErrorAtPoint()<CR>"        , "explain error"],
      \ 'h' :  [":call LanguageClient#textDocument_hover()<CR>"         , "display hover"],
      \ 'g' :  [":call LanguageClient#textDocument_definition()<CR>"    , "goto definition"],
      \ 'r' :  [":call LanguageClient#textDocument_rename()<CR>"        , "rename variable"],
      \ 'f' :  [":call LanguageClient#textDocument_formatting()<CR>"    , "format code"],
      \ 'b' :  [":call LanguageClient#textDocument_references()<CR>"    , "find all references"],
      \ 'a' :  [":call LanguageClient#textDocument_codeAction()<CR>"    , "code action"],
      \ 's' :  [":call LanguageClient#textDocument_documentSymbol()<CR>", "document symbol"],
      \ }

" S for Spell
let g:which_key_map.S = {
      \ 'name' : '+Spell' ,
      \ 'o' :  [":set spell spelllang=en_us"                , "on"],
      \ 'q' :  [":set spell spelllang="                     , "off"],
      \ 's' :  ["z="                                        , "correction"],
      \ }

" d for dotfiles
let g:which_key_map.d = {
      \ 'name' : '+dotfiles' ,
      \ 'v' :  [":tabe $HOME/.config/nvim/general/settings.vim"                       , "general settings"],
      \ 'V' :  [":tabe $MYVIMRC"                                                      , "init vim"],
      \ 'k' :  [":take $HOME/.config/nvim/vim-plug/which-key.vim"                     , "which-keys binding"],
      \ 'K' :  [":tabe $HOME/.config/nvim/keys/keys.vim"                              , "general key-binding"],
      \ 'x' :  [":tabe $HOME/.xmonad/xmonad.hs"                                       , "xmonad"],
      \ 'X' :  [":tabe $HOME/.config/xmobar/xmobarcc"                                 , "xmobar"],
      \ 'z' :  [":tabe $HOME/.zshrc"                                                  , "zshrc"],
      \ 'r' :  [":resource $MYVIMRC"                                                  , "reload config"],
      \ 'p' :  [":tabe $HOME/.config/nvim/vim-plug/plugins.vim"                       , "plugins"],
      \ }

call which_key#register('<Space>', "g:which_key_map")
