" File:        todo.txt.vim
" Description: Todo.txt syntax settings
" Author:      Leandro Freitas <freitass@gmail.com>
" License:     Vim license
" Website:     http://github.com/freitass/todo.txt-vim
" Version:     0.3

if exists("b:current_syntax")
    finish
endif

syntax  match  TodoDone       '^[xX]\s.\+$'               contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityA  '^([aA])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityB  '^([bB])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityC  '^([cC])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityD  '^([dD])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityE  '^([eE])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityF  '^([fF])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityG  '^([gG])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityH  '^([hH])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityI  '^([iI])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityJ  '^([jJ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityK  '^([kK])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityL  '^([lL])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityM  '^([mM])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityN  '^([nN])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityO  '^([oO])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityP  '^([pP])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityQ  '^([qQ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityR  '^([rR])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityS  '^([sS])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityT  '^([tT])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityU  '^([uU])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityV  '^([vV])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityW  '^([wW])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityX  '^([xX])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityY  '^([yY])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoPriorityZ  '^([zZ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext,TodoDUE,TodoNEED,TodoDEFERRED,TodoWAIT
syntax  match  TodoDate       '\d\{2,4\}-\d\{2\}-\d\{2\}' contains=NONE
syntax  match  TodoProject    ' +[^[:blank:]]\+'          contains=NONE
syntax  match  TodoContext    ' @[^[:blank:]]\+'          contains=NONE
syntax  match  TodoDUE        ' due:[^[:blank:]]\+'       contains=NONE
syntax  match  TodoNEED       ' need:[^[:blank:]]\+'      contains=NONE
syntax  match  TodoDEFERRED   ' t:[^[:blank:]]\+'         contains=NONE
syntax  match  TodoWAIT       ' wait:[^[:blank:]]\+'      contains=NONE

" Other priority colours might be defined by the user
highlight  default  link  TodoDone       Comment
highlight  default  link  TodoPriorityA  Constant
highlight  default  link  TodoPriorityB  Statement
highlight  default  link  TodoPriorityC  Identifier
highlight  default  link  TodoDate       PreProc
highlight  default  link  TodoProject    Special
highlight  default  link  TodoContext    Special
highlight  default  link  TodoDUE        Title
highlight  default  link  TodoNEED       SpecialKey
highlight  default  link  TodoDEFERRED   ModeMSG
highlight                 TodoWAIT       cterm=bold ctermfg=yellow

let b:current_syntax = "todo"
