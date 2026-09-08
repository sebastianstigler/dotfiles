" asciidoc.vim -- Asciidoc compiler
" @Author : Jan Christoph Ebersbach (jceb@e-jc.de)
" @License : GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created : 2007-03-05
" @Last Modified: Wed 23. Apr 2008 10:42:57 +0200 CEST
" @Revision : 0.0
" @vi : ft=vim:tw=80:sw=4:ts=4
"
" @Description : sets makeprg for asciidoc
" @Usage :
" @TODO :
" @CHANGES :

if exists("b:current_compiler")
  finish
endif
let b:current_compiler = "asciidoc"

setlocal makeprg=asciidoc\ $*\ \"%:p\"
setlocal errorformat=asciidoc:\ FAILED:\ %f:\ line\ %l:\ %m,
setlocal errorformat+=asciidoc:\ ERROR:\ <stdin>:\ line\ %l:\ %m,
setlocal errorformat+=asciidoc:\ ERROR:\ %f:\ line\ %l:\ %m,
setlocal errorformat+=asciidoc:\ WARNING:\ %f:\ line\ %l:\ %m,

if !exists('g:asciidoc_onwrite')
    let g:asciidoc_onwrite = 1
endif

if !exists('g:asciidoc_cwindow')
    let g:asciidoc_cwindow = 1
endif

if !exists('g:asciidoc_inline_highlight')
    let g:asciidoc_inline_highlight = 0
endif

if g:asciidoc_onwrite
    augroup asciidoc
        au!
        au BufWritePost * call Asciidoc(1)
    augroup end
endif

if !exists("*s:Asciidoc")
function! Asciidoc(writing)
    if has('win32') || has('win16') || has('win95') || has('win64')
        setlocal sp=>%s
    else
        setlocal sp=>%s\ 2>&1
    endif

    " If check is executed by buffer write - do not jump to first error
    if !a:writing
        silent make
    else
        silent make!
    endif

    if g:asciidoc_cwindow
        cwindow
    endif

    if g:asciidoc_inline_highlight
        call AsciidocHighlight() 
    endif
endfunction
endif
