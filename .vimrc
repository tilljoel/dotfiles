"-------------------------------------------------------------------------------
" JOEL LARSSON VIMRC
"-------------------------------------------------------------------------------

"------------------
"-- ABOUT
"------------------
"
" This .vimrc configuration should work with GNU/Linux and Mac OS. I
" mainly use Vim for coding C, Python, Ruby or writing emails. During
" 2004 i started using vim as my primary editor and I have worked on
" this configuration since then. Most of the stuff and ideas originally
" comes from other people but have been modified. If you think you
" deserve credit for anything in here please let me know and i will add
" it.
"
" For the latest version, check out my blog at
" http://hackr.se/vim/vimrc
"
" Joel Larsson, http://hackr.se/joellarsson
"
"------------------
"-- CHANGELOG
"------------------
"
" 2010-04-17; Restructure
" 2009-12-01: Added correct c syntax from std_c, small patch
"             to c.vim
" 2009-11-10: Added sv_SE files for spelling under .vim/spell
" 2009-08-02: Changed spell settings
" 2008-11-25: Added changelog and todo
"             Added vimrc_source vimrc_open
"
"------------------
"-- TODO
"------------------
"
"           - Make all stuff work in gvim, check meta-key
"           - Fix for javascript, html, css?
"           - Fix colorscheme, fix tabs
"           - Fix \cr c ref
"           - Add "make" for work
"           - Add %m to printf format
"           - Use marklines with quickfix from make?
"           - Display function name in the title bar and/or the
"             status line
"           - Add ifdef script highlight
"           - Add note about: create spell dir, copy files from
"             ftp://ftp.vim.org/pub/vim/runtime/spell/
"           - add space counter (odd number?)
"           - add bidning to par-format and nerd commentator
"           - get cscope settings from jens
"
"------------------
"-- DEPENDENCIES
"------------------
"
"  SYSTEM:
"
"  vim      - vim 7.2 compiled with most stuff enabled, check vim --version
"
"  ctags    - Generates a tagsfile of language objects found in source files
"             http://ctags.sourceforge.net/
"
"  Spell    - FIXME: add info
"             ftp://ftp.vim.org/pub/vim/runtime/spell/
"
"  PLUGINS:
"
"  Taglist  - Source code overview, uses ctags to display tags in split
"             http://vim-taglist.sourceforge.net/
"             http://www.vim.org/scripts/script.php?script_id=273
"
"  Std_c    - This C syntax file is to help developing portable Standard C code
"             http://www.vim.org/scripts/script.php?script_id=234
"
"  CRefVim  - a C-reference manual especially designed for Vim
"             http://www.vim.org/scripts/script.php?script_id=614
"
"  Cscope   - Browse source code
"             http://cscope.sourceforge.net/
"
"
"------------------
"-- SECTIONS
"------------------
"
"  General settings
"    Text Options
"    Visual options
"  Autocommands
"  General Mappings
"  Plugins
"  Functions
"


"-------------------------------------------------------------------------------
" GENERAL SETTINGS
"-------------------------------------------------------------------------------

if v:version < 700
        echoerr 'This vimrc requires Vim 7 or later.'
        quit
endif

let $MYVIMRC = $HOME."/.vimrc"


"------------------
"-- TEXT OPTIONS
"------------------

"   tab (character) is 8 spaces
set tabstop=8

"   tab (key) is 8 spaces
set softtabstop=8

"   indent width is 8 spaces
set shiftwidth=8

"   expand tabs to spaces by default
set expandtab

"   allow backspacing over indentation, end-of-line, and
"   start-of-line; see 'help bs'.
set backspace=indent,eol,start

set encoding=utf-8

"   enables automatic C program indenting
set autoindent
set smartindent
"set copyindent

"   dont act as vi
set nocompatible

"   turn off the beep!
set noerrorbells

"   dont know what this does really, just use it
set hidden

"   search as we type
set incsearch

"   ignore case if only lowercase chars used, otherwise
"   use case, use \C to get Case Sensitive
set ignorecase
set smartcase

"   update the title of the window...
set title

"   alot of undolevels
set undolevels=500

"   skip suffixes for filename completation
set suffixes+=.class,.hi,.o,.so,.a,.pyc,.la
set suffixes-=.h

set history=1000

"   sharing windows clipboard
set clipboard+=unnamed

"   improves performance -- let OS decide when to flush disk
set nofsync

"   write buffer when leaving
set autowrite

