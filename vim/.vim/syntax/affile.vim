" Vim syntax file
" Language:	Vim Informix AF file
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:	2008 Aug 28

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
let b:affile = 1
" Syntax des Onlinelogs mitbenutzen
so ~/.vim/syntax/onlinelog.vim
unlet b:current_syntax

"Kommentar In Onconfig:
syn match affileComment "\#.*" contains=NONE 

" Faltung:
syn match affileSpecial '^===========-------------.*$\|------------------ End of assertion failure.*'
"syn match affileStatement '^\([\/]\?\([^\/]\{1,}\/\)*\|\a:\\\([^\\\/]\{1,}[\\\/]\)*\)\(onstat\|onmode\|oncheck\|oninit\|tail -100\|Environment Variables:\|uname\).*$'
"syn region affileStatement keepend transparent fold start='^\([\/]\?\([^\/]\{1,}\/\)*\|\a:\\\([^\\\/]\{1,}[\\\/]\)*\)\(onstat\|onmode\|oncheck\|oninit\|tail -100\|Environment Variables:\|uname\).*$' end='^===========-------------.*$'
syn match affileStatement '^\([\/]\?\([^\/]\{1,}\/\)*\|\a:\\\([^\\\/]\{1,}[\\\/]\)*\)\(onstat \|onmode -\|oncheck -\|oninit -\|tail -100\|Environment Variables:\|uname \).*$'
if !exists("b:onstat_a")
  syn region affileStatement keepend transparent fold start='^\([\/]\?\([^\/]\{1,}\/\)*\|\a:\\\([^\\\/]\{1,}[\\\/]\)*\)\(onstat -\|onmode -\|oncheck -\|oninit -\|tail -100\|Environment Variables:\|uname \).*$' end='^===========-------------.*$\|------------------ End of assertion failure.*'
endif
" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link affileSpecial	Special
hi def link affileIdentifier	Identifier
hi def link affileError		Error
hi def link affileWarning	WarningMsg
hi def link affileStatement	Statement
hi def link affileType		Type
hi def link affileConstant	Constant
hi def link affileComment	Comment

let b:current_syntax = "affile"

" vim: ts=8 sw=2
