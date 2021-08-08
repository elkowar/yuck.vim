if exists("b:current_syntax")
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

syn match YuckComment ";.*$"

syntax match YuckStringEscape '\v\\%([abfnrtv'"\\]|x[[0-9a-fA-F]]\{2}|25[0-5]|2[0-4][0-9]|[0-1][0-9][0-9])' contained

syntax region YuckString matchgroup=YuckStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=YuckStringEscape,@Spell,YuckStringInterp
syntax region YuckString matchgroup=YuckStringDelimiter start=/'/ skip=/\\\\\|\\'/ end=/'/ contains=YuckStringEscape,@Spell,YuckStringInterp
syntax region YuckString matchgroup=YuckStringDelimiter start=/`/ skip=/\\\\\|\\`/ end=/`/ contains=YuckStringEscape,@Spell,YuckStringInterp


syntax region YuckStringInterp matchgroup=YuckInterpDelimiter start=/\${/ end=/}/ contains=@YuckTop,@Spell contained


syn keyword YuckBoolean true
syn keyword YuckBoolean false

syn keyword YuckSpecialSymbol defwidget defwindow defpoll defvar deflisten geometry struts include


syn match YuckSymbol '[a-zA-Z_!\?<>/\.\*-+\-][^\r\n\t\f \(\)\[\]{}]*'
syn match YuckKeyword '\<:[^\r\n\t ]\+'

syntax match YuckNumber "\v\c<[-+]?\d*\.?\d*%([eE][-+]?\d+)?>"
syntax match YuckNumber "\v\c<[-+]?0x[0-9A-F]*\.?[0-9A-F]*>"

syntax cluster YuckTop contains=YuckComment,YuckConstant,YuckQuote,YuckKeyword,YuckSymbol,YuckNumber,YuckString,YuckList,YuckArray,YuckTable,YuckSpecialSymbol,YuckBoolean

syntax region YuckList matchgroup=YuckParen start="("  end=")" contains=@YuckTop fold
syntax region YuckArray matchgroup=YuckParen start="\[" end="]" contains=@YuckTop fold
syntax region YuckTable matchgroup=YuckParen start="{"  end="}" contains=@YuckTop fold

syntax match YuckError "]\|}\|)"

syntax sync fromstart


" Highlighting
hi def link YuckComment Comment
hi def link YuckSymbol Identifier
hi def link YuckNumber Number
hi def link YuckConstant Constant
hi def link YuckKeyword Keyword
hi def link YuckSpecialSymbol Special
hi def link YuckString String
hi def link YuckBuffer String
hi def link YuckStringDelimiter String
hi def link YuckBoolean Boolean
hi def link YuckInterpDelimiter Special

hi def link YuckParen Delimiter


let b:current_syntax = "yuck"

let &cpo = s:save_cpo
unlet! s:save_cpo
