let g:LanguageClient_serverCommands = { 
    \ 'haskell': ['hie-wrapper'],
    \ 'python' : ['pyls'],
	\ 'cpp' : ['clangd'],
	\ 'c' : ['clangd'],
    \ }
" Disable virtual text 
let g:LanguageClient_useVirtualText = "No"
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
map <Leader>le :call LanguageClient#explainErrorAtPoint()<CR>
map <Leader>lh :call LanguageClient#textDocument_hover()<CR>
map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
map <Leader>lb :call LanguageClient#textDocument_references()<CR>
map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
