" vim: fmr=[[[,]]]
"
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:  2008-09-30

"----------------------------------------------------------------------

map   <silent> <F3>    :call MyZeilenMark()<CR>
imap  <silent> <F3>    <Esc>:call MyZeilenMark()<CR>


"-------------------------------------------------------------------------------
" zeigt ende der Zeile an indem die Zeichen in der nähe der 80. Spalte in 
" einer und nach der 80. Spalte in einer anderen Farbe gefärbt werden.


highlight Near80ColLimit term=italic cterm=italic ctermbg=yellow ctermfg=darkblue gui=bold,italic guibg=yellow guifg=darkblue
highlight Over80ColLimit term=bold cterm=bold ctermbg=red ctermfg=white gui=bold guibg=red guifg=white
function! MyZeilenMark()
  if !exists("b:myZeilenMark")
    let b:myZeilenMark=1
  endif
  if b:myZeilenMark > 0
    au BufEnter *  exec 'match Over80ColLimit /\%81v.*/' |  exec '2match Near80ColLimit /\%<81v.\%>71v/' 
    do BufEnter
    let b:myZeilenMark=0
  else
    exec ":match none"
    exec ":2match none"
    let b:myZeilenMark=1
  endif
endfunction

