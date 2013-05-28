call pathogen#infect()
call pathogen#helptags()

filetype on
filetype plugin indent on

au colorscheme * hi cursor guibg=olivedrab1
au insertenter * hi cursor guibg=#0087af

au insertleave * hi cursor guibg=olivedrab1
au insertleave * hi! link CursorColumn CursorLine
au VimEnter * hi CursorLine guibg=NONE guifg=NONE gui=underline
set cursorline
nnoremap Q   gg=G``zz
"different search, show a quickfix window and line numbers
nnoremap // :g//#<left><left>


"allows syntax a max of 100 chars
set synmaxcol=800

set splitright          " Split new vertical windows right of current window.
set splitbelow          " Split new horizontal windows under current window.

nnoremap gu :OpenURL<cr>


"Functions to Minify stuff
function! MinifyJs()
  execute( "!yuicompressor % -o %.min.js --type js")
endfunction

function! MinifyCss()
  execute( "!yuicompressor % -o %.min.css --type css")
endfunction

command! MinifyJs call MinifyJs()
command! MinifyCss call MinifyCss()


"joins selected lines
nnoremap <D-J>  vipJ
inoremap <D-J>  <Esc>vipJi
vnoremap <D-J>  J

"To apply a command in a selected block
vmap ; :
"for surround plugin 
vmap s S 

"remove trailing white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''


noremap <d-enter> :silent !open . 

let g:mta_filetypes = {
      \ 'html'  : 1,
      \ 'xhtml' : 1,
      \ 'xml'   : 1,
      \ 'eruby' : 1,
      \ 'jinja' : 1
      \}


"fix for annoying man!
noremap K <nop>