"   no backup/swap
set nowb
set nobackup
set noswapfile

"   autoread when a file is changed from the outside
set autoread

"------------------
"-- VISUAL OPTIONS
"------------------

" set colorscheme
"colorscheme blackdust
set t_Co=256
colorscheme xoria256

"   always display the statusline
set laststatus=2

"   when no beep or flash is wanted
set visualbell t_vb=

"   time to show the matching bracket
set matchtime=2

"   print the line number in front of each line?
set number

"   set the line number col to 3 number
set numberwidth=3

"   number of lines for the command area; more eliminates
"   many 'hit-enter'
set cmdheight=2

"   set how tabs, eols look when you use :set list
set lcs=tab:>-,eol:$,nbsp:%,trail:X,extends:>,precedes:<

"   some feedback on position
set ruler
"   highlight all its matches.
set hlsearch

"   dont know what this does really, just use it
set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws

"   show a report when N lines were changed.  0 means
"   'all' - always report
set report=0

"   make taglist hilight update faster
set updatetime=200

"   show the current mode
set showmode

"   FIXME: add info
set showcmd

"   dont list special chars by default
set nolist

"   show matching '()' pairs .
set showmatch

"   the char used for "expansion" on the command line
set wildchar=<TAB>

"   dont wrap lines by default, toggle with binding
set nowrap

"   disable fold
set nofoldenable

"   make folding indent sensitive
set foldmethod=indent
set wildmenu
set wildmode=list:longest,full

"   set 7 lines to the curors - when moving vertical..
set so=7

"   omni menu colors
hi  Pmenu guibg=#ffffff
hi  PmenuSel guibg=#555555 guifg=#ffffff

if has("gui_running")
  "FIXME: fix for both term and gui
  if has('title')
    set titlestring=editing:\ %-25.55F\ %a%r%m titlelen=70 "
  endif
  set guifont=Terminus\ 12
  "set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
  no toolbar
  set guioptions-=T
  " don't use ALT keys for menus.
  set winaltkeys=no
  set guicursor=a:blinkon0

endif " has("gui")

"FIXME use same as for 79
if has("gui_running")
  hi Error80        gui=NONE   guifg=#ffffff   guibg=#6e2e2e
  hi ErrorLeadSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
  hi ErrorTailSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
else
  hi Error80        cterm=NONE   ctermfg=white   ctermbg=red
  hi ErrorLeadSpace cterm=NONE   ctermfg=white   ctermbg=red
  hi ErrorTailSpace cterm=NONE   ctermfg=white   ctermbg=red
endif

if $LANG =~ ".*\.UTF-8$" || $LANG =~ ".*utf8$" || $LANG =~ ".*utf-8$"
        set listchars+=tab:»·,trail:·,precedes:…,extends:…
else
        set listchars=tab:>-,trail:-
endif


if has('statusline')
    " status line detail:
    " %f                file path
    " %y                file type between braces
    " %([%R%M]%)        fileflags between braces
    " %{'!'[&ff=='default_file_format']}
    "                   shows a '!' if the fileformat
    "                   is not the platform default
    " %{'$'[!&list]}    shows a '*' if in list mode
    " %{'~'[&pm=='']}   shows a '~' if in patchmode
    " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
    "                   only for debug : display the
    "                   current syntax item name
    " %=                right-align following items
    " #%n               buffer number
    " %l/%L,%c%V        line number, total number of
    "                   lines, and column number
    function! SetStatusLineStyle()
        if &stl == '' || &stl =~ 'synID'
            let &stl="%f %([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
        else
            let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
        endif
    endfunc
    " switch between the normal and vim-debug modes in
    " the status line
    nmap _ds :call SetStatusLineStyle()<CR>
    call SetStatusLineStyle()
endif

"-------------------------------------------------------------------------------
"-- AUTOCOMMANDS
"-------------------------------------------------------------------------------

" enable some important things
syntax on
filetype on

" uncomment if you want to mark the current cursorline,
" column with a different color
"autocmd WinEnter * setlocal cursorcolumn
"autocmd BufEnter * setlocal cursorcolumn
"autocmd WinEnter * setlocal cursorline
"autocmd BufEnter * setlocal cursorline
"hi cursorcolumn ctermbg=247 ctermfg=?? guibg=grey70 guifg=??
"hi cursorline ctermbg=247 guibg=grey70

