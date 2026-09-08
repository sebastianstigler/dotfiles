if exists("b:current_syntax")
    finish
endif

syn match pytestError "\v^[>]"
syn match pytestError "\v^[E].*$"
highlight link pytestError Error

syn region pytestSection start=/\v^\=/ end=/\v\=$/ keepend
highlight link pytestSection Statement

syn region pytestSubSection start=/\v^[_]+ / end=/\v$/ keepend
highlight link pytestSubSection Identifier

syn region pytestSubSection2 start=/\v^(_ )+/ end=/\v$/ keepend
highlight link pytestSubSection2 Comment

syn region pytestSubSection3 start=/\v^-+ / end=/\v-$/ keepend
highlight link pytestSubSection3 Comment

  syn match PytestPlatform              '\v^(platform(.*))'
  syn match PytestTitleDecoration       "\v\={2,}"
  syn match PytestTitle                 "\v\s+(test session starts)\s+"
  syn match PytestCollecting            "\v(collecting\s+(.*))"
  syn match PytestPythonFile            "\v((.*.py\s+))"
  syn match PytestFooterFail            "\v\s+((.*)(failed|error) in(.*))\s+"
  syn match PytestFooter                "\v\s+((.*)passed in(.*))\s+"
  syn match PytestFailures              "\v\s+(FAILURES|ERRORS)\s+"
  syn match PytestFailed                "\<FAILED\>"
  syn match PytestSkipped               "\<SKIPPED\>"
  syn match PytestPassed                "\<PASSED\>"
  syn match PytestErrors                "\v^E\s+(.*)"
  syn match PytestDelimiter             "\v_{3,}"
  syn match PytestFailedTest            "\v_{3,}\s+(.*)\s+_{3,}"

  hi def link PytestPythonFile          String
  hi def link PytestPlatform            String
  hi def link PytestCollecting          String
  hi def link PytestTitleDecoration     Comment
  hi def link PytestTitle               String
  hi def link PytestFooterFail          String
  hi def link PytestFooter              String
  hi def link PytestFailures            Error
  hi def link PytestErrors              Error
  hi PytestPassed              ctermfg=green cterm=bold
  hi PytestFailed              ctermfg=red cterm=bold
  hi PytestSkipped            ctermfg=yellow cterm=bold
  hi def link PytestDelimiter           Comment
hi def link PytestFailedTest Comment

syn include @pyth syntax/python.vim
syn region pytestPython start=/\v^[ >]   / end=/\v^[^ >]@=/ contains=@pyth,pytestError skipwhite keepend

let b:current_syntax = "pytest"
