"Base Config{{{
let g:configpath = "~/dotfiles/"
set shell=bash\ -i
let &t_Co=256
python import sys; sys.path.append("/Library/Python/2.7/site-packages")
"Pathogen{{{
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
"}}}
"}}}
"Performance config{{{
"allows syntax a max of 130 chars
set synmaxcol=130
set nocursorcolumn
set nocursorline
syntax sync minlines=200
"}}}
"Settings {{{1
filetype on
filetype plugin indent on
syntax on
syntax enable
let mapleader=","        " muda o leader para comma
"call togglebg#map("<leader><leader>=")
set foldmethod=indent
set foldlevel=99
set pastetoggle=<F6>
set nocompatible
set shortmess+=filmnrxoOtT
set number               " mostra numero linhas
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup             " dont backup
set noswapfile
set hidden               " u can have an unwritten file to open a new one
set sm
set mouse-=a "disable mouse
set mousehide "hides the mouse while typing
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set smartindent           "quebra de linha com tab
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " These commands open folds
set scrolloff=0 " When the page starts to scroll, keep the cursor 8 lines from the top and 8  lines from the bottom
"set guicursor+=n:blinkwait7
set guicursor=a:blinkon0
set cursorline
set virtualedit=all "para poder andar em espaços em branco (invalid spaces)
set splitright          " Split new vertical windows right of current window.
set splitbelow          " Split new horizontal windows under current window.
"indent options
set cindent
set autoindent
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
"set cinkeys=0{,0},:,0#,!,!^f
set cinkeys=0{,0},0[,0]
set lazyredraw
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
set noerrorbells " No annoying sound on errors
set t_vb=
setglobal fenc=utf-8
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set backspace=indent,eol,start
set history=100
set showmatch
set nowrap
set autoread " refresh changed files automatically
set ignorecase " stuff for searching
set smartcase
set hlsearch
set gdefault   " assume the /g flag on :s substitutions to replace all matches in a line:
set wildignore=*.swp,*.bak,*.pyc,*.class " autocomplete when opening files. behaves somewhat similarly to bash.
set wildignore+=tags,*.bak,*.swp,*.pyc,*.o,*.obj,*.dll,*.exe,*.gif,*.png,*.jpg,*.jpeg
set wildignore+=*.o,*.obj,*.pyc,*.ds_store,*.db,*.swc
set wildmenu
set wildmode=list:longest,full
set infercase
set completeopt=longest,menu,menuone
set complete+=.  "key completition
set complete+=k
set complete+=b
set complete+=t
set completeopt+=menuone,longest
set ofu=syntaxcomplete#complete
set backupdir=/tmp//
set directory=/tmp//
set nobackup
set nowb
set noswapfile
set guifont=monaco\ for\ powerline:h12
"set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
set background=dark
set cmdheight=1 " (sub-optimal) removes many press enter to continue prompts
set list
set listchars=tab:»·,trail:⋅,nbsp:⋅
set nolist
set tags=./tags
set tags+=$home/.vim/tags/python.ctags
set laststatus=2
set tags+=./tags,tags;/

"Conditional Settings {{{

if exists('+autochdir')"
  set autochdir
else
  autocmd BufEnter * silent! lcd %:p:h
endif

if has("persistent_undo")
  set undodir = "~/.vim/undodir"
  set undofile
  set history=1000         " remember more commands and search history
  set undolevels=1000      " use many muchos levels of undo
endif

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif

if &diff
  nmap <c-l> <c-w>l
  nmap <c-h> <c-w>h
endif

"}}}
"}}}
"AutoCommands {{{

au colorscheme * hi cursor guibg=olivedrab1
au insertenter * hi cursor guibg=#0087af
au insertleave * hi cursor guibg=olivedrab1
au insertleave * hi! link CursorColumn CursorLine
au VimEnter * hi CursorLine guibg=NONE guifg=NONE gui=underline


"keep of splits when resized
au vimresized * exe "normal! \<c-w>="

"make sure vim returns to the same line when you reopen a file
au bufreadpost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif

autocmd filetype python set omnifunc=pythoncomplete#complete
autocmd filetype php set omnifunc=phpcomplete#completephp
autocmd BufEnter *.md set filetype=markdown

