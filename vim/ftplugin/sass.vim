" Vim filetype plugin
" Language:	Sass
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2010 Jul 26

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
"setlocal suffixesadd=.sass,.scss,.css

"let &l:include = '^\s*@import\s\+\%(url(\)\=["'']\='

augroup foldingsass
  au BufEnter *.sass set foldmethod=indent 
  au BufEnter *.sass set foldlevel=10
augroup END


autocmd BufEnter,BufNewFile,BufRead *.sass noremap Q :CSScomb <cr> :call CSSBeautify()<cr>
" vim:set sw=2:
