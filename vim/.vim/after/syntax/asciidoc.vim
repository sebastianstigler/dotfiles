" cpp.vim
" @Author:      Sebastian Stigler (mailto:sebastian.stigler@htw-aalen.de)
" @Website:     www.htw-aalen.de
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2013-08-30.
" @Last Change: 19-Mai-2005.
" @Revision:    0.0

"if &cp || exists("loaded_cpp")
"    finish
"endif
"let loaded_cpp = 1


" Doppelpunkt und Strichpunkt farblich unterscheiden
syn match coloncolor /:\s*$/
syn match semicoloncolor /;/

syn match tracepoint /tracepoint/
syn match tracepoint /tracepoint(\_.\{-});/

hi  link tracepoint Ignore
hi  link semicoloncolor	Special
hi  link coloncolor		Constant