""{{{ 14/11/2012 cool stuff in scrncasts youtube

"keep of splits when resized
au vimresized * exe "normal! \<c-w>="

"make sure vim returns to the same line when you reopen a file
augroup line_return
  au!
  au bufreadpost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
  augroup end

    let g:used_javascript_libs = 'underscore,angularjs'
    "open a quickfix window for the last search
    "nnoremap <silent> <leader><leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

    "use ,z to 'focus'   the current fold
    nnoremap <leader>z zmzvzz

    "cmd+u faz a palavra corrente em maiuscula (insert/normal)
    nnoremap <d-u> <esc>guiw
    nnoremap <d-u> <esc>guiw
    inoremap <d-u> <esc>guiwea
    inoremap <d-u> <esc>guiwea

    "substitute
    nnoremap <leader>s :%s//<left>




    "file completition

    inoremap <d-f> <c-x><c-F>
    " source
    vnoremap <leader><leader>s y:execute @@<cr>:echo 'sourced selection.'<cr>
    nnoremap S ^vg_y:execute @@<cr>:echo 'sourced line.'<cr>

    " next and last {{{
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

    noremap vaf V$F{%;so

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
    " ack motions {{{

    " motions to ack for things.  works with pretty much everything, including:
    "
    "   w, w, e, e, b, b, t*, f*, i*, a*, and custom text objects
    "
    " awesome.
    "
    " note: if the text covered by a motion contains a newline it won't work.  ack
    " searches line-by-line.

    nnoremap <leader>/ :ack! '<c-r><c-w>'
    xnoremap <silent><leader>/ :<c-u>call <sid>ackmotion(visualmode())<cr>

    function! s:copymotionfortype(type)
      if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
      elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
      endif
    endfunction

    function! s:ackmotion(type) abort
      let reg_save = @@

      call s:copymotionfortype(a:type)

      execute "normal! :ack! --literal " . shellescape(@@) . "\<cr>"

      let @@ = reg_save
    endfunction

    " }}}

    "extends text-objs
    let pairs = [ ".", ":", "<bar>", "/", "<bslash>", "*" ]
    for key in pairs
      execute "nnoremap ci".key." t".key."ct".key
      execute "nnoremap di".key." t".key."dt".key
      execute "nnoremap yi".key." t".key."yt".key
      execute "nnoremap vi".key." t".key."vt".key
      execute "nnoremap ca".key." f".key."cf".key
      execute "nnoremap da".key." f".key."df".key
      execute "nnoremap ya".key." f".key."yf".key
      execute "nnoremap va".key." f".key."vf".key
    endfor

    "}}}
    "{{{
    """"""""""""""""""""""""""""""
    " => Visual mode related
    """"""""""""""""""""""""""""""
    " Visual mode pressing * or # searches for the current selection
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



    set lazyredraw

    " For regular expressions turn magic on
    set magic

    " Show matching brackets when text indicator is over them
    set showmatch
    " How many tenths of a second to blink when matching brackets
    set mat=2

    " No annoying sound on errors
    set noerrorbells
    set t_vb=
    "}}}

    let g:Powerline_symbols = 'fancy'
    autocmd BufEnter * lcd %:p:h
    map \ :call RepeatFSearch()<CR>

    fun! RepeatFSearch()
      let s:pos1 = getpos(".")
      normal! ;
      let s:pos2 = getpos(".")
      if s:pos1 == s:pos2
        normal! 2;
      endif
    endfunction

    nmap N Nzz
    nmap n nzz

    "bubble single lines
    "cmd+opt+k
    nmap <D-˚> ddkP
    "cmd+opt+j
    nmap <D-∆> ddp

    "bubble multiples lines
    "cmd+opt+k
    vmap <D-˚> xkP`[V`]
    "cmd+opt+j
    vmap <D-∆> xp`[V`]

    if has('gui_running')
      noremap <D-e> <C-u><CR>
      noremap <D-d> <C-d><CR>
      noremap <D-i> zL
      noremap <D-o> zH
      set  colorcolumn=130
      set fuoptions=maxvert,maxhorz
      let b:vm_guibg="green"
      set showbreak=↪
    endif
    "muda para o diretório do arquivo atual
    fun! OpenDict(type)
      let nome = a:type
      execute "edit $HOME/.vim/dicionario/".nome
      exe "enew"
      "bfirst
    endfun

    if has("persistent_undo")
      set undodir = "/Users/jojo/.vim/undotree/"
      set undofile
    endif

    let s:current_file=expand("<sfile>")
    let g:neocomplcache_enable_at_startup = 1

    "{{{  autochdir TEST
    set autochdir
    if exists('+autochdir')"
      set autochdir
    else
      "autocmd bufenter * silent! lcd %:p:h:gs/ /\\ /
      autocmd bufenter * silent! lcd %:p:h
    endif

    autocmd bufenter * silent! lcd %:p:h
    "}}}
    set foldmethod=marker
    set pastetoggle=<f8>
    set nocompatible
    set shortmess+=filmnrxoOtT
    let mapleader=","        " muda o leader para comma
    nnoremap ; :
    nnoremap \ ;
    set history=1000         " remember more commands and search history
    set undolevels=1000      " use many muchos levels of undo
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
    "para poder andar em espaços em branco (invalid spaces)
    set virtualedit=all

    noremap<silent> <leader>todo  :noautocmd vimgrep /TODO/j **/*<CR>:copen<CR>
    noremap<silent> <leader><leader>u  :UndotreeToggle<CR> :wincmd w<cr>
    noremap <leader><leader>d :call OpenDict("dicionario") <CR>


    "{{{ bookmarkingplugin()
    "
    nmap <leader>mm :ToggleBookmark<cr>
    nmap <leader>mn :NextBookmark<cr>
    nmap <leader>mb :PreviousBookmark<cr>
    let g:bookmarking_menu = 1

    "}}}


    "indent options
    set ts=2 sw=2

    nmap <silent> <leader><space> :silent noh<cr>
    noremap <leader>mr :MRU<cr>
    noremap <leader>sf :set filetype=

    "ta) vira identador
    map <tab> >gv
    map <s-tab> <gv
    nmap <tab> >>
    nmap <s-tab> <<

    "yankring shortcut
    nnoremap <silent> <leader><leader>y :YRShow<cr>

    "breakline ctrl+shift+j
    nnoremap <D-j> i<cr><esc>

    map <leader>q <esc>:call CleanClose(0)

    function! CleanClose(tosave)
      if (a:tosave == 1)
        w!
      endif
      let todelbufNr = bufnr("%")
      let newbufNr = bufnr("#")
      if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b".newbufNr
      else
        bnext
      endif

      if (bufnr("%") == todelbufNr)
        new
      endif
      exe "bd".todelbufNr
    endfunction


    "colorthemes
    nnoremap  <d-1> :colorscheme twilight<cr>:echo 'twilight'<cr>
    nnoremap  <d-2> :colorscheme solarized<cr>
    nnoremap  <d-3> :colorscheme gruvbox<cr>
    nnoremap  <d-4> :colorscheme badwolf<cr>
    nnoremap  <d-5> :colorscheme freya<cr>
    nnoremap  <d-6> :colorscheme jellybeans<cr>
    nnoremap  <d-7> :colorscheme molokai<cr>
    nnoremap  <d-8> :colorscheme wombat256<cr>
    nnoremap  <d-9> :colorscheme zmrok<cr>



    "transparency
    map  <silent> <d-[> :set transparency-=1<cr>
    map  <silent> <d-]> :set transparency+=1<cr>



    map <leader><leader>` <esc>:set guifont=*<cr>
    map <leader><leader>1 <esc>:set guifont=inconsolata:h15<cr>
    map <leader><leader>2 <esc>:set guifont=monaco:h9<cr>
    map <leader><leader>3 <esc>:set guifont=bitstream\ vera\ sans\ mono:h12<cr>
    map <leader><leader>4 <esc>:set guifont=proggyclean:h11<cr>
    map <leader><leader>5 <esc>:set guifont=andale\ mono:h12<cr>
    map <leader><leader>6 <esc>:set guifont=menlo:h13<cr>
    map <leader><leader>7 <esc>:set guifont=courier:h13<cr>

    "snippets
    "lorem snippet
    inoreabbrev loremy lorem ipsum dolor sit amet, consectetuer radipiscing elit, <nl> sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna<nl> aliquam erat volutpat. ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.
    inoreabbrev livereloady <script>document.write('<script src="http://' + (location.host \|\| 'localhost').split(':')[0] + ':35729/livereload.js"></' + 'script>')</script>
    inoreabbrev bsy -moz-box-shadow: 5px 5px 5px #ccc;  -webkit-box-shadow: 5px 5px 5px #ccc;  box-shadow: 5px 5px 5px #ccc;
    inoreabbrev bsiy -moz-box-shadow: inset 5px 5px 5px #ccc;  -webkit-box-shadow: inset 5px 5px 5px #ccc;  box-shadow: inset 5px 5px 5px #ccc;
    "inoreabbrev bgy background:color; background: -webkit-gradient(linear, left top, left bottom, from(color), to(color));background: -moz-linear-gradient(top,  color,  color);
    "inoreabbrev bgy background-image: linear-gradient(bottom, COLOR 0%, COLOR 60%);
    inoreabbrev bgy background: #6cab26; background-image: url(IMAGE_URL); /*fallback */ <nl> background-image: url(IMAGE_URL), -webkit-gradient(linear, left top, left bottom, from(#444444), to(#999999)); /* Saf4+, Chrome */ <nl>background-image: url(IMAGE_URL), -webkit-linear-gradient(top, #444444, #999999); /* Chrome 10+, Saf5.1+ */ <nl> background-image:    url(IMAGE_URL), -moz-linear-gradient(top, #444444, #999999); /* FF3.6+ */ <nl>background-image: url(IMAGE_URL), -ms-linear-gradient(top, #444444, #999999); /* IE10 */    <nl> background-image:url(IMAGE_URL), -o-linear-gradient(top, #444444, #999999); /* Opera 11.10+ */ <nl>background-image:url(IMAGE_URL), linear-gradient(top, #444444, #999999); /* W3C */
    inoreabbrev rcy10  -moz-border-radius: 10px;   -webkit-border-radius: 10px;   border-radius: 10px;    -khtml-border-radius: 10px;
    inoreabbrev rcy5  -moz-border-radius: 5px;   -webkit-border-radius: 5px;   border-radius: 5px;    -khtml-border-radius: 5px;
    inoreabbrev phpy <?php ?><esc>3ha
    inoreabbrev phpey ?><?php<esc>F>a
    inoreabbrev taby ➥

    "folding markers for files
    "folding for css/js
    inoreabbrev fsy /*{{{<nl>*/<esc>kA
    inoreabbrev fey /*<nl>}}}*/<esc>kA
    inoreabbrev fstart /*{{{<nl>*/<esc>kA
    inoreabbrev fend /*<nl>}}} */<esc>kA
    inoreabbrev fshy <!--{{{<nl>--><esc>kA
    inoreabbrev fehy <!--<nl>}}}--><esc>kA
    "folding for php
    au filetype php inoreabbrev fsy <?php/*{{{<nl>*/?><esc>kA
    au filetype php inoreabbrev fey <?php/*<nl>}}}?> <esc>kA

    "folding for html
    au filetype html inoreabbrev fsy <!--{{{<nl>--><esc>kA
    au filetype html inoreabbrev fey <!--<nl>}}}--><esc>kA


    "edit e reload rápido
    nnoremap  <leader>ev :e $MYVIMRC
    nnoremap  <leader>so :so $MYVIMRC<CR>

    let mru_max_entries = 200
    let MRU_Window_Height = 15

    let g:user_zen_settings = {
          \  'php' : {
          \    'extends' : 'html',
          \    'filters' : 'c',
          \  },
          \  'xml' : {
          \    'extends' : 'html',
          \  },
          \  'haml' : {
          \    'extends' : 'html',
          \  },
          \}
    let g:user_zen_expandabbr_key = '<c-e>'
    let g:user_zen_leader_key = '<c-e>'
    let g:use_zen_complete_tag = 1

    set cindent
    set autoindent
    set expandtab
    set softtabstop=2
    set tabstop=2
    set shiftwidth=2
    "set cinkeys=0{,0},:,0#,!,!^f
    set cinkeys=0{,0},0[,0]



    "abre por outros apps
    nmap <leader>oi :!open -a preview.app % <cr>
    nmap <leader>of :!open -a firefox.app % <cr>
    nmap <leader>og :!open -a "google chrome"  %<cr>

    "windows manager
    "tabbing
    imap <a-tab> <esc>:wincmd w<cr>
    nmap <a-tab> :wincmd w<cr>
    nmap <leader><tab> :wincmd w<cr>
    "changepositions
    nnoremap <silent> <d-a-left> :wincmd h <cr>
    nnoremap <silent> <d-a-up> :wincmd k <cr>
    nnoremap <silent> <d-a-down> :wincmd j <cr>
    nnoremap <silent> <d-a-right> :wincmd l <cr>
    "resize windows
    nnoremap <silent> <D-down> :exe "resize " . (winheight(0) * 4/3)<cr>
    nnoremap <silent>  <D-up> :exe "resize " . (winheight(0) * 3/4)<cr>


    nnoremap <silent> <s-c-a-right> :exe "20wincmd >"<cr>
    nnoremap <silent> <s-c-a-left> :exe "20wincmd <"<cr>
    "folding
    
    nnoremap zr zR
    nnoremap zm zM

    "markdown para html
    nmap <leader>md :%!/usr/local/bin/markdown.pl --html4tags <cr>

    let g:quickrun_no_default_key_mappings = 1
    let g:tlist_javascript_settings = 'javascript;o:object;f:function'
    let g:tlist_javascript_settings = 'js;o:object;f:function'
    " default file encoding for new files
    setglobal fenc=utf-8
    set encoding=utf-8

    " general things
    set nocompatible
    set backspace=indent,eol,start
    syntax on

    compiler! pyunit "for :make to understand python unittests
    let python_highlight_numbers = 1
    let python_highlight_builtins = 1
    let python_highlight_exceptions = 1

    " kill error bells entirely
    set noerrorbells
    set t_vb=

    set history=100
    set showmatch
    set nowrap
    "set wrap
    "set lbr
    set autoread " refresh changed files automatically

    " stuff for searching
    set ignorecase
    set smartcase
    set hlsearch
    set gdefault   " assume the /g flag on :s substitutions to replace all matches in a line:

    " autocomplete when opening files. behaves somewhat similarly to bash.
    set wildignore=*.swp,*.bak,*.pyc,*.class
    set wildignore+=tags,*.bak,*.swp,*.pyc,*.o,*.obj,*.dll,*.exe,*.gif,*.png,*.jpg,*.jpeg
    set wildignore+=*.o,*.obj,*.pyc,*.ds_store,*.db,*.swc
    set wildmenu
    set wildmode=list:longest,full
    set infercase
    set completeopt=longest,menu,menuone
    " omnicomplete on ctrl-l
    inoremap <c-l> <c-x><c-o>
    "key completition
    set complete+=.
    set complete+=k
    set complete+=b
    set complete+=t
    set completeopt+=menuone,longest
    set ofu=syntaxcomplete#complete


    " in ruby and scala, we use spaces (two) instead of tabs
    au BufRead,BufNewFile *.rb,*.scala set et sw=2 sts=2 ts=8
    " in python, we use spaces (four) instead of tabs
    au bufread,bufnewfile *.py set et

    set backupdir=/tmp//
    set directory=/tmp//
    set nobackup
    set nowb
    set noswapfile

    if has('gui_running')
      set columns=150
      set guioptions-=m  " hide the menu bar
      set guioptions-=t  " hide the toolbar
      set guioptions-=r  " hide the right-hand scroll bar
      set guioptions-=l  " hide the left-hand scroll bar
      set guioptions-=l  " hide the left-hand scrollbar for splits/new windows
      set guioptions-=r  " hide the right-hand scrollbar for splits/new windows
      set guioptions-=L  " hide the left scrollbar from NERDTree
      set guioptions-=b
      " shows/hides menu bar on ctrl-f1
      if has('gui_gtk2')
        set guifont=monospace\ 10
        set cmdheight=1
        let g:ackprg="ack-grep -H --nocolor  --nogroup --column"
      end
      if has('gui_macvim')
        "set noantialias
        set guifont=inconsolata:h14
        syntax enable
        set background=dark
        colorscheme gruvbox
        call togglebg#map("<leader><leader>=")
        set cmdheight=1 " (sub-optimal) removes many press enter to continue prompts
      end
    else
      "set t_co=256
      set cmdheight=1
    endif
    set list
    set listchars=tab:»·,trail:⋅,nbsp:⋅

    " my settings
    map <c-tab> :NERDTreeToggle<cr>

    let NERDTreeShowBookmarks=1

    map <silent> <leader><leader><tab>  :call rc:syncTree()<cr><space>
    "map <leader>r :NERDTreeFind<cr>
    "allows NERDTree to change de cur dir
    let g:NERDTreeChDirMode=2
    "" returns true iff is NERDTree open/active
    function! rc:isNTOpen()
      return exists("t:NERDTreeBufName")
    endfunction

    "calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
    function! rc:syncTree()
      if rc:isNTOpen() == 0
        NERDTree
      elseif &modifiable
        NERDTree %:p:h
      else
        NERDTreeToggle
      endif
    endfunction

    " no dollar sign at end of line
    set nolist
    "let mapleader = ","
    map <leader>cd :cd %:p:h<cr>
    " maps for jj to act as esc
    ino jj <esc>
    cno jj <c-c>
    "set cursorline
    set hidden "not forced to save before switching buffers
    map <s-h> ^
    map <s-l> $


    " fugitive
    " remove old fugitive buffers
    autocmd bufreadpost fugitive://* set bufhidden=delete
    let g:gitv_commitstep = 100
    let g:gitv_openhorizontal = 0

    highlight diffadded guifg=#00bf00
    highlight diffremoved guifg=#bf0000

    let g:LustyExplorerSuppressRubyWarning = 1
    <l></l>et g:LustyJugglerShowKeys = 1

    " ,v brings up .vimrc
    " ,v reloads it -- making all changes active (have to save first)
    map <leader>vv :e ~/dotfiles/vimrc<cr><c-w>
    map <leader>gv :e ~/dotfiles/gvimrc<cr><c-w>

    noremap <leader>b :LustyBufferExplorer<cr>


    autocmd filetype python set omnifunc=pythoncomplete#complete
    "autocmd filetype python set omnifunc=pysmell#complete
    autocmd filetype php set omnifunc=phpcomplete#completephp

    if &diff
      nmap <c-l> <c-w>l
      nmap <c-h> <c-w>h
    endif



    "eof
    set tags=./tags
    set tags+=$home/.vim/tags/python.ctags
    set tags+=./tags,tags;/
    nnoremap <F12> :TagbarToggle<cr>
    let g:tagbar_type_css = {
    \ 'ctagstype' : 'Css',
        \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
        \ ]
    \ }
    "let g:tagbar_type_javascript = {
      "\ 'ctagsbin' : 'jsctags'
      "\ }

    " quickfix
    let g:jah_quickfix_win_height = 10
    " toggles the quickfix window.
    "command -bang -nargs=? Qfix call QFixToggle(<bang>0)
    function! QFixToggle(forced)
      if exists("g:qfix_win") && a:forced == 0
        cclose
      else
        execute "copen " . g:jah_quickfix_win_height
      endif
    endfunction
    " used to track the quickfix window
    augroup qfixtoggle
      autocmd!
      autocmd bufwinenter quickfix let g:qfix_win = bufnr("$")
      autocmd bufwinleave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
      augroup end

        :hi cursorline   cterm=none ctermbg=darkred ctermfg=white guibg=#333333 guifg=white
        :hi cursorcolumn cterm=none ctermbg=darkred ctermfg=white guibg=#333333 guifg=white
        "set cursorline! cursorcolumn!

        "mapping window management
        map <d-S-left> <C-W>H
        map <d-S-down> <C-W>J
        map <d-s-right> <C-W>L
        map <d-s-up> <C-W>K
        "if exists(":Tabularize")
        noremap <leader>t= :Tabularize /=<CR>
        vmap <leader>t= :Tabularize /=<CR>
        noremap <leader>t: :Tabularize /:<CR>
        vmap <leader>t: :Tabularize /:<CR>
        noremap <leader>t- :Tabularize /-<CR>
        vmap <leader>t- :Tabularize /-<CR>
        "noremap <leader>t: :Tabularize /:\zs<CR>
        "vmap <leader>t: :Tabularize /:\zs<CR>
        "endif
        
"fugitive
nnoremap <leader>gs :Gstatus
nnoremap <leader>gc :Gcommit
nnoremap <leader>gb :Gblame
nnoremap <leader>gw :Gwrite
nnoremap <leader>gp :Git push

"in order to powerline to work
set laststatus=2
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|mp4)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height= 10

"fix for Jboss and RAResponde Project
autocmd BufWritePost ~/git/* silent :!open -a 'deploy-truly'

"UltiSnips Config
"Oh man.. totally amazing this thing!
set runtimepath+=~/.vim/ultisnips_rep 
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsDoHash=0

"mapping to allow snippet edition on the fly
noremap  <D-Bslash> :UltiSnipsEdit<cr>
noremap   <D-Bar> :UltiSnipsAddFiletypes

"vv select the content of the cur line without indent 
nnoremap vv ^vg_

let g:yankring_n_keys = 'D x X'
" y yanks to the end of the line
nnoremap Y y$

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'php', 'javascript'],
                           \ 'passive_filetypes': ['puppet'] }
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-controller ng-ini"']
"let g:syntastic_javascript_checkers = ['jsl']
nmap <silent> <D-d> <c-u>
nmap <silent> <D-e> <c-e>
nmap <silent> <D-D> <c-F>
nmap <silent> <D-E> <c-B>





let g:used_javascript_libs = 'underscore,backbone,angularjs' 

  if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
		    \	if &omnifunc == "" |
		    \		setlocal omnifunc=syntaxcomplete#Complete |
		    \	endif
    endif
     let myKeywords = []
    let myKeywords = OmniSyntaxList( ['javascript'] )
    let allItems = OmniSyntaxList( [] )

" show the current syntax highlight for the current word
map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

noremap <c-space> :SplitjoinJoin <cr>
noremap <space> :SplitjoinSplit <cr>
