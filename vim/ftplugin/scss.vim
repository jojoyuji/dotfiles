" Vim filetype plugin
" Language:	SCSS
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Last Change:	2010 Jul 26

if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/sass.vim
autocmd BufEnter,BufNewFile,BufRead *.scss noremap Q :CSScomb <cr> :call CSSBeautify()<cr>

" vim:set sw=2:
