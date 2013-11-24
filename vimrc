"Base Config{{{
let g:configpath = "~/dotfiles/"
let &t_Co=256
python import sys; sys.path.append("/Library/Python/2.7/site-packages")
"Pathogen{{{
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
"}}}
}}}
"Performance config{{{
"allows syntax a max of 100 chars
set synmaxcol=800
set nocursorcolumn
set nocursorline
syntax sync minlines=256
"}}}

"Settings {{{1
filetype on
filetype plugin indent on
syntax on
syntax enable
let mapleader=","        " muda o leader para comma
call togglebg#map("<leader><leader>=")
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
set guifont=monaco:h12
set background=dark
set cmdheight=1 " (sub-optimal) removes many press enter to continue prompts
set list
set listchars=tab:»·,trail:⋅,nbsp:⋅
set nolist
set tags=./tags
set tags+=$home/.vim/tags/python.ctags
set laststatus=2
set tags+=./tags,tags;/
"}}}



if exists('+autochdir')"
  set autochdir
else
  autocmd bufenter * silent! lcd %:p:h
endif

if has("persistent_undo")
  set undodir = "~/.vim/undodir"
  set undofile
  set history=1000         " remember more commands and search history
  set undolevels=1000      " use many muchos levels of undo
endif
autocmd BufEnter * lcd %:p:h

" change the default EasyMotion shading to something more readable with Solarized
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

let g:indent_guides_exclude_filetypes = ['nerdtree'] "fixes the folding issue on NERDTree

au colorscheme * hi cursor guibg=olivedrab1
au insertenter * hi cursor guibg=#0087af
au insertleave * hi cursor guibg=olivedrab1
au insertleave * hi! link CursorColumn CursorLine
au VimEnter * hi CursorLine guibg=NONE guifg=NONE gui=underline


let g:mta_filetypes = {
      \ 'html'  : 1,
      \ 'xhtml' : 1,
      \ 'xml'   : 1,
      \ 'eruby' : 1,
      \ 'jinja' : 1
      \}



