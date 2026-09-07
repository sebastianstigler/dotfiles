" vim: fmr=[[[,]]]
"
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:  2008-10-08

"----------------------------------------------------------------------
" Call Pylint
com MyPylint let ern = expand('%:p') |  new | set nonu | exe "r !pylint " . ern | unlet ern | set nomodified
