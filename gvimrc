macmenu &File.New\ Window key=<nop>
macmenu File.Print key=<nop>
macmenu Window.Minimize key=<nop>
macmenu Tools.List\ Errors key=<nop>
macmenu Edit.Find.Find\.\.\. key=<nop>

noremap <d-p> :CtrlP<cr>
"map <D-f> /
imap <d-l> <c-x><c-f><down>
imap <d-j> <c-n>
imap <d-k> <c-p>

"inoremap <expr> <d-n> pumvisible() ? '<d-n>' :
"\ '<c-n><c-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<d-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <d-m> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
      \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <D-M> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
      \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

noremap <D-e> <C-u><CR>
noremap <D-d> <C-d><CR>
noremap zl zL
noremap zh zH

noremap <D-i> zL
noremap <D-o> zH
set  colorcolumn=130
set fuoptions=maxvert,maxhorz
let b:vm_guibg="green"
set showbreak=↪


"resize windows
nnoremap <silent> <D-up> :exe "resize " . (winheight(0) * 4/3)<cr>
nnoremap <silent>  <D-down> :exe "resize " . (winheight(0) * 3/4)<cr>

"formating withoutth JSbeautify
nnoremap <D-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <d-f> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <d-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <d-f> :call CSSBeautify()<cr>

