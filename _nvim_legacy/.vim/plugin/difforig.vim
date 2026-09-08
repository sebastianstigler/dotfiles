" vim: fmr=[[[,]]]
"
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:  2008-09-30

"----------------------------------------------------------------------
map <silent> <F8> :DiffOrig<CR>
imap <silent> <F8> <ESC>:DiffOrig<CR>

" Vergleiche gespeicherte mit der im Puffer liegenden Version der Datei
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis


