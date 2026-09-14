" vim: fmr=[[[,]]]
scriptencoding utf-8
set encoding=utf-8
set nocompatible                  " Use Vim defaults instead of 100% vi
                                  " compatibility
set backspace=indent,eol,start    " more powerful backspacing
set autoindent                    " always set autoindenting on
set textwidth=0                   " Don't wrap lines by default
set ts=4                          " Tabs displayed as 4 spaces
set viminfo='20,\"50              " read/write a .viminfo file, don't store
                                  " more than 50 lines of registers
set history=50                    " keep 50 lines of command line history
set ruler                         " show the cursor position all the time

                                  " These are files we are not likely to want
                                  " to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set t_Co=256                      " Farben benutzen
set t_Sf=[3%dm                  " Farben benutzen
set t_Sb=[4%dm                  " Farben benutzen
set complete+=k                   " scan the files given with the 'dictionary' option
set browsedir  =current           " which directory to use for the file browser
set incsearch                     " use incremental search
set visualbell                    " visual bell instead of beeping
set number                        " Zeilen nummerieren
set relativenumber
set laststatus=2                  " Stausleiste anzeigen
set foldcolumn=1                  " anzeigen, wie weit die Faltung geht.
set mouse=a                       " maus benutzen
" if $TMUX != ""
" 	set ttymouse=xterm2
" end
set hls                           " Highlight Search
set sb                            " Neues Splitfenster unten
set spr                           " Neues Vsplitfenster rechts
set cursorline                    " Aktuelle Zeile unterstreichen
set tabpagemax=1000               " 1000 Dateien in Tabs oeffnen
set stal=2                        " Tabs (Dateinamen) immer anzeigen
set colorcolumn=80,81,82          " markiert Spalten ab Zeichen 80


set listchars=tab:»·,trail:·,conceal:¤,extends:>,precedes:<
set list
set noacd                         "autodir aus sonst tmux probleme
syntax on                         "Syntaxhighlight an

" autocomplete parenthesis, brackets and braces
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
"
vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%

colorscheme desert
set termguicolors

" Leerzeichen und Tabdarstellung:
map <silent><leader>l :set list!<CR>
map <silent><leader>p :set paste!<CR>

" Doppelpunkt und Strichpunkt farblich unterscheiden
syn match coloncolor ":"
syn match semicoloncolor ";"
hi  link semicoloncolor Special
hi  link coloncolor     Constant

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
" ftplugin verzeichnis wird bearbeitet:
"let g:indentLine_char = '︴' " \uFE34  verzerrt Cursor position!
"let g:indentLine_char = '᠁'  " \u1801
"let g:indentLine_char = '᎒'  " \u1392
"let g:indentLine_char = '┊'  " \u250A
let g:indentLine_char = '│'  " \u2502

" Vim
let g:indentLine_color_term = 239
" " none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_conceallevel = 2

filetype on
