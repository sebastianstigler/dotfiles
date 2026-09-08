" Vim syntax file
" Language:	Vim Informix online.log file
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:	2008 Aug 28

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
let b:onlinelog=1

set foldmethod=syntax

" Performace Advisory:
" Results:
" Action:
syn region onlinelogIdentifier  start="\(Performance Advisory\|Results\|Action\):" end="^\d\d:\d\d:\d\d"me=e-9,he=e-9,re=e-9 

" Attempting to free unused :
syn region onlinelogIdentifier  start="Attempting to free unused " end="^\d\d:\d\d:\d\d"me=e-9,he=e-9,re=e-9 

" SHM Segment:
syn match onlinelogIdentifier  "Dynamically allocated new virtual shared memory segment (size \d*KB)"

" Informix Version:
syn match onlinelogType "IBM Informix Dynamic Server Version.*"

" Error:
syn match onlinelogErrorLine ".* [Ee]rror.*"
" Assert Failed:
syn region onlinelogError transparent  keepend start="\d\d:\d\d:\d\d\s*Assert Failed" end="See Also.*" contains=ALLBUT,onlinelogCWarning
syn match onlinelogCError ".*Assert Failed:.*" containedin=onlinelogError contained
syn match onlinelogCError "Who:.*" containedin=onlinelogError contained
syn match onlinelogCError "Thread.*" containedin=onlinelogError contained
syn match onlinelogCError "File:.*" containedin=onlinelogError contained
syn match onlinelogCError "stack trace.*" containedin=onlinelogError contained
syn match onlinelogCError ".*See Also:.*" containedin=onlinelogError contained

" Warning:
syn match onlinelogWarningLine ".* WARNING.*"
syn match onlinelogWarningLine ".* Warning.*"
" Assert Warning:
syn region onlinelogWarning transparent start="\d\d:\d\d:\d\d\s*Assert Warning" end="See Also.*" contains=ALLBUT,onlinelogCError
syn match onlinelogCWarning ".*Assert Warning:.*" containedin=onlinelogWarning contained
syn match onlinelogCWarning "Who:.*" containedin=onlinelogWarning contained
syn match onlinelogCWarning "Thread.*" containedin=onlinelogWarning contained
syn match onlinelogCWarning "File:.*" containedin=onlinelogWarning contained
syn match onlinelogCWarning "stack trace.*" containedin=onlinelogWarning contained
syn match onlinelogCWarning ".*See Also:.*" containedin=onlinelogWarning contained

" Panik:
syn match onlinelogWarning "PANIC: Attempting to bring system down"

" Datum:
syn match onlinelogStatement "^\a\{3}\s\{1,}\a\{3}\s\{1,}\d\{1,2}\s\{1,}\d\d:\d\d:\d\d\s\{1,}\d\{4}"
" Am Datum Falten:
"syn region onlinelogFold fold transparent start="^\a\{3}\s\{1,}\a\{3}\s\{1,}\d\{1,2}\s\{1,}\d\d:\d\d:\d\d\s\{1,}\d\{4}.*$"  end="^\a\{3}\s\{1,}\a\{3}\s\{1,}\d\{1,2}\s\{1,}\d\d:\d\d:\d\d\s\{1,}\d\{4}.*$"me=e-25,he=e-25,re=e-25 contains=onlinelogSpecial,onlinelogIdentifier,onlinelogError,onlinelogErrorLine,onlinelogCTime,onlinelogWarning,onlinelogWarningLine,onlinelogTime,onlinelogStatement,onlinelogType,onlinelogConstant,onlinelogFuzzy containedin=NONE
if !exists("b:affile")
  syn region onlinelogFold fold transparent start="^\a\{3}\s\{1,}\a\{3}\s\{1,}\d\{1,2}\s\{1,}\d\d:\d\d:\d\d\s\{1,}\d\{4}.*$"  end="^\a\{3}\s\{1,}\a\{3}\s\{1,}\d\{1,2}\s\{1,}\d\d:\d\d:\d\d\s\{1,}\d\{4}.*$"me=s-1,he=s-1,re=s-1 contains=onlinelogSpecial,onlinelogIdentifier,onlinelogError,onlinelogErrorLine,onlinelogCTime,onlinelogWarning,onlinelogWarningLine,onlinelogTime,onlinelogStatement,onlinelogType,onlinelogConstant,onlinelogFuzzy containedin=NONE
endif

" Server Start Stop:
syn match onlinelogConstant "IBM Informix Dynamic Server St.*"
" On-line, Quiescent, Shutdown Mode:
syn match onlinelogConstant "\(\(On-Line\)\|\(Quiescent\)\|\(Shutdown\)\) Mode"

" Checkpoint Completed:
syn match onlinelogSpecial "\(Fuzzy \)\?Checkpoint Completed:  duration was [01] seconds." contains=onlinelogTime,onlinelogCTime
syn match onlinelogSpecial "\d\d:\d\d:\d\d\s*\(Fuzzy \)\?Checkpoint Completed:  duration was \([2-9]\|\(\d\d\d*\)\) seconds." contains=onlinelogTime,onlinelogCTime

" TRACEFUZZYCKPT TRACECKPT:
syn region onlinelogConstant transparent keepend start="Buffer manager: starting coarse downgrades." end="safe_dskflush.. took \d* seconds"  contains=ALL
syn match onlinelogFuzzy "\(Buffer manager:\|\d* buffers dirty\|\(safe_\)\?dskflush() took \d* seconds\|wait4critex() took \d* seconds\)" contains=onlinelogTime,onlinelogCTime

syn match onlinelogTime "\(was\|took\) \zs[01]*\ze seconds"
syn match onlinelogCTime "\(was\|took\) \zs\([2-9]\|\(\d\d\d*\)\)\ze seconds"

" Logcal And Physical Recovery:
syn match onlinelogFuzzy "\(Logical\|Physical\) Recovery .*" contains=onlinelogTime,onlinelogCTime
syn match onlinelogTime "\(Logical\|Physical\) Recovery \zs\(Started\|Complete\)"

" Level 0 Archiv:
syn match onlinelogFuzzy "\(Level 0 Archive started on\|Archive on\).*" contains=onlinelogType,onlinelogStatement,onlinelogError
syn match onlinelogType "Completed\ze\." contains=ALL contained
syn match onlinelogError "ABORTED\ze\." contains=ALL contained
syn match onlinelogStatement "\(Level 0 Archive started on\|Archive on\) \zs\S*" contains=onlinelogType,onlinelogError


" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi  link onlinelogSpecial	Special
hi  link onlinelogIdentifier	Identifier
hi  link onlinelogError		Error
hi  link onlinelogErrorLine	Error
hi  link onlinelogCError	Error
hi  link onlinelogCTime		Error
hi  link onlinelogWarning	WarningMsg
hi  link onlinelogWarningLine	WarningMsg
hi  link onlinelogCWarning	WarningMsg
hi  link onlinelogTime		WarningMsg
hi  link onlinelogStatement	Statement
hi  link onlinelogType		Type
hi  link onlinelogConstant	Constant
hi  link onlinelogFold		Normal
hi       onlinelogFuzzy		ctermfg=lightgreen 	ctermbg=234
hi       onlinelogDbspace	ctermfg=lightgreen 	ctermbg=234 cterm=underline
let b:current_syntax = "onlinelog"
" vim: ts=8 sw=2 wrap