filetype plugin indent on
" FIXME comment
autocmd BufEnter * call ROColors()
autocmd InsertLeave * call s:LeaveInsert()
autocmd InsertEnter * call s:EnterInsert()

autocmd BufRead,BufNewFile *.vala  setfiletype vala
autocmd BufRead,BufNewFile *.vapi  setfiletype vala


autocmd FileType hs         source ~/.vim/syntax/haskell.vim
autocmd FileType java       source ~/.vim/syntax/java.vim
autocmd FileType tex        source ~/.vim/syntax/tex.vim
autocmd FileType dot        source ~/.vim/syntax/dot.vim
autocmd FileType asm,a      source ~/.vim/syntax/asm.vim
autocmd FileType text       setlocal textwidth=78
autocmd FileType make       setlocal noexpandtab
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType txt        setlocal formatoptions=tcrqn textwidth=72

autocmd FileType mail       call s:MyMailSettings()
autocmd Filetype rb,ryby    call s:MyRubySettings()
autocmd Filetype rake       call s:MyRubySettings()
autocmd Filetype eruby,yaml call s:MyRubySettings()
autocmd Filetype vala,vapi  call s:MyValaSettings()
autocmd FileType c,h,cpp,cc call s:MyCSettings()
autocmd FileType python     call s:MyPythonSettings()

"FIXME: add colors for some C99 stuff
let c_C99=1
let c_c_vim_compatible=1
let c_comment_strings=1
let c_comment_numbers=1
let c_comment_types=1
let c_warn_nested_comments=1
let c_cpp_comments=1
let c_ansi_typedefs=1
let c_ansi_constants=1
let c_posix=1
let c_comment_date_time=1
let c_minlines=25
let c_C89=1
let c_gnu=1
let c_syntax_for_h=1


"-------------------------------------------------------------------------------
"-- GENERAL MAPPINGS
"-------------------------------------------------------------------------------

"   unmap arrows/pgdn/pgup so you learn to use hjkl
map <Left> \
map <Right> \
map <Up> \
map <Down> \
map <PageUp> \
map <PageDown> \

imap <Left> <nop>
imap <Right> <nop>
imap <Up> <nop>
imap <Down> <nop>
imap <PageUp> <nop>
imap <PageDown> <nop>

nnoremap L :tabnext<CR>
nnoremap H :tabprev<CR>

"    move the current line up or down
nmap <C-j> :m+<CR>
nmap <C-k> :m-2<CR>
imap <C-j><C-O> :m+<CR><C-O>
imap <C-k><C-O> :m-2<CR><C-O>

"    move the current line left or right
nmap <C-h> <<
nmap <C-l> >>
imap <C-h><C-O> <<
imap <C-l><C-O> >>

"    move the selected block up or down
vmap <C-j> :m'>+<CR> gv
vmap <C-k> :m'<-2<CR> gv
"    move the selected block left or right
vmap <C-l> >gv
vmap <C-h> <gv

"   buffer/tabs...
"   next/perv buffer
map <C-p> :bp <CR>
map <C-n> :bn <CR>

"   change to tab #
map 1 :tabn 1<CR>
map 2 :tabn 2<CR>
map 3 :tabn 3<CR>
map 4 :tabn 4<CR>
map 5 :tabn 5<CR>
map 6 :tabn 6<CR>
map 7 :tabn 7<CR>
map 8 :tabn 8<CR>
map 9 :tabn 9<CR>

map <C-Tab> :tabn <CR>
map <C-S-Tab> :tabp <CR>
map <C-t> :tabnew <CR>

" unused
"map <F1>

" mappings for taglist, toggle the display of taglist
nnoremap <silent> <F2> :Tlist<CR>
inoremap <silent> <F2> <ESC>:Tlist<CR>

"map <F3>
"map <F4>

" use these for :grep or when using makeprg with python/gcc
map <F5> :call ToggleCwindow() <CR>
imap <F5> <ESC>:call ToggleCwindow() <CR>i
map <F6> :cnext <CR>
imap <F6> <ESC>:cnext <CR>i
map <S-F6> :cprev <CR>
imap <S-F6> <ESC>:cprev <CR>i

" whitespace toggle
map <F9> :call Toggle_2_4_8_tab()<CR>
imap <F9> <ESC>:call Toggle_2_4_8_tab()<CR>i

map <F10> :call ToggleShowWhitespace()<CR>
imap <F10> <ESC>:call ToggleShowWhitespace()<CR>i
"    wrap toggle
map <F11> :set wrap!<CR>:set wrap?<CR>
imap <F11> <ESC> :set wrap!<CR>:set wrap?<CR>i

" toggle pase, Want feedback in both modes
nnoremap <F12> :set paste!<CR>:set paste?<CR>
set pastetoggle=<F12>

" ctags maps, remap goto, go back
nnoremap <C-Y> <C-]>
nnoremap <C-U> <C-T>


"-------------------------------------------------------------------------------
"-- PLUGINS
"-------------------------------------------------------------------------------

"------------------
"-- TAGLIST
"------------------

" settings for taglist
let Tlist_Auto_Highlight_Tag        = 1
let Tlist_Auto_Open                 = 0
let Tlist_Auto_Update               = 1
let Tlist_Compact_Format            = 1
let Tlist_Display_Prototype         = 0
let Tlist_Show_Menu                 = 1
let Tlist_Display_Tag_Scope         = 0
let Tlist_Exit_OnlyWindow           = 1
let Tlist_File_Fold_Auto_Close      = 1
let Tlist_GainFocus_On_ToggleOpen   = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Process_File_Always       = 1
let Tlist_Max_Tag_Length            = 20
let Tlist_Show_One_File             = 1
let Tlist_Sort_Type                 = "order"
let Tlist_Use_SingleClick           = 1
let tlist_c_settings                = 'c;f:FUNCTIONS'

"------------------
"-- VIM SPELL
"------------------

set spelllang=sv
set spellfile=~/.vim/spellfile.sv.add

