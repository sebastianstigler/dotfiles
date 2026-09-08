" Vim syntax file
" Language:	Vim Informix onstat -a
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:	2008 Aug 28

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
let b:onstat_a = 1
" Syntax des Onlinelogs mitbenutzen
so ~/.vim/syntax/affile.vim
unlet b:current_syntax

set foldmethod=marker

syn match Statement  "^\(Userthreads\|Transactions\|Locks\|Buffers\|Tblspaces\|Dbspaces\|Chunks\|Physical Logging\|Logical Logging\|Profile\|Datablades\|Thread\|Spin locks\|Server start-up environment:\|session \(\s\|\d\).*\|Configuration File: \S*\|[^#].*:\(\t{{{.*\)\{,1}$\).*"
syn region onstat_aStatement transparent fold start="^\(Userthreads\|Transactions\|Locks\|Buffers\|Tblspaces\|Dbspaces\|Chunks\|Physical Logging\|Logical Logging\|Profile\|Datablades\|Thread\|Spin locks\|Server start-up environment:\|session \(\s\|\d\).*\|Configuration File: \S*\|[^#].*:\(\t{{{.*\)\{,1}$\).*" end="^\(Userthreads\|Transactions\|Locks\|Buffers\|Tblspaces\|Dbspaces\|Chunks\|Physical Logging\|Logical Logging\|Profile\|Datablades\|Thread\|Spin locks\|Server start-up environment:\|session \(\s\|\d\).*\|Configuration File: \S*\|[^#].*:\(\t{{{.*\)\{,1}$\).*"me=s-1,re=s-1,he=s-1 contains=ALLBUT,onstat_aStatement containedin=NONE

let b:current_syntax = "onstat_a"
hi link onstat_aStatement Statement
set foldmethod=syntax
" vim: ts=8 sw=2