""{{{ 14/11/2012 cool stuff in scrncasts youtube

"keep of splits when resized
au vimresized * exe "normal! \<c-w>="

"make sure vim returns to the same line when you reopen a file
au bufreadpost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif

"open a quickfix window for the last search
"nnoremap <silent> <leader><leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>



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

"noremap vaf V$F{%;so

"onoremap an :<c-u>call <sid>nexttextobject('a', 'f')<cr>
"xnoremap an :<c-u>call <sid>nexttextobject('a', 'f')<cr>
"onoremap in :<c-u>call <sid>nexttextobject('i', 'f')<cr>
"xnoremap in :<c-u>call <sid>nexttextobject('i', 'f')<cr>

"onoremap al :<c-u>call <sid>nexttextobject('a', 'f')<cr>
"xnoremap al :<c-u>call <sid>nexttextobject('a', 'f')<cr>
"onoremap il :<c-u>call <sid>nexttextobject('i', 'f')<cr>
"xnoremap il :<c-u>call <sid>nexttextobject('i', 'f')<cr>

"function! s:nexttextobject(motion, dir)
"let c = nr2char(getchar())

"if c ==# "b"
"let c = "("
"elseif c ==# "b"
"let c = "{"
"elseif c ==# "r"
"let c = "["
"endif

"exe "normal! ".a:dir.c."v".a:motion.c
"endfunction

" }}}

""""""""""""""""""""""""""""""
" => .:Visual mode related:.
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



"}}}




"Gundo                                              - Mapping {{{1
noremap<silent> <leader><leader>u  :GundoToggle<CR>
"}}}
"Bookmarking                                        - Mapping {{{1
nmap <leader>mm :ToggleBookmark<cr>
nmap <leader>mn :NextBookmark<cr>
nmap <leader>mb :PreviousBookmark<cr>
let g:bookmarking_menu = 1

"}}}
"MRU                                                - Mapping {{{1
noremap <leader>mr :MRU<cr>
let mru_max_entries = 200
let MRU_Window_Height = 15
"}}}



"plugin yankstack config
let g:yankstack_map_keys = 1
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-o> <Plug>yankstack_substitute_newer_paste
imap <c-p> <Plug>yankstack_substitute_older_paste
imap <c-o> <Plug>yankstack_substitute_newer_paste

inoreabbrev lenght length

"edit e reload rápido
nnoremap  <leader>so :so $MYVIMRC <cr>:echo 'vimrc loaded!'<cr>


"ZenCoding - Config{{{
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
 "}}}


let g:quickrun_no_default_key_mappings = 1
"let g:tlist_javascript_settings = 'javascript;o:object;f:function'
"let g:tlist_javascript_settings = 'js;o:object;f:function'
" default file encoding for new files
compiler! pyunit "for :make to understand python unittests
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1


" in ruby and scala, we use spaces (two) instead of tabs
au BufRead,BufNewFile *.rb,*.scala set et sw=2 sts=2 ts=8
" in python, we use spaces (four) instead of tabs
au bufread,bufnewfile *.py set et


"NERDTree Config{{{1
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
"}}}
" Fugitive Config {{{1
" remove old fugitive buffers
autocmd bufreadpost fugitive://* set bufhidden=delete
let g:gitv_commitstep = 100
let g:gitv_openhorizontal = 0
highlight diffadded guifg=#00bf00
highlight diffremoved guifg=#bf0000
 "}}}
"LustyExplorer Config {{{1
noremap <leader>b :LustyBufferExplorer<cr>
let g:LustyExplorerSuppressRubyWarning = 1
let g:LustyJugglerShowKeys = 1
"}}}
"
map <leader>vv :execute("e ".g:configpath."vimrc")<cr><c-w>
map <leader>gv :execute("e ".g:configpath."gvimrc")<cr><c-w>
map <leader>pp :execute("e ".g:configpath."vim/pluginsrc")<cr><c-w>
map <leader>mp :execute("e ".g:configpath."vim/mappingsrc")<cr><c-w>



autocmd filetype python set omnifunc=pythoncomplete#complete
autocmd filetype php set omnifunc=phpcomplete#completephp

if &diff
  nmap <c-l> <c-w>l
  nmap <c-h> <c-w>h
endif



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


    let g:ctrlp_custom_ignore = {
          \ 'dir':  '\v[\/]\.(git|hg|svn)$',
          \ 'file': '\v\.(exe|so|dll|mp4|pdf|psd|plist)$',
          \ 'link': 'some_bad_symbolic_links',
          \ }

    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_match_window_bottom = 1
    let g:ctrlp_max_height= 15
    let g:ctrlp_extensions = ['funky']
    let g:ctrlp_map = '<D-p>'


    "vv select the content of the cur line without indent
    nnoremap vv ^vg_

    nnoremap Y y$

    let g:syntastic_mode_map = { 'mode': 'active',
          \ 'active_filetypes': ['ruby', 'php', 'javascript'],
          \ 'passive_filetypes': ['puppet', 'html'] }
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-controller ng-ini"']
    let g:syntastic_javascript_checrers = ['jshint']
    let g:syntastic_javascript_jshint_args=" --config ". g:configpath ."jshintrc"



    if has("autocmd") && exists("+omnifunc")
      autocmd Filetype *
            \	if &omnifunc == "" |
            \		setlocal omnifunc=syntaxcomplete#Complete |
            \	endif
    endif

    " show the current syntax highlight for the current word
    map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
          \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
          \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

    noremap <space>k :SplitjoinJoin <cr>
    noremap <space>j :SplitjoinSplit <cr>

    "autocmd VimEnter * :Nyancat2
    noremap <F11> :Nyancat2<cr>
    inoremap <F11> <esc>:Nyancat2<cr>



    "neocompcache

    "neoComplcach config
    let s:current_file=expand("<sfile>")
    let g:neocomplcache_enable_at_startup = 1
    map <leader>neo <esc>:NeoComplCacheToggle<cr>
    "
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
    "set runtimepat+=g:configpath."vim/ultisnips_rep"
    let g:UltiSnipsUsePythonVersion = 2
    let g:UltiSnipsSnippetsDir = g:configpath."vim/UltiSnips"
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
    let g:airline_detect_modified=1
    let g:airline_detect_paste=1
    let g:airline_detect_iminsert=1
    let g:airline_powerline_fonts = 1




    "in order to powerline to work
    let g:Powerline_symbols = 'fancy'


    """""""""""""
    "  CtrlPCmdPalette
    """""""""""""
    noremap <D-P> :CtrlPCmdPalette <cr>
    noremap <D-π> :CtrlPFunky <cr>




    """""""""""""""""""""""""
    " Ultimate Colorscheme  "
    """""""""""""""""""""""""

    "let g:ulti_color_Add_Fav              = '<f6>'
    "let g:ulti_color_Remove_Fav           = '<c-Bslash>'
    "let g:ulti_color_Next_Global          = ''
    "let g:ulti_color_Prev_Global          = ''
    "let g:ulti_color_Next_Fav             = ''
    "let g:ulti_color_Prev_Fav             = ''
    "let g:ulti_color_Next_Global_Fav      = ''
    "let g:ulti_color_Prev_Global_Fav      = ''
    "let g:ulti_color_See_Fav              = ''
    "let g:ulti_color_Font_Next_Fav        = ''
    "let g:ulti_color_Font_Prev_Fav        = ''
    "let g:ulti_color_Font_Next_Global_Fav = ''
    "let g:ulti_color_Font_Prev_Global_Fav = ''
    "let g:ulti_color_Font_Add_Fav         = ''
    "let g:ulti_color_Font_Remove_Fav      = ''
    "let g:ulti_color_Write_Fav            = ''
    "let g:ulti_color_Load_Fav             = ''
    "let g:ulti_color_verbose              = 1

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




    "Loads pluginugins.vim
    exe ('so '.g:configpath.'vim/pluginsrc')
    exe ('so '.g:configpath.'vim/mappingsrc')


    " vim: ts=2 fdm=marker fdl=0