map <Down> ]s
map <Up> [s
imap <Down> ]s
imap <Up> [s

map <F3> :set spellfile=~/.vim/spellfile.en_us.add<CR>:set spelllang=en_us<CR>:set spell!<CR><Bar>:echo "English spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
map <F4> :set spellfile=~/.vim/spellfile.sv.add<CR>:set spelllang=sv<CR>:set spell!<CR><Bar>:echo "Swedish spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
imap <F3> :set spellfile=~/.vim/spellfile.en_us.add<CR>:set spelllang=en_us<CR>:set spell!<CR><Bar>:echo "English spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
imap <F4> :set spellfile=~/.vim/spellfile.sv.add<CR>:set spelllang=sv<CR>:set spell!<CR><Bar>:echo "Swedish spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>


" correct the work under the cursor
" imap <leader>mm <Esc>z=
" add the current word to the dictionary
" <leader>ma <Esc>zg

" limit it to just the top 10 items
set sps=best,15

" mark bad spelled words with red
highlight SpellErrors gui=underline ctermfg=white ctermbg=black
" FIXME: there are more hl
setlocal nospell

"-------------------------------------------------------------------------------
"-- FUNCTIONS
"-------------------------------------------------------------------------------

function! s:MyMailSettings()
  setlocal textwidth=72
  setlocal formatoptions=tcrqan
  setlocal comments+=b:--
endfunction

function! s:MyCSettings()

  source ~/.vim/syntax/c.vim
  setlocal cindent
  " make unclosed parantheses new line start at first
  " whitspace after paren
  setlocal cinoptions=(0,u0:0

  setlocal comments=sl:/*,mb:\ *,elx:\ */

  " mark lines over 80 chars with grey
  hi rightMargin guibg=slategray | match rightMargin /\%79v.*$/

  " autocmd FileType c,h setlocal tags+=~/.vim/systags
  setlocal tags=./tags,tags
  setlocal omnifunc=ccomplete#Complete
  setlocal completeopt=menu,preview,menuone,longest
  setlocal complete=.,w,b,u,t,i

  autocmd BufEnter *gst*.[ch] :call Prepare_gst()
  " FIXME add some more paths
endfunction

function! s:MyPythonSettings()
  setlocal sw=4 ts=4 et
  setlocal cindent
  setlocal comments=:#
  setlocal tags+=./python.ctags
  setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
  setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
  setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  setlocal omnifunc=pythoncomplete#Complete
endfunction

function! s:MyValaSettings()
  setlocal efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
  setlocal efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
  setfiletype vala
  " Disable valadoc syntax highlight
  " let vala_ignore_valadoc = 1
  "
  "   Enable comment strings
  let vala_comment_strings = 1

  " Highlight space errors
  " let vala_space_errors = 1
  " Disable trailing space errors
  " let vala_no_trail_space_error = 1
  " Disable space-tab-space errors
  " let vala_no_tab_space_error = 1
  "
  " Minimum lines used for comment syncing (default 50)
  " let vala_minlines = 120
endfunction

function! s:MyRubySettings()
  " load matchit (% to bounce from do to end, etc.)
  " FIXME install plugin
  runtime! macros/matchit.vim
  autocmd FileType rake,ruby,eruby,yaml set ai sw=2 sts=2 expandtab nowrap syntax=ruby
endfunction

function! s:SwitchSourceHeader()
    if (expand ("%:t") == expand ("%:t:r") . ".c")
        find %:t:r.h
    else
        find %:t:r.c
    endif
endfunction
nmap ,s :call <SID>SwitchSourceHeader()<CR>

" readonly files get green foreground, other files get white fg
function! ROColors()
  if &ro
    highlight Normal guifg=Green
  else
    highlight Normal guifg=#ffffff
  endif
endfunction
call ROColors()

function! Vimrc_open()
    echo "open vimrc"
tabnew $MYVIMRC
endfunction

function! Vimrc_source()
    echo "source vimrc"
    source $MYVIMRC
endfunction

" change background depending on mode
function! s:EnterInsert()
    highlight Normal guibg=#442222
endfunction

function! s:LeaveInsert()
    highlight Normal guibg=#000000
endfunction

" awkward name to avoid clashes
func!  Toggle_2_4_8_tab()
  set tabstop=8
  if &softtabstop==2
    set softtabstop=4
    set shiftwidth=4
    echo "tab 4"
  elseif &softtabstop==4
    set softtabstop=8
    set shiftwidth=8
    echo "tab 8"
  else
    set softtabstop=2
    set shiftwidth=2
    echo "tab 2"
  endif
endf

func! Prepare_gst()
  setlocal softtabstop=2 shiftwidth=2 expandtab
  setlocal cinoptions=(4,u0:2
  highlight MissingMellanslag ctermbg=red guibg=red
  match MissingMellanslag /\(#\s*define.\{-}\)\@<![^!( ](/
endf

func! Prepare_kernel()
  "FIXME
  syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
  syn keyword cOperator likely unlikely
  syn match ErrorTailSpace / \+$/
  match Error80 /\%>80v.\+/
  setlocal cinoptions=:0,l1,t0,g0
  setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
  setlocal softtabstop=2 shiftwidth=2 expandtab
endf

" create tags...
function! Ctags_dir()
  echo "ctags dir"
  execute '!(cd %:p:h;ctags *.[ch])'
  echo "rebuilding directory ctags"
endfunction
"com! -nargs=* -complete=command Ctags_dir call Ctags_dir()

function! Ctags_all()
  echo "must be in top dir"
  execute '!find * -type d -exec dirtags {} \;'
  execute '!ctags --file-scope=no -R'
  echo "done building ctags!"
endfunction
"com! -nargs=* -complete=command Ctags_all call Ctags_all()

" show tabs and whitespace at eol
function! ShowWhitespace()
  let b:showWS = 1
  syntax match Tabs "\t" containedin=ALL
  syntax match LineEndWS "\s\+$" containedin=ALL
  highlight RedundantWhitespace ctermbg=red guibg=red
  match RedundantWhitespace /\s\+$\| \+\ze\t/
  echo "show Whitespace"
endfunction

" hide tabs and whitespace at eol
function! HideWhitespace()
  let b:showWS = 0
  syntax clear Tabs
  syntax clear LineEndWS
  echo "hide Whitespace"
endfunction

" toggle whitespace
function! ToggleShowWhitespace()
  if !exists('b:showWS')
    let b:showWS = 0
  endif
  let b:showWS = !b:showWS
  if b:showWS == 1
    call ShowWhitespace()
  else
    call HideWhitespace()
  endif
endfunction
highlight Tabs term=standout cterm=standout gui=standout
highlight link LineEndWS Error
"FIXME add missing mellanslag

let g:showcw = 0
function! ToggleCwindow()
  if g:showcw == 0
    :copen
    let g:showcw = 1
  else
    :cclose
    let g:showcw = 0
  endif
endfunction

let g:showes = 1
function! ToggleErrSign()
  if g:showes == 0
    :ErrSign
    let g:showes = 1
  else
    :ErrClear
    let g:showes = 0
  endif
endfunction

" return highlight name
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

if has("cscope")
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set cscopetag
  set csto=0
  set cspc=3
  set cscopetagorder=0
  set nocsverb
endif

