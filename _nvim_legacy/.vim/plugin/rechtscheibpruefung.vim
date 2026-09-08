" vim: fmr=[[[,]]]
"
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:  2008-09-30

"----------------------------------------------------------------------
if v:version < 700
	finish
endif

" toggle spelling with F2 key
map <silent><F2> :set spell!<CR>
imap <silent><F2> <ESC>:set spell!<CR>

" toggle language with ä key
if !hasmapto('<Plug>R_sprach_toggle')
  map <silent> <esc>l <Plug>R_sprach_toggle 
endif
nnoremap <silent> <script> <Plug>R_sprach_toggle :call SprachToggle()<cr>

"Sprache Deutsch und Englisch
set spl=de,en
" limit it to just the top 10 items
set sps=best,15

function! SprachToggle ()
  if &spl == 'de,en'
    set spl=de
  elseif &spl == 'de'
    set spl=en
  else
    set spl=de,en
  endif
endfunction

