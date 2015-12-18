map Q :Esformatter<cr>
vmap Q :EsformatterVisual<cr>
au FileWritePre, BufWritePre *.js :Esformatter  % <cr>
