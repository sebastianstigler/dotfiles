scriptencoding utf-8
set encoding=utf-8
" vim: fmr=[[[,]]]
execute pathogen#infect()
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
set laststatus=2                  " Stausleiste anzeigen
set foldcolumn=1                  " anzeigen, wie weit die Faltung geht.
set mouse=a                       " maus benutzen
if $TMUX != ""
	set ttymouse=xterm2
end
set hls                           " Highlight Search
set sb                            " Neues Splitfenster unten
set spr                           " Neues Vsplitfenster rechts
set cursorline                    " Aktuelle Zeile unterstreichen
set tabpagemax=1000               " 1000 Dateien in Tabs oeffnen
set stal=2                        " Tabs (Dateinamen) immer anzeigen
set colorcolumn=80,81,82          " markiert Spalten ab Zeichen 80

                                  " Druckeinstellungen
"set printfont=Courier_New:h9      " Druckt Zeilen mit 80 Zeichen +
"                                  " Zeilennummer (bis 1.000.000 geteste) ohne
"                                  " wrapping
"set printoptions=number:y,syntax:y,paper:A4:left:1pc
"set printdevice=PDF               " Drucker: pollux buero PDF
"                                  " Druckbefehl:
"set pexpr=system('lp'\ .\ (&printdevice\ ==\ ''\ ?\ ''\ :\ '\ -d'\ .\ &printdevice)\ .\ '\ '\ .\ v:fname_in)\ .\ delete(v:fname_in)\ +\ v:shell_error

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

colorscheme catppuccin_mocha
set termguicolors
"colorscheme stiglerdesert_test

" Leerzeichen und Tabdarstellung:
map <silent><leader>l :set list!<CR>
map <silent><leader>p :set paste!<CR>

" Count the number of lines in the range
com! -range -nargs=0 Lines  echo <line2> - <line1> + 1 "Zeilen"

" Angaben für das Template plugin

let g:tskelUserName="Sebastian Stigler"
let g:tskelUserEmail="sebastian.stigler@hs-aalen.de"
let g:tskelUserWWW="www.hs-aalen.de"

" Automatisch den compiler wählen. mit :make starten
au FileType * try | execute "compiler ".&filetype | catch /./ | endtry
autocmd FileType python compiler pylint
autocmd FileType cpp compiler cpplint
autocmd FileType c compiler cpplint
autocmd FileType javascript compiler jshint


let g:pylint_inline_highlight = 0
let g:pep8_map ='<F4>'

let g:languagetool_jar='$HOME/bin/LanguageTool-2.1/languagetool-commandline.jar'
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,TYPOGRAFISCHE_ANFUEHRUNGSZEICHEN,ABKUERZUNG_LEERZEICHEN'

" Doppelpunkt und Strichpunkt farblich unterscheiden
syn match coloncolor ":"
syn match semicoloncolor ";"

hi  link semicoloncolor Special
hi  link coloncolor     Constant
""so /usr/share/vim/vim73/ftplugin/man.vim


let g:ConqueTerm_ExecFileKey = '<F10>'
let g:ConqueTerm_SendFileKey = '<S-F9>'
let g:ConqueTerm_SendVisKey = '<F9>'
let g:ConqueTerm_ToggleKey = '<S-F10>'


let g:SuperTabMappingTabLiteral = '<tab><tab>'

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

let g:jedi#show_call_signatures = "2"
let g:jedi#rename_command = "<leader>x"
filetype on
filetype plugin indent on

" Black config
" autocmd BufWritePre *.py execute ':Black'
nmap <C-S-B> :Black<CR>

"hi PmenuSel cterm=bold,underline ctermbg=13 ctermfg=0 
"hi Pmenu    ctermfg=239 ctermbg=13 guibg=Magenta
hi jediFunction ctermfg=15 ctermbg=242 term=underline

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
