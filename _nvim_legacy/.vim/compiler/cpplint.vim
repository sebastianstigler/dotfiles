" cpplint.vim -- Asciidoc compiler
" @Author : Jan Christoph Ebersbach (jceb@e-jc.de)
" @License : GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created : 2007-03-05
" @Last Modified: Wed 23. Apr 2008 10:42:57 +0200 CEST
" @Revision : 0.0
" @vi : ft=vim:tw=80:sw=4:ts=4
"
" @Description : sets makeprg for cpplint
" @Usage :
" @TODO :
" @CHANGES :

if exists("b:current_compiler")
  finish
endif
let b:current_compiler = "cpplint"

setlocal makeprg=cpplint\ --filter=+,-readability/function\ $*\ \"%:p\"
"setlocal makeprg=cpplint\ --filter=+\ $*\ \"%:p\"
setlocal errorformat=%f:%l:\ \ %m
"setlocal errorformat=%f:%l:\ \ %m,
"setlocal errorformat+=Total\ errors\ found:\ %m

if !exists('g:cpplint_onwrite')
    let g:cpplint_onwrite = 1
endif

if !exists('g:cpplint_cwindow')
    let g:cpplint_cwindow = 1
endif


if g:cpplint_onwrite
    augroup cpplint
        au!
        au BufWritePost * call Cpplint(1)
    augroup end
endif

if !exists("*s:Cpplint")
function! Cpplint(writing)
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

    if g:cpplint_cwindow
        cwindow
    endif

endfunction
endif
