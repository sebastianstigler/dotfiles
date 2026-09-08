" vim: fmr=[[[,]]]
"
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:  2008-10-08

"----------------------------------------------------------------------
" Übersetzung des Wortes  unter den Cursor
com Trans let ern = expand("<cword>") |  new | set nonu | exe "r !x-dict " . ern | unlet ern | set nomodified
