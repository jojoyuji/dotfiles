" Vim filetype plugin
" Language:	Stylus
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2010 Jul 26

autocmd BufEnter,BufNewFile,BufRead *.styl noremap Q :CSScomb <cr> :call CSSBeautify()<cr>
" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
"let b:did_ftplugin = 1

"let b:undo_ftplugin = "setl cms< def< inc< inex< ofu< sua<"

"setlocal commentstring=//\ %s
"setlocal define=^\\s*\\%(@mixin\\\|=\\)
"setlocal includeexpr=substitute(v:fname,'\\%(.*/\\\|^\\)\\zs','_','')
"setlocal omnifunc=csscomplete#CompleteCSS
"setlocal suffixesadd=.styl,.scss,.css

"let &l:include = '^\s*@import\s\+\%(url(\)\=["'']\='

"augroup foldingstylus
  "au BufEnter *.styl set foldmethod=indent
  "au BufEnter *.styl set foldlevel=10
  "au BufEnter *.styl set ft=css
"augroup END



" vim:set sw=2:
