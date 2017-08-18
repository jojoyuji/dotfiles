"noremap Q :Esformatter<cr>
"vnoremap Q :EsformatterVisual<cr>
"au FileWritePre, BufWritePre *.js :Esformatter  % <cr>
"


autocmd BufEnter,BufNewFile,BufRead *.js noremap Q :Prettier<cr> :set nofen<cr>
