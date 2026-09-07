" Vim color file
" Maintainer:	Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change:	2006 Apr 30

" darkblue -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "darkblue"

hi Normal	ctermfg=gray		ctermbg=black
hi ErrorMsg	ctermfg=white		ctermbg=lightblue
hi Visual	ctermfg=blue		ctermbg=fg		cterm=reverse
hi VisualNOS	ctermfg=lightblue	ctermbg=fg		cterm=reverse,underline
hi Todo		ctermfg=red		ctermbg=darkblue
hi Search	ctermfg=white		ctermbg=darkblue	cterm=underline		term=underline
hi IncSearch	ctermfg=darkblue	ctermbg=gray

hi SpecialKey	ctermfg=darkcyan
hi Directory	ctermfg=cyan
hi Title	ctermfg=magenta					cterm=bold
hi WarningMsg	ctermfg=red
hi WildMenu	ctermfg=yellow		ctermbg=black		cterm=none		term=none
hi ModeMsg	ctermfg=lightblue
hi MoreMsg	ctermfg=darkgreen
hi Question	ctermfg=green					cterm=none
hi NonText	ctermfg=darkblue

hi StatusLine	ctermfg=black		ctermbg=darkgray	cterm=none 		term=none
hi StatusLineNC	ctermfg=black		ctermbg=gray		cterm=none		term=none
hi VertSplit	ctermfg=black		ctermbg=gray		cterm=none		term=none

hi Folded	ctermfg=darkgrey	ctermbg=black		cterm=bold		term=bold
hi FoldColumn	ctermfg=black		ctermbg=grey		cterm=bold		term=bold
hi LineNr	ctermfg=brown		ctermbg=grey		cterm=none

hi DiffAdd	ctermfg=grey		ctermbg=darkblue	cterm=none		term=none
hi DiffChange	ctermfg=black		ctermbg=magenta		cterm=none
hi DiffDelete	ctermfg=blue		ctermbg=cyan
hi DiffText	ctermfg=black 		ctermbg=red		cterm=none

hi Cursor	ctermfg=black		ctermbg=yellow
hi lCursor	ctermfg=black		ctermbg=white

hi Comment	ctermfg=darkred
hi Constant	ctermfg=magenta					cterm=none
hi Special	ctermfg=brown					cterm=none
hi Identifier	ctermfg=cyan					cterm=none
hi Statement	ctermfg=yellow					cterm=none
hi PreProc	ctermfg=magenta					cterm=none
hi type		ctermfg=green					cterm=none
hi Underlined							cterm=underline		term=underline
hi Ignore	ctermfg=bg
hi Error 	ctermfg=red 		ctermbg=black 		cterm=bold,underline
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

hi USER1 ctermfg=lightgreen ctermbg=darkgray
hi USER2 ctermfg=yellow     ctermbg=darkgray
hi USER3 ctermfg=lightred   ctermbg=darkgray

