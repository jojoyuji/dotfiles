set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto"
let g:configpath = "~/dotfiles/"
let &t_Co=256
let t_Co=256

"Performance config
set synmaxcol=120
set nocursorcolumn
set nocursorline
syntax sync minlines=200

"Settings
set nocompatible
filetype plugin indent on
syntax on
syntax enable
set clipboard=unnamed

set ttimeout
set ttimeoutlen=50
set notimeout
let mapleader=" "        " muda o leader para comma
set foldmethod=indent
" set foldlevel=99
set foldnestmax=20
set pastetoggle=<F6>
set shortmess+=filmnrxoOtT
set number               " mostra numero linhas
set numberwidth=5 "margin-left entre os numeros
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup             " dont backup
set noswapfile
set hidden               " u can have an unwritten file to open a new one
set confirm              " kill unwritten buffer
set sm
set mouse-=a "disable mouse
set mousehide "hides the mouse while typing
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set smartindent           "quebra de linha com tab
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " These commands open folds
set scrolloff=0 " When the page starts to scroll, keep the cursor 8 lines from the top and 8  lines from the bottom
set guicursor=a:blinkon0
set virtualedit=all "para poder andar em espaços em branco (invalid spaces)
set splitright          " Split new vertical windows right of current window.
set splitbelow          " Split new horizontal windows under current window.

" Indent options

set cindent
set autoindent
set expandtab
set softtabstop=1
set tabstop=1
set shiftwidth=2
set cinkeys=0{,0},0[,0]
set nolazyredraw
set nocuc nocul
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
set noerrorbells " No annoying sound on errors
set t_vb=
set fillchars+=stl:\ ,stlnc:\
set fillchars+=vert:\ "spacing
set backspace=indent,eol,start
set history=100
set showmatch
set nowrap

set autoread " refresh changed files automatically
 " Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

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
set completefunc+=emoji#complete
set ofu=syntaxcomplete#complete
set backupdir=/tmp//
set directory=/tmp//
set nobackup
set nowb
set noswapfile
"set guifont=DroidSansMonoPowerLine:h15
set cmdheight=1 " (sub-optimal) removes many press enter to continue prompts
set list
set listchars=tab:»·,trail:⋅,nbsp:⋅
set nolist
set tags=./tags
set tags+=$home/.vim/tags/python.ctags
set laststatus=2
set copyindent
set shiftround
set foldnestmax=10
set incsearch
set autoread
set undolevels=100
set modeline

"Conditional Settings {{{
if exists('+autochdir')"
  set autochdir
endif
autocmd BufEnter * lcd %:p:h

if has("persistent_undo")
  set undodir = "~/.vim/undodir"
  set undofile
  set history=1000    " remember more commands and search history
  set undolevels=1000 " use many muchos levels of undo
endif

if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif

"keep of splits when resized
au VimResized * exe "normal! \<c-w>="

"make sure vim returns to the same line when you reopen a file
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif

autocmd filetype php set omnifunc=phpcomplete#completephp

autocmd BufEnter *.md set filetype=markdown

"}}}
"Improvements FTW {{{1

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
nnoremap <silent> n   n:call HLNext()<cr>zz
nnoremap <silent> N   N:call HLNext()<cr>zz
" OR ELSE just highlight the match in red...
function! HLNext ()
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  "let ring = matchadd('htmlArg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(120) . 'm'
  "call matchdelete(ring)
  redraw
endfunction
"}}}
"Mispelling fix{{{
inoreabbrev lenght length
"}}}

noremap vaf v$f{%;so


"Utilities {{{

fun! LoadingMsg(message)
  echo a:message
  sleep 3m
endf

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
map <leader>vmp :execute("e ".g:configpath."vim/mappingsrc")<cr><c-w>
map <leader>vp :execute("e ".g:configpath."vim/pluginsrc")<cr><c-w>
map <leader>vz :execute("e ".g:configpath."zshrc")<cr><c-w>
"edit e reload rápido
nnoremap  <leader>so :call LoadingMsg("Loading vimrc...")<cr>:so $MYVIMRC<cr>
"}}}
"Load externals{{{1
exe ('so '.g:configpath.'vim/pluginsrc')
exe ('so '.g:configpath.'vim/mappingsrc')
"}}}

set background=dark

silent! colorscheme gruvbox8_hard

 if &term =~ '256color'
   "Disable Background Color Erase (BCE) so that color schemes work
   "properly within 256-color terminals
  set t_ut=
endif
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

let g:loaded_python_provider = 1
if has('python3')
  let g:UltiSnipsUsePythonVersion = 3
else
  let g:UltiSnipsUsePythonVersion = 2
endif
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

if has('nvim')
  set noshowcmd
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif

let g:CSScombPluginDir = fnamemodify(expand("<sfile>"), ":h")

function! g:CSScomb(count, line1, line2)
    let content = getline(a:line1, a:line2)

    let tempFile = tempname() . '.' . &filetype
    call writefile(content, tempFile)
    let systemOutput = system('csscomb ' . shellescape(tempFile))
    if len(systemOutput)
        echoerr split(systemOutput, "\n")[1]
    else
        let lines = readfile(tempFile)
        call setline(a:line1, lines)
    endif
endfunction

command! -nargs=? -range=% CSScomb :call g:CSScomb(<count>, <line1>, <line2>, <f-args>)
