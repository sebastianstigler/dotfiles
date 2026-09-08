" vim: fmr=[[[,]]]
"
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:  2008-09-30

"----------------------------------------------------------------------
map   <silent> <F12>   :call MyHex()<CR>
imap  <silent> <F12>   <Esc>:call MyHex()<CR>

"Hexmodus
function! MyHex()
  if !exists("b:myHexOnOff")
    let b:myHexOnOff = 0
  endif
  if b:myHexOnOff < 1
    exe ":%!xxd "
    let b:myHexOnOff = 1
  else
    exe ":%!xxd -r "
    let b:myHexOnOff = 0
  endif
endfunction


