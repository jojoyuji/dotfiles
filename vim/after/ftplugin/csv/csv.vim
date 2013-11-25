if exists("did_load_csvfiletype")
  finish
endif
let did_load_csvfiletype=1

augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
  "applies Align plugin
  au! BufWrite *.csv,*.dat normal ggVG ,t,
augroup END

noremap W f, w
"xmap ic F ct,
"echo 'hello'
