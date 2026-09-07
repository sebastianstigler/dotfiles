" cpp_def2imp.vim -- Copy declaration to implementation of CPP function
" @Author:      Sebastian Stigler (mailto:sebastian.stigler@htw-aalen.de)
" @Website:     www.htw-aalen.de
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2014-02-21.
" @Last Change: 19-Mai-2005.
" @Revision:    0.0

if &cp || exists("loaded_cpp_def2imp")
    finish
endif
let loaded_cpp_def2imp = 1

nmap <leader>c :CopyDefinition<CR>
nmap <leader>v :ImplementDefinition<CR>
command! CopyDefinition :call s:GetDefinitionInfo()
command! ImplementDefinition :call s:ImplementDefinition()
function! s:GetDefinitionInfo()
  exe 'normal ma'
  " Get class
  call search('^\s*\<class\>', 'b')
  exe 'normal ^w"ayw'
  let s:class = @a
  let l:ns = search('^\s*\<namespace\>', 'b')
  " Get namespace
  if l:ns != 0
    exe 'normal ^w"ayw'
    let s:namespace = @a
  else
    let s:namespace = ''
  endif
  " Go back to definition
  exe 'normal `a'
  exe 'normal "aY'
  let s:defline = substitute(@a, ';\n', '', '')
endfunction
 
function! s:ImplementDefinition()
  if s:namespace == ''
    let l:classString = s:class . "::"
  else
    let l:classString = s:namespace . "::" . s:class . "::"
  endif
  set paste
  exe 'normal $o/'
  exe 'normal 78a*'
  exe 'normal $o*** implementation of the ' . l:classString
  exe 'normal o'. s:defline
  exe 'normal ^f(Dbd^kJA function */'
  s/::\s\+/::/e
  s/\s\+::/::/e
   
  call append('.', s:defline)
  exe 'normal j'
  " Remove keywords
  s/\<virtual\>\s*//e
  s/\<explicit\>\s*//e
  s/\<static\>\s*//e
  " Remove default parameters
  s/\s\{-}=\s\{-}[^,)]\{1,}//e
  " Add class qualifier
  exe 'normal ^f(bi' . l:classString
  " Add brackets
  exe "normal $A {\<CR>    \<CR>}\<CR>\<ESC>kkk"
  " Fix indentation
  exe 'normal =3j^'
  s/::\s\+/::/e
  s/\s\+::/::/e
  exe 'normal j$'
  set nopaste
endfunction

