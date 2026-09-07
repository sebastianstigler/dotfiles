" vim: fmr=[[[,]]]
"
" Maintainer:	Sebastian Stigler <sebastian.stigler@bytec.de>
" Last Change:  2008-09-30

"----------------------------------------------------------------------
" Custom status line display
if v:version < 700
  finish
endif

function! WordCount()
   let s:old_status = v:statusmsg
   let position = getpos(".")
   exe ":silent normal g\<c-g>"
   let stat = v:statusmsg
   let s:word_count = 0
   if stat != '--No lines in buffer--'
     let s:stmlist = split(v:statusmsg)
	 if len(s:stmlist) < 12
		return 0
	end
     let s:word_count = str2nr(s:stmlist[11])
     let v:statusmsg = s:old_status
   end
   call setpos('.', position)
   return s:word_count 
endfunction

set ls=2 " Always show status line
if has('statusline')
    " Status line detail:
    " %f		file path
    " %y		file type between braces (if defined)
    " %([%R%M]%)	read-only, modified and modifiable flags between braces
    " %{'!'[&ff=='default_file_format']}
    "			shows a '!' if the file format is not the platform
    "			default
    " %{'$'[!&list]}	shows a '*' if in list mode
    " %{'~'[&pm=='']}	shows a '~' if in patchmode
    " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
    "			only for debug : display the current syntax item name
    " %=		right-align following items
    " #%n		buffer number
    " %l/%L,%c%V	line number, total number of lines, and column number
    function! SetStatusLineStyle()
	if &stl == '' || &stl =~ 'synID'
	    let &stl="%f %3*%r%m%1*%h%w[%{&ff}]%2*%([%{IsHexmode()}]%)%([%{'L'[!&list]}]%)%([%{'P'[!&paste]}]%)%7*%([%{&spell?&spl:''}]%)%*[%5*%{&syntax}%*][wc:%4*%{WordCount()}%*]%=%2*%(%{VISMARKLINES()}%)%* (%1*%03b%*, %6*0x%02B%*)%= %15(%{Nr2FormText(line('.'),\"'\")}, %{Nr2FormText(col('.'),\"'\")}%) %=%10P %10([%{Nr2FormText(line('$'),\"'\")}]%)"
	else
	    let &stl="%f %3*%r%m%1*%h%w[%{&ff}]%2*%([%{IsHexmode()}]%)%([%{'L'[!&list]}]%)%([%{'P'[!&paste]}]%)&7*%([%{&spell?&spl:''}]%)%* [%5*%{&syntax}%*]([wc:%4*%{WordCount()}%*]%3*%{synIDattr(synID(line('.'),col('.'),0),'name')}%*)%=%2*%(%{VISMARKLINES()}%)%* (%1*%03b%*, %6*0x%02B%*)%= %15(%{Nr2FormText(line('.'),\"'\")}, %{Nr2FormText(col('.'),\"'\")}%) %=%10P %10([%{Nr2FormText(line('$'),\"'\")}]%)"
	
	endif
    endfunc
    " Switch between the normal and vim-debug modes in the status line
    nmap <silent> _ds  :call SetStatusLineStyle()<CR>
    call SetStatusLineStyle()
    " Window title
    if has('title')
	set titlestring=%t%(\ [%R%M]%)\ (%{expand(\"%:~:.:p:h\")})
    endif
    function! IsHexmode()
    	if !exists("b:myHexOnOff")
	  return ''
	elseif b:myHexOnOff == 1
	  return 'H'
	else
	  return ''
	endif
    endfunction

    function! VISMARKLINES()
      if !exists("b:startvisual")
        let b:startvisual=line(".")
      endif
      if (mode() != "v") && (mode() != "V") && (mode() != "")
        let b:startvisual=line(".")
      endif
    
      let s:differenz = line(".") - b:startvisual
      if s:differenz < 0 
        let s:differenz = -1 * s:differenz
      endif
      let s:sdifferenz = string(s:differenz + 1)
      if (mode() == "v") || (mode() == "V") || (mode() == "")
        return "V: " . s:sdifferenz . "z"
      else
        return ""
      endif
    endfu

    function! Nr2FormText(zahl,trenner)
      let s:zahl   = string(a:zahl)
      let s:maxlen = strlen(s:zahl)
      let s:count  = s:maxlen - 1
      let s:result = ""
      while s:count >= 0 
        let s:result = strpart(s:zahl, s:count, 1) . s:result
        if (((s:maxlen - s:count) % 3) == 0) && s:count > 0
          let s:result = a:trenner . s:result
        endif
        let s:count = s:count - 1
      endwhile
      return s:result
    endfunction


endif
"    hi USER1 ctermfg=lightgreen ctermbg=darkgray
"    hi USER2 ctermfg=yellow     ctermbg=darkgray
"    hi USER3 ctermfg=lightred   ctermbg=darkgray

