" swap_lines.vim
" @Author:      Sebastian Stigler (mailto:sebastian.stigler@hs-aalen.de)
" @Website:     www.hs-aalen.de
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2015-11-03.
" @Last Change: 19-Mai-2005.
" @Revision:    0.0

if &cp || exists("loaded_swap_lines")
    finish
endif
let loaded_swap_lines = 1

function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-k> :call <SID>swap_up()<CR>
noremap <silent> <c-j> :call <SID>swap_down()<CR>

