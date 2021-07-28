if exists("b:ft_initialized")
  finish
endif


let b:ft_initialized = 1
let s:cpo_save = &cpo
set cpo&vim

setlocal iskeyword=!,$,%,#,*,+,-,.,/,:,<,=,>,?,_,a-z,A-Z,48-57,128-247,124,126,38,94
setlocal suffixesadd=.yuck
setlocal formatoptions-=t
setlocal comments=n:;
setlocal commentstring=;\ %s


let &cpo = s:cpo_save
