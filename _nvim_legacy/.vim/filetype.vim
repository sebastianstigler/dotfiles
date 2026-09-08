" filetype.vim
" @Author:      Sebastian Stigler (mailto:sebastian.stigler@htw-aalen.de)
" @Website:     www.htw-aalen.de
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2014-10-08.
" @Last Change: 19-Mai-2005.
" @Revision:    0.0

if &cp || exists("loaded_filetype")
    finish
endif
let loaded_filetype = 1

augroup filetypedetect
	  au! BufRead,BufNewFile *.md	setfiletype markdown
augroup END
augroup filetypedetect
	  au! BufRead,BufNewFile *.j2	setfiletype jinja
augroup END
augroup filetypedetect
	  au! BufRead,BufNewFile todo.txt	setfiletype todo
	  au! BufRead,BufNewFile done.txt	setfiletype todo
augroup END

