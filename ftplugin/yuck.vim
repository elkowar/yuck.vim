if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms< fo<"

setlocal iskeyword=!,$,%,#,*,+,-,.,/,:,<,=,>,?,_,a-z,A-Z,48-57,128-247,124,126,38,94
setlocal suffixesadd=.yuck
setlocal comments=n:; commentstring=;\ %s
setlocal formatoptions-=t

if !exists("g:yuck_recommended_style") || g:yuck_recommended_style != 0
  let b:undo_ftplugin ..= " sw< sts< et<"
  setlocal shiftwidth=2 softtabstop=2 expandtab
  setlocal autoindent nosmartindent
endif

let &cpo = s:cpo_save
unlet! s:cpo_save
