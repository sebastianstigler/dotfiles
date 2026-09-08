" Vim color file
" Maintainer:	Sebastian Stigler
" Last Change:	2008 Okt 21

" -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
set bg=dark

let colors_name = "stiglerdesert_test"

hi Normal	ctermfg=white	"	ctermbg=234
hi ErrorMsg	ctermfg=7		ctermbg=1
hi Visual	ctermfg=222		ctermbg=65
hi VisualNOS							cterm=bold,underline
hi Todo		ctermfg=202		ctermbg=184
hi Search	ctermfg=130		ctermbg=224		cterm=underline		term=underline
hi IncSearch	ctermfg=130		ctermbg=224

hi SpecialKey	ctermfg=148
hi Directory	ctermfg=cyan
hi Title	ctermfg=167					cterm=bold
hi WarningMsg	ctermfg=210
hi WildMenu	ctermfg=yellow		ctermbg=black		cterm=none		term=none
hi ModeMsg	ctermfg=172
hi MoreMsg	ctermfg=30
hi Question	ctermfg=49					cterm=none
hi NonText	ctermfg=lightblue	"ctermbg=239

hi StatusLine	ctermfg=black		ctermbg=144		cterm=none 		term=none
hi StatusLineNC	ctermfg=244		ctermbg=144		cterm=none		term=none
hi VertSplit	ctermfg=244		ctermbg=144		cterm=none		term=none

hi Folded	ctermfg=220		ctermbg=239		cterm=bold		term=bold
hi FoldColumn	ctermfg=239		ctermbg=137		cterm=bold		term=bold
hi LineNr	ctermfg=brown

hi DiffAdd	ctermfg=grey		ctermbg=darkblue	cterm=none		term=none
hi DiffChange	ctermfg=black		ctermbg=magenta		cterm=none
hi DiffDelete	ctermfg=blue		ctermbg=cyan
hi DiffText	ctermfg=black 		ctermbg=red		cterm=none

hi Cursor	ctermfg=black		ctermbg=yellow
hi lCursor	ctermfg=black		ctermbg=white

hi Comment	ctermfg=81
hi Constant	ctermfg=174					cterm=none
hi Special	ctermfg=223					cterm=none
hi Identifier	ctermfg=84					cterm=none
hi Statement	ctermfg=222					cterm=none
hi PreProc	ctermfg=167					cterm=none
hi Type		ctermfg=143					cterm=none
hi Underlined							cterm=underline		term=underline
hi Ignore	ctermfg=241
hi Error 	ctermfg=red 		ctermbg=234 		cterm=bold,underline
hi SpellBad	ctermfg=darkred		ctermbg=lightred		
hi SpellCap	ctermfg=0		ctermbg=lightblue		
hi SpellRare	ctermfg=0		ctermbg=13		
hi SpellLocal	ctermfg=0		ctermbg=14		


hi MarkWord1  	ctermfg=Black  		ctermbg=Cyan    
hi MarkWord2  	ctermfg=Black  		ctermbg=Green   
hi MarkWord3  	ctermfg=Black  		ctermbg=Yellow  
hi MarkWord4  	ctermfg=Black  		ctermbg=Red     
hi MarkWord5  	ctermfg=Black  		ctermbg=Magenta 
hi MarkWord6  	ctermfg=Black  		ctermbg=Blue    

hi USER1	ctermfg=blue		ctermbg=144
hi USER2	ctermfg=yellow     	ctermbg=144
hi USER3	ctermfg=red 	   	ctermbg=144
hi USER4	ctermfg=darkgreen 	   	ctermbg=144
hi SignColor	ctermfg=167		ctermbg=234
hi onlinelogFuzzy	ctermfg=81
hi onlinelogDbspace	ctermfg=81 	ctermbg=234 cterm=underline
hi ColorColumn ctermbg=darkgray ctermfg=White cterm=bold


"guimode

hi Normal	guifg=White guibg=grey20

" highlight groups
hi Cursor	guibg=khaki guifg=slategrey
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded	guibg=grey30 guifg=gold
hi FoldColumn	guibg=grey30 guifg=tan
hi IncSearch	guifg=slategrey guibg=khaki
"hi LineNr
hi ModeMsg	guifg=goldenrod
hi MoreMsg	guifg=SeaGreen
hi NonText	guifg=LightBlue guibg=grey30
hi Question	guifg=springgreen
hi Search	guibg=peru guifg=wheat
hi SpecialKey	guifg=yellowgreen
hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
hi Title	guifg=indianred
hi Visual	gui=none guifg=khaki guibg=olivedrab
"hi VisualNOS
hi WarningMsg	guifg=salmon
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment	guifg=SkyBlue
hi Constant	guifg=#ffa0a0
hi Identifier	guifg=palegreen
hi Statement	guifg=khaki
hi PreProc	guifg=indianred
hi Type		guifg=darkkhaki
hi Special	guifg=navajowhite
"hi Underlined
hi Ignore	guifg=grey40
"hi Error
hi Todo		guifg=orangered guibg=yellow2


hi MarkWord1  	guifg=Black  		guibg=Cyan    
hi MarkWord2  	guifg=Black  		guibg=Green   
hi MarkWord3  	guifg=Black  		guibg=Yellow  
hi MarkWord4  	guifg=Black  		guibg=Red     
hi MarkWord5  	guifg=Black  		guibg=Magenta 
hi MarkWord6  	guifg=Black  		guibg=Blue    

"hi USER1	guifg=lightgreen "	guibg=144
"hi USER2	guifg=yellow     	guibg=144
"hi USER3	guifg=lightred   	guibg=144
"hi SignColor	guifg=167		guibg=234
"hi onlinelogFuzzy	guifg=lightgreen 	guibg=234
"hi onlinelogDbspace	guifg=lightgreen 	guibg=234 gui=underline
hi ColorColumn guibg=darkgray guifg=White
set bg=dark