autocmd BufEnter *.html set foldmethod=indent


" in ruby and scala, we use spaces (two) instead of tabs
au BufRead,BufNewFile *.rb,*.scala set et sw=2 sts=2 ts=8
" in python, we use spaces (four) instead of tabs
au bufread,bufnewfile *.py set et

"}}}
"Improvements FTW {{{1

" Visual mode pressing * or # searches for the current selection{{{
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
"}}}
"Star overer selection highlights it {{{
"AlignReplaceQuotedSpaceslows * on visualmode for searching selected stuff FTW
vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>

"}}}
"Blink next search! {{{
nnoremap <silent> n   n:call HLNext()<cr>
nnoremap <silent> N   N:call HLNext()<cr>
" OR ELSE just highlight the match in red...
function! HLNext ()
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('htmlArg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(120) . 'm'
  call matchdelete(ring)
  redraw
endfunction
"}}}
"Mispelling fix{{{
inoreabbrev lenght length
"}}}
" TextObjects{{{
"
" motion for "next/last object".  "last" here means "previous", not "final".
" unfortunately the "p" motion was already taken for paragraphs.
"
" next acts on the next object of the given type in the current line, last acts
" on the previous object of the given type in the current line.
"
" currently only works for (, [, {, b, r, b, ', and ".
"
" some examples (c marks cursor positions, v means visually selected):
"
" din'  -> delete in next single quotes                foo = bar('spam')
"                                                      c
"                                                      foo = bar('')
"                                                                c
"
" canb  -> change around next parens                   foo = bar('spam')
"                                                      c
"                                                      foo = bar
"                                                               c
"
" vil"  -> select inside last double quotes            print "hello ", name
"                                                                        c
"                                                      print "hello ", name
"                                                             vvvvvv
"

noremap vaf v$f{%;so

onoremap an :<c-u>call <sid>nexttextobject('a', 'f')<cr>
xnoremap an :<c-u>call <sid>nexttextobject('a', 'f')<cr>
onoremap in :<c-u>call <sid>nexttextobject('i', 'f')<cr>
xnoremap in :<c-u>call <sid>nexttextobject('i', 'f')<cr>

onoremap al :<c-u>call <sid>nexttextobject('a', 'f')<cr>
xnoremap al :<c-u>call <sid>nexttextobject('a', 'f')<cr>
onoremap il :<c-u>call <sid>nexttextobject('i', 'f')<cr>
xnoremap il :<c-u>call <sid>nexttextobject('i', 'f')<cr>

function! s:nexttextobject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
    let c = "("
  elseif c ==# "b"
    let c = "{"
  elseif c ==# "r"
    let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" }}}
"}}}
"Utilities {{{

fun! LoadingMsg(message)
  echo a:message
  sleep 3m
endf


" show the current syntax highlight for the current word
map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


"print Output into a buffer
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)


"}}}
"VIMRC Mappings {{{1
map <leader>vv :execute("e ".g:configpath."vimrc")<cr><c-w>
map <leader>gv :execute("e ".g:configpath."gvimrc")<cr><c-w>
map <leader>mp :execute("e ".g:configpath."vim/mappingsrc")<cr><c-w>
map <leader>md :execute(e .g:configpath.vim/mappings_defaultsrc)<cr><c-w>
map <leader>pp :execute("e ".g:configpath."vim/pluginsrc")<cr><c-w>
"edit e reload rápido
nnoremap  <leader>so :call LoadingMsg("Loading vimrc...")<cr>:so $MYVIMRC<cr>
"}}}

"Load externals{{{1
exe ('so '.g:configpath.'vim/pluginsrc')
exe ('so '.g:configpath.'vim/mappingsrc')
exe ('so '.g:configpath.'vim/mappings_defaultsrc')
"}}}
"
colorscheme gruvbox

set copyindent
set shiftround
set foldnestmax=10
set incsearch
set autoread
set undolevels=100


let g:evervim_devtoken='S=s71:U=78d0fc:E=14ddb62c78f:C=14683b19b94:P=1cd:A=en-devtoken:V=2:H=346371d73c05fbba51ccbd0ec5f5543d'
