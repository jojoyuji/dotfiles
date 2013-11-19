"Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

filetype on
filetype plugin indent on

if has("persistent_undo")
  set undodir = "/Users/jojo/dotfiles/vim/undodir"
  set undofile
  set history=1000         " remember more commands and search history
  set undolevels=1000      " use many muchos levels of undo
endif
" change the default EasyMotion shading to something more readable with Solarized
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment


au colorscheme * hi cursor guibg=olivedrab1
au insertenter * hi cursor guibg=#0087af

au insertleave * hi cursor guibg=olivedrab1
au insertleave * hi! link CursorColumn CursorLine
au VimEnter * hi CursorLine guibg=NONE guifg=NONE gui=underline
set cursorline
nnoremap Q   gg=G``zz
"different search, show a quick fix window and line numbers
nnoremap // :g//#<left><left>


"allows syntax a max of 100 chars
set synmaxcol=800

set splitright          " Split new vertical windows right of current window.
set splitbelow          " Split new horizontal windows under current window.

nnoremap gu :OpenURL<cr>


"Functions to Minify stuff
command! MinifyJs execute( "!yuicompressor % -o %.min.js --type js")
command! MinifyCss execute( "!yuicompressor % -o %.min.css --type css")


"joins selected lines
nnoremap <D-J>  vipJ
nnoremap J mzJ`z 
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
    map <leader><leader>ss :%s//<left>




    "file completition

    inoremap <d-f> <c-x><c-F>
    " source
    vnoremap S y:execute @@<cr>:echo 'sourced selection.'<cr>
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



    "set lazyredraw

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
      noremap <D-e> <C-u>zz<CR>
      noremap <D-d> <C-d>zz<CR>
      noremap <D-i> zL
      noremap <D-o> zH
      set  colorcolumn=100
      highlight OverLength ctermbg=red ctermfg=white guibg=#592929
      match OverLength /\%100v.\+/
      set fuoptions=maxvert,maxhorz
      set showbreak=↪
    endif
    "muda para o diretório do arquivo atual
    fun! OpenDict(type)
      let nome = a:type
      execute "edit $HOME/.vim/dicionario/".nome
      exe "enew"
      "bfirst
    endfun

    let s:current_file=expand("<sfile>")
    let g:neocomplcache_enable_at_startup = 1
    map <leader>neo <esc>:NeoComplCacheToggle<cr>

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
    set foldmethod=indent
    "fixes the folding issue on NERDTree
    let g:indent_guides_exclude_filetypes = ['nerdtree']
    set foldlevel=99
    set pastetoggle=<f8>
    set nocompatible
    set shortmess+=filmnrxoOtT
    let mapleader=","        " muda o leader para comma
    nnoremap ; :
    nnoremap \ ;
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
    map <leader><leader>2 <esc>:set guifont=monaco:h13<cr>
    map <leader><leader>3 <esc>:set guifont=bitstream\ vera\ sans\ mono:h12<cr>
    map <leader><leader>4 <esc>:set guifont=proggyclean:h11<cr>
    map <leader><leader>5 <esc>:set guifont=andale\ mono:h12<cr>
    map <leader><leader>6 <esc>:set guifont=menlo:h13<cr>
    map <leader><leader>7 <esc>:set guifont=courier:h13<cr>

    inoreabbrev lenght length

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
    nnoremap  <leader>so :so $MYVIMRC <cr>:echo 'vimrc loaded!'<cr>

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
    "nmap <leader>oi :!open -a preview.app % <cr>
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


    nnoremap <silent> <D-left> :exe "20wincmd >"<cr>
    nnoremap <silent> <D-right> :exe "20wincmd <"<cr>
    "folding

    nnoremap zr zR
    nnoremap zm zM

    let g:quickrun_no_default_key_mappings = 1
    "let g:tlist_javascript_settings = 'javascript;o:object;f:function'
    "let g:tlist_javascript_settings = 'js;o:object;f:function'
    " default file encoding for new files
    setglobal fenc=utf-8
    set encoding=utf-8

    " general things
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
        set guifont=monaco:h12
        syntax enable
        set background=dark
        colorscheme gruvbox
        call togglebg#map("<leader><leader>=")
        set cmdheight=1 " (sub-optimal) removes many press enter to continue prompts
      end
    else
      "set t_co=256
      colorscheme gruvbox
      set cmdheight=1
    endif
    set list
    set listchars=tab:»·,trail:⋅,nbsp:⋅

    " my settings
    map <c-tab> :NERDTreeToggle<cr>

    let NERDTreeShowBookmarks=1
    let NERDTreeDirArrows=1
    let NERDTreeMinimalUI=1

    map <silent> <leader><leader><tab>  :call rc:syncTree()<cr><space>
    "map <leader>r :NERDTreeFind<cr>
    "allows NERDTree to change de cur dir
    let g:NERDTreeChDirMode=2
    "" returns true iff is NERDTree open/active
    function! rc:isNTOpen()
      return exists("t:NERDTreeBufName")
    endfunction

    "when the buffer is nerdtree <tab> closes it
    "autocmd FileType nerdtree noremap <tab> :NERDTreeClose<cr>

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
    inoremap jk <Esc>
    "set cursorline
    set hidden "not forced to save before switching buffers
    map <s-h> ^
    map <s-l> $


    "force saving files that require root permission
    cmap w!! %!sudo tee > /dev/null %


    " fugitive
    " remove old fugitive buffers
    autocmd bufreadpost fugitive://* set bufhidden=delete
    let g:gitv_commitstep = 100
    let g:gitv_openhorizontal = 0

    highlight diffadded guifg=#00bf00
    highlight diffremoved guifg=#bf0000

    let g:LustyExplorerSuppressRubyWarning = 1
    let g:LustyJugglerShowKeys = 1

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
    let g:tagbar_type_javascript = {
          \ 'ctagsbin' : 'jsctags'
          \ }

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
        map <d-s-left> <c-w>H
        map <d-s-down> <c-w>J
        map <d-s-right> <c-w>L
        map <d-s-up> <c-w>K
        "if exists(":Tabularize")
        "noremap <leader>t= :Tabularize /=<CR>
        "vmap <leader>t= :Tabularize /=<CR>
        "noremap <leader>t: :Tabularize /:<CR>
        "vmap <leader>t: :Tabularize /:<CR>
        "noremap <leader>t- :Tabularize /-<CR>
        "vmap <leader>t- :Tabularize /-<CR>
        "noremap <leader>t: :Tabularize /:\zs<CR>
        "vmap <leader>t: :Tabularize /:\zs<CR>
        "endif

        noremap <leader>t :Align
        vmap <leader>t :Align

        "fugitive
        nnoremap <leader>gs :Gstatus
        nnoremap <leader>gc :Gcommit
        nnoremap <leader>gd :Gdiff
        nnoremap <leader>gb :Gblame
        nnoremap <leader>gr :Gread
        nnoremap <leader>gw :Gwrite
        nnoremap <leader>gp :!git push
        nnoremap <leader>gu :!git pull

        "in order to powerline to work
        set laststatus=2
        let g:ctrlp_custom_ignore = {
              \ 'dir':  '\v[\/]\.(git|hg|svn)$',
              \ 'file': '\v\.(exe|so|dll|mp4)$',
              \ 'link': 'some_bad_symbolic_links',
              \ }

        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_match_window_bottom = 1
        let g:ctrlp_max_height= 15
        let g:ctrlp_extensions = ['funky'] 


        "vv select the content of the cur line without indent
        nnoremap vv ^vg_

        let g:yankring_n_keys = 'D x X'
        " y yanks to the end of the line
        nnoremap Y y$

        let g:syntastic_mode_map = { 'mode': 'active',
              \ 'active_filetypes': ['ruby', 'php', 'javascript'],
              \ 'passive_filetypes': ['puppet', 'html'] }
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
        let g:syntastic_always_populate_loc_list=1
        let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-controller ng-ini"']
        let g:syntastic_javascript_checkers = ['jsl']
        nmap <silent> <D-d> <c-u>
        nmap <silent> <D-e> <c-e>
        nmap <silent> <D-D> <c-F>
        nmap <silent> <D-E> <c-B>







        "if has("autocmd") && exists("+omnifunc")
        "autocmd Filetype *
        "\	if &omnifunc == "" |
        "\		setlocal omnifunc=syntaxcomplete#Complete |
        "\	endif
        "endif
        "let myKeywords = []
        ""todo
        ""let myKeywords = OmniSyntaxList( ['javascript'] )
        "let allItems = OmniSyntaxList( [] )

        " show the current syntax highlight for the current word
        map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
              \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
              \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

        noremap <space>k :SplitjoinJoin <cr>
        noremap <space>j :SplitjoinSplit <cr>

        "autocmd VimEnter * :Nyancat2
        noremap <F11> :Nyancat2<cr>
        inoremap <F11> <esc>:Nyancat2<cr>
        "set lines=30
        "set columns=90




        "neocompcache

        "Improve persistent_undorformance
        let g:neocomplcache_caching_limit_file_size = 50

        "let g:neocomplcache_skip_auto_completion_time = 1
        "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplcache.
        let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        let g:neocomplcache_enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        " Enable heavy features.
        " Use camel case completion.
        "let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        "let g:neocomplcache_enable_underbar_completion = 1

        " Define dictionary.
        let g:neocomplcache_dictionary_filetype_lists = {
              \ 'default' : '',
              \ 'vimshell' : $HOME.'/.vimshell_hist',
              \ 'scheme' : $HOME.'/.gosh_completions'
              \ }

        " Define keyword.
        if !exists('g:neocomplcache_keyword_patterns')
          let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
          return neocomplcache#smart_close_popup() . "\<CR>"
          " For no inserting <CR> key.
          "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>  neocomplcache#close_popup()
        inoremap <expr><F9> neocomplcache#cancel_popup()

        "inoremap <expr><tab>  neocomplcache#close_popup()
        " Close popup by <Space>.
        "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

        " For cursor moving in insert mode(Not recommended)
        "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
        "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
        "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
        "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
        " Or set this.
        "let g:neocomplcache_enable_cursor_hold_i = 1
        " Or set this.
        "let g:neocomplcache_enable_insert_char_pre = 1

        " AutoComplPop like behavior.
        "let g:neocomplcache_enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplcache_enable_auto_select = 1
        "let g:neocomplcache_disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        "let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        "let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

        " For perlomni.vim setting.
        " https://github.com/c9s/perlomni.vim
        "let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        " Turn off completion, it's more disruptive than helpful
        function! DisableNeocomplHtml()
          if &ft ==# 'html'
            :NeoComplCacheLock
          endif
        endfunction
        autocmd BufEnter * call DisableNeocomplHtml()


        "UltiSnips Config
        "Oh man.. totally amazing this thing!
        "set runtimepat+=~/.vim/ultisnips_rep
        let g:UltiSnipsUsePythonVersion = 2
        let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
        "let g:UltiSnipsDoHash=0

        "mapping to allow snippet edition on the fly
        noremap  <D-Bslash> :UltiSnipsEdit<cr>
        "noremap   <D-Bar> :UltiSnipsAddFiletypes

        "keep the visual selection after shifting tabs
        vnoremap > ><CR>gv
        vnoremap < <<CR>gv

        noremap <S-enter> :!

        nnoremap - :Switch<cr>
        let g:switch_custom_definitions =
              \ [
              \   ['addClass', 'removeClass'],
              \   ['GET', 'POST'] ,
              \   ['get', 'post'] ,
              \   ['left', 'right', 'center'] ,
              \   ['width', 'height'] ,
              \   ['error', 'success', 'warning'] ,
              \   ['show', 'hide'] ,
              \   ['after', 'before'] ,
              \   ['padding', 'margin'] ,
              \   ['top', 'bottom'] ,
              \   ['relative', 'absolute', 'fixed'] ,
              \   ['setTimeout', '$timeout', 'setInterval'] ,
              \   ['$scope', '$rootScope'],
              \   ['$emit', '$broadcast'],
              \   ['console.log', 'alert'],
              \   ['radio', 'checkbox'],
              \   ['push', 'unshift']
              \ ]
        "adds hyphent to keyword list

        "AlignReplaceQuotedSpaceslows * on visualmode for searching selected stuff FTW
        vnoremap <silent> * :<C-U>
              \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
              \gvy/<C-R><C-R>=substitute(
              \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
              \gV:call setreg('"', old_reg, old_regtype)<CR>

        "let g:used_javascript_libs = 'underscore,angularjs'
        "let g:used_javascript_libs = 'underscore,backbone,angularjs'


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


        "Autocomplete menu bg color
        "if has ('gui_running')
        "highlight Pmenu guibg=#222222 gui=bold
        "endif
        autocmd BufEnter *.md set filetype=markdown
        nmap <leader>md :%!markdown --html4tags<cr>ggI<html><cr><head><cr><meta charset='UTF-8' /><cr><title>Documento sem nome</title><cr><link rel="stylesheet" href="/Users/jojoyuji/Vim/markdown/style.css"><cr></head><cr><body><cr><esc>GA<cr></body></html><esc>ggQ



        let g:EasyMotion_mapping_w = '<space>w'
        let g:EasyMotion_mapping_W = '<space>W'
        let g:EasyMotion_mapping_b = '<space>b'
        let g:EasyMotion_mapping_B = '<space>B'
        let g:EasyMotion_mapping_e = '<space>e'
        let g:EasyMotion_mapping_E = '<space>E'
        let g:EasyMotion_mapping_ge = '<space>ge'
        let g:EasyMotion_mapping_gE = '<space>gE'
        let g:EasyMotion_mapping_t = '<space>t'
        let g:EasyMotion_mapping_T = '<space>T'
        let g:EasyMotion_mapping_f = '<space>f'
        let g:EasyMotion_mapping_F = '<space>F'




        "Vim ariline-plugin config
        "let g:airline_left_sep='►'
        "let g:airline_right_sep='◄'
        "let g:airline_detect_modified=1
        "let g:airline_detect_paste=1
        "let g:airline_detect_iminsert=1
        "let g:airline_powerline_fonts = 1
        "

        """""""""""""
        "  CtrlPCmdPalette
        """""""""""""
        noremap <D-P> :CtrlPCmdPalette <cr>
        noremap <D-π> :CtrlPFunky <cr>


        """""""""""""
        "  VUNDLE STUFF  "
        """""""""""""
        "{{{

        fun! LoadingMsg(message)
          echo a:message
          sleep 3m
        endf

        nnoremap <leader>vi :call LoadingMsg('Installing Vundle plugins...')<cr>:so $MYVIMRC<CR>:BundleInstall<CR>
        nnoremap <leader>vu :call LoadingMsg("Updating Vundle plugins...")<cr>:so $MYVIMRC<CR>:BundleUpdate
        nnoremap <leader>vc :call LoadingMsg("Cleaning Vundle plugins...")<cr>:so $MYVIMRC<CR>:BundleClean<cr>



        "filetype off                   " required!
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " let Vundle manage Vundle
        " required!
        Bundle 'gmarik/vundle'

        "my Bundles
        "colorthemes
        Bundle 'jojoyuji/gruvbox'
        Bundle 'badwolf'
        Bundle 'Marslo/marslo.vim'
        Bundle 'seoul256.vim'
        Bundle 'altercation/vim-colors-solarized'
        Bundle 'zeis/vim-kolor'


        "movements
        Bundle 'tpope/vim-surround'
        Bundle 'kana/vim-textobj-user'
        Bundle 'goldfeld/vim-seek'
        Bundle 'textobj-comment'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'rhysd/clever-f.vim'

        "navigation
        Bundle 'kien/ctrlp.vim'
        Bundle 'LustyExplorer'
        Bundle 'nerdtree-execute'
        Bundle 'mileszs/ack.vim'
        Bundle 'scrooloose/nerdtree'
        Bundle 'tyok/nerdtree-ack'
        Bundle 'jojoyuji/mru.vim'


        Bundle 'dterei/VimBookmarking'


        "git stuff
        Bundle 'tpope/vim-fugitive'
        Bundle 'mattn/gist-vim'
        "Bundle 'airblade/vim-gitgutter'


        "delete
        Bundle 'majutsushi/tagbar'
        "Bundle 'embear/vim-localvimrc'

        "indentation
        Bundle 'vim-scripts/Align'
        Bundle 'Stormherz/tablify'
        Bundle 'vim-indent-object'
        "Bundle 'einars/js-beautify'
        Bundle 'bigfish/vim-js-beautify'
        Bundle 'michalliu/sourcebeautify.vim'
        Bundle 'Yggdroot/indentLine'
        Bundle 'jojoyuji/vim-web-indent'
        Bundle 'leshill/vim-json'

        "syntax
        Bundle 'scrooloose/syntastic'
        Bundle 'othree/javascript-libraries-syntax.vim'
        Bundle 'skammer/vim-css-color'
        Bundle 'tpope/vim-haml'
        Bundle 'suan/vim-instant-markdown'
        Bundle 'SyntaxComplete'
        Bundle 'groenewege/vim-less'

        "pairing
        Bundle 'jiangmiao/auto-pairs'
        "Bundle 'kurkale6ka/vim-pairs'

        "utilities
        Bundle 'terryma/vim-multiple-cursors'
        Bundle 'SirVer/ultisnips'
        Bundle 'Shougo/neocomplcache.vim'
        Bundle 'JazzCore/neocomplcache-ultisnips'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'tpope/vim-repeat'
        Bundle 'jojoyuji/vim-sparkup'
        Bundle 'Valloric/MatchTagAlways'
        Bundle 'tpope/vim-abolish'
        Bundle 'splitjoin.vim'
        Bundle 'AndrewRadev/switch.vim'
        Bundle 'henrik/vim-open-url'
        Bundle 'mbbill/undotree'
        Bundle 'YankRing.vim'
        Bundle 'tpope/vim-unimpaired'
        Bundle 'terryma/vim-expand-region'
        Bundle 'fisadev/vim-ctrlp-cmdpalette'
        Bundle 'tacahiroy/ctrlp-funky' 
        Bundle 'hchbaw/textobj-motionmotion.vim'
        Bundle 'caglartoklu/launchassociated.vim'
        Bundle 'lfilho/cosco.vim'
        Bundle 'tsaleh/vim-matchit'

        "libs
        Bundle 'L9'
        Bundle 'jsoncodecs.vim'

        "useless stuff
        Bundle 'koron/nyancat-vim'

        "keep vim beautiful
        Bundle 'Lokaltog/vim-powerline'
        "Bundle 'bling/vim-airline' 
        "}}}
        "
        "
        "
        let g:yankring_replace_n_pkey = '<c-p>'
        let g:yankring_replace_n_nkey = '<f9>'

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
