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
" For the latest version, check out my github account under .dotfiles
"
" Joel Larsson,
" http://github.com/tilljoel
" http://twitter.com/tilljoel
" http://hackr.se/joellarsson
" http://popdevelop.com
"
"------------------
"-- CHANGELOG
"------------------
"
" 2013-08-12: Vim 7.4 released
" 2013-08-05: New powerline stuff
" 2013-07-10: Remove pathogen
" 2013-01-01: Ruby tuneup
" 2012-09-01: Tmux support, ruby support etc.
" 2011-11-28: Added closetag
" 2011-07-30: Really added pathogen
" 2011-06-30: Added pathogen
" 2011-05-30: Added syntastic and jshint support
" 2010-11-29: Improved mail settings
" 2010-11-21: Major updates, new stuff for comments, git, buffer handling,
"             file handling, autocomplete, python stuff
" 2010-04-17: Restructure
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
"           - Add %m to printf format
"           - Add note about: create spell dir, copy files from
"           - add space counter (odd number?)
"           - add bidning to par-format and nerd commentator
"           - ipython support
"           - http://code.google.com/p/conque/
"           - fix "paste" button?
"           - fix spell "add word"
"           - make words stop at camelcase, for cw, etc
"           - flymake and http://cx4a.org/software/gccsense/manual.html
"           - http://stackoverflow.com/questions/4027222/vim-use-shorter-textwidth-in-comments-and-docstrings
"           - colorize rgb colors,  http://www.vim.org/scripts/script.php?script_id=3567
"           - add more jshint stuff, https://github.com/oryband/dotfiles/blob/master/jshintrc
"           - Check out https://github.com/factorylabs/vimfiles
"           - FIX coffescript -> show js
"           - Coffee2Js, Js2Coffee
"           - ADD getflow or some todo management for each file?
"           - Sort/Comment bundles, add full urls for all
"
"------------------
"-- DEPENDENCIES
"------------------
"
"  SYSTEM:
"
"
"  vim      - vim 7.3 compiled with huge, python, ruby, check vim --version
"
"  ctags    - Generates a tagsfile of language objects found in source files
"             http://ctags.sourceforge.net/
"
"  Spell    - FIXME: add info
"             ftp://ftp.vim.org/pub/vim/runtime/spell/
"
"  jshint   - Install jshint and put a .jshintrc file there
"
"  PLUGINS: "
"
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'git://github.com/vim-scripts/gtk-vim-syntax.git'
Bundle 'git://github.com/vim-scripts/Vimball.git'
Bundle 'xoria256.vim'
Bundle 'git://github.com/tpope/vim-vividchalk.git'
Bundle 'git://github.com/kchmck/vim-coffee-script.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/vim-scripts/taglist.vim'
Bundle 'git://github.com/tsaleh/vim-matchit.git'
Bundle 'git://github.com/vim-scripts/AutoTag.git'
Bundle 'git://github.com/vim-scripts/L9.git'
Bundle 'git://github.com/vim-scripts/FuzzyFinder.git'
Bundle 'git://github.com/vim-scripts/rails.vim'
Bundle 'git://github.com/gregsexton/gitv.git'
Bundle 'git://github.com/actionshrimp/vim-xpath.git'
Bundle 'git://github.com/vim-scripts/LargeFile.git'
Bundle 'git://github.com/bronson/vim-trailing-whitespace.git'
Bundle 'jshint.vim'
Bundle 'git://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/tpope/vim-haml.git'
Bundle 'git://github.com/tpope/vim-markdown.git'
Bundle 'git://github.com/tpope/vim-rails.git'
Bundle 'git://github.com/nvie/vim-pep8.git'
"'BundleCommand: git submodule init && git submodule update'
Bundle 'git://github.com/vim-scripts/nginx.vim.git'
Bundle 'git://github.com/csexton/rvm.vim.git'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/vim-scripts/closetag.vim.git'
Bundle 'git://github.com/ujihisa/rdoc.vim.git'
Bundle 'git://github.com/tsaleh/vim-shoulda.git'
Bundle 'git://github.com/vim-scripts/AnsiEsc.vim'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/nathanaelkane/vim-indent-guides.git'
Bundle 'git://github.com/pgr0ss/vimux-ruby-test.git'
Bundle 'git://github.com/benmills/vimux.git'
Bundle 'git://github.com/tpope/vim-bundler.git'
Bundle 'git://github.com/tpope/vim-rake.git'
Bundle 'git://github.com/vim-ruby/vim-ruby.git'
Bundle 'git://github.com/tpope/vim-endwise.git'
Bundle 'git://github.com/tilljoel/vim-automatic-ctags.git'
Bundle 'git://github.com/epeli/slimux.git'
Bundle 'git://github.com/sunaku/vim-ruby-minitest.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/carlwoodward/vim-vroom.git'
Bundle 'git://github.com/itspriddle/vim-marked.git'
Bundle 'git://github.com/gmarik/vundle.git'
Bundle 'git://github.com/walm/jshint.vim.git'
Bundle 'git://github.com/vim-scripts/open-browser.vim.git'
"'git://github.com/kevinw/pyflakes-vim'
"Bundle 'git://github.com/vim-scripts/CRefVim.git'
"Bundle 'git://github.com/xolox/vim-session.git'
"Bundle 'git://github.com/Valloric/syntastic.git'
"Bundle 'git://github.com/dickeyxxx/status.vim.git'

"#TODO
"# Bundle: git://github.com/wincent/Command-T
"# Omnicomplete in git commit, https://github.com/tpope/vim-rhubarb.git
"#  git://github.com/tsaleh/vim-tcomment.git",
"#  git://github.com/tpope/vim-repeat.git",
"#  git://github.com/tpope/vim-surround.git",
"#  git://github.com/tsaleh/vim-align.git",
"# http://projects.mikewest.org/vimroom/
"# https://github.com/sunaku/vim-ruby-minitest
"# pydiction
"# Indexsearch - fixa!
"# Create passwords.vim for blogit
"# Blogit does not work
"# Cscope
"

"-------------------------------------------------------------------------------
" GENERAL SETTINGS
"-------------------------------------------------------------------------------



" enable some important things
syntax on
filetype plugin indent on


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

"   used to determine which files should be excluded from listings.
set wildignore+=*.o,*.obj,.git
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"   skip suffixes for filename completation
set suffixes+=.class,.hi,.o,.so,.a,.pyc,.la
set suffixes-=.h

set history=1000

"   sharing windows clipboard
if $TMUX == ''
   set clipboard+=unnamed
end
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

"   to help with rvm and !rails stuff
set shell=/bin/sh

"------------------
"-- VISUAL OPTIONS
"------------------

" set colorscheme
"colorscheme blackdust
set t_Co=256
"colorscheme xoria256
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
"   always display the statusline
set laststatus=2

"   when no beep or flash is wanted
set visualbell t_vb=

"   time to show the matching bracket
set matchtime=2

"   print the line number in front of each line?
set number

"   set the line number col to 3 number
set numberwidth=2

"   number of lines for the command area; more eliminates
"   many 'hit-enter'
set cmdheight=2

set winwidth=80
" We have to have a winheight bigger than we want to set winminheight. But if
" " we set winheight to be huge before winminheight, the winminheight set will
" " fail.
set winheight=10
set winminheight=10
set winheight=999

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
"set wildmode=list:longest,full
set wildmode=longest,list
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

let g:ycm_min_num_of_chars_for_completion = 4

set rtp+=/opt/boxen/homebrew/Cellar/python/2.7.3-boxen2/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
let g:fugitive_github_domains = ['git.github.com']
"let g:statusline_fugitive = 1
"let g:statusline_rvm = 1
"let g:statusline_syntastic = 1
""Turn statusline off
"let g:statusline_enabled = 1
"let g:statusline_fullpath = 0

" Session plugin
"let g:session_autoload = 'no'


let g:vroom_use_vimux = 1
let g:vroom_use_zeus = 0
let g:vroom_clear_screen = 1
let g:vroom_map_keys = 0
let g:vroom_spec_command = "rspec"
let g:vroom_test_unit_command = "ruby -Itest"
let g:vroom_detect_spec_helper = 1
"
" If it looks like URI, Open URI under cursor.
" Otherwise, Search word under cursor.
" for open-browser.vim

nmap <C-c> <Plug>(openbrowser-smart-search)
vmap <C-c> <Plug>(openbrowser-smart-search)


let g:LargeFile = 1024 * 1024 * 2
let g:loaded_LargeFile = 0

" for rails.vim and Rdoc
command -bar -nargs=1 OpenURL :OpenBrowser <args>

"
"-------------------------------------------------------------------------------
"-- AUTOCOMMANDS
"-------------------------------------------------------------------------------

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
autocmd BufRead,BufNewFile *.vala setfiletype vala
autocmd BufRead,BufNewFile *.vapi setfiletype vala
autocmd BufRead,BufNewFile *.rdoc,*rd setfiletype rdoc
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufNewFile,BufRead COMMIT_EDITMSG call EngSpell()
autocmd FileType hs         source ~/.vim/syntax/haskell.vim
autocmd FileType java       source ~/.vim/syntax/java.vim
autocmd FileType tex        source ~/.vim/syntax/tex.vim
autocmd FileType dot        source ~/.vim/syntax/dot.vim
autocmd FileType asm,a      source ~/.vim/syntax/asm.vim
autocmd FileType make       setlocal noexpandtab
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP

autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()

autocmd FileType js,javascript call s:MyJavascriptSettings()
autocmd FileType coffee     call s:MyCoffeeSettings()
autocmd FileType mail       call s:MyMailSettings()
autocmd FileType txt        call s:MyTxtSettings()
autocmd FileType rb,ruby    call s:MyRubySettings()
autocmd FileType rdoc       call s:MyRDocSettings()
autocmd FileType xml        call s:MyXMLSettings()
autocmd FileType rake       call s:MyRubySettings()
autocmd FileType eruby,yaml call s:MyRubySettings()
autocmd FileType vala,vapi  call s:MyValaSettings()
autocmd FileType c,h,cpp,cc call s:MyCSettings()
autocmd FileType python     call s:MyPythonSettings()
autocmd FileType markdown   call s:MyMarkdownSettings()
autocmd FileType css        call s:MyCSSSettings()
autocmd FileType scss       call s:MySASSSettings()
"
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


let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0

let g:VimuxOrientation = "v"
let g:VimuxUseNearestPane = 1
let g:VimuxHeight = "24"


autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
"function! MapCR()
        "nnoremap <cr> :nohlsearch<cr>
"endfunction
"call MapCR()


"-------------------------------------------------------------------------------
"-- GENERAL MAPPINGS
"-------------------------------------------------------------------------------

"   unmap arrows/pgdn/pgup so you learn to use hjkl

imap <c-c> <esc>
let mapleader=","

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

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

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
" map <C-t> :tabnew <CR>
"map <C-o> :FufBuffer <CR>
"map <C-i> :FufTag <CR>

" NERD Commenter stuff
let NERDShutUp=1
vmap c :call NERDComment(1, 'toggle')<CR>
vmap f :!par<CR>

" command-t
"nmap <Leader>o :CommandT<CR>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
"map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
"map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
"map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
"map <leader>gM :CommandTFlush<cr>\|:CommandT app/mailers<cr>
"map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
"map <leader>gS :CommandTFlush<cr>\|:CommandT app/services<cr>
"map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
"map <leader>gt :CommandTFlush<cr>\|:CommandT test<cr>
"map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
"map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>
"map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gr :topleft 100 :split README.md<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gT :topleft 100 :split TODO.txt<cr>
"map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
"map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
"map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>gq :CtrlPQuickfix<cr>
map <leader>gt :CtrlPTag<cr>
map <leader>f :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

nnoremap <leader><leader> <c-^>

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
map <F7> :cprev <CR>
imap <F7> <ESC>:cprev <CR>i

map <F10> :Gstatus <CR>
imap <F10> <ESC> :Gstatus <CR>
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
let Tlist_Enable_Fold_Column        = 0
let Tlist_Ctags_Cmd                 = 'ctags'
let tlist_c_settings                = 'c;f:FUNCTIONS'
let tlist_dtd_settings              = 'dtd;e:elements;a:attributes;n:entities'
let tlist_make_settings             = 'make;m:makros;t:targets'
"let tlist_markdown_settings         = 'markdown;s:sections'
let tlist_matlab_settings           = 'matlab;f:functions'
let tlist_ruby_settings             = 'ruby;f:Methods;m:Module;c:Class;F:Singleton method'
let tlist_tex_settings              = 'latex;s:sections;g:graphics;l:labels'
let tlist_vhdl_settings             = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'
let tlist_wikipedia_settings        = 'wikipedia;s:sections;r:references'

"------------------
"-- Syntastic
"------------------

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_ruby_exec = '~/.rvm/bin/ruby-1.9.3-p194'
"------------------
"-- RTM
"------------------

let rtm_api_key='90fe02c60705a95efd2f06d9b385b1c4'
let rtm_shared_secret='25446d314649a615'
let rtm_token='71c5ece5d3800be0362d2442ec7af751c3a2b3d4'

let g:pydiction_location = $HOME."/.vim/after/ftplugin/pydiction/complete-dict"

let g:browser="firefox-bin"
let g:pdfviewer="kpdf"
"

"let g:automatic_ctags_files=".git,Gemfile"
"let g:automatic_ctags_cmd="ctags"
"let g:atomatic_ctags_filename="tags"

set tags=./tags;/

"
"
"------------------
"-- VIM SPELL
"------------------

set spelllang=sv
set spellfile=~/.vim/spellfile.sv.add

map <Down> ]s
map <Up> [s
imap <Down> ]s
imap <Up> [s

"map <F3> :set spellfile=~/.vim/spellfile.en_us.add<CR>:set spelllang=en_us<CR>:set spell!<CR><Bar>:echo "English spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
"map <F4> :set spellfile=~/.vim/spellfile.sv.add<CR>:set spelllang=sv<CR>:set spell!<CR><Bar>:echo "Swedish spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
"imap <F3> :set spellfile=~/.vim/spellfile.en_us.add<CR>:set spelllang=en_us<CR>:set spell!<CR><Bar>:echo "English spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
"imap <F4> :set spellfile=~/.vim/spellfile.sv.add<CR>:set spelllang=sv<CR>:set spell!<CR><Bar>:echo "Swedish spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

map <F3> :call SweSpell()<CR>
imap <F3> <ESC>:call SweSpell()<CR>i
map <F4> :call EngSpell()<CR>
imap <F4> <ESC>:call EngSpell()<CR>i


" correct the work under the cursor
" imap <leader>mm <Esc>z=
" add the current word to the dictionary
" <leader>ma <Esc>zg

" limit it to just the top 10 items
set sps=best,15

" mark bad spelled words with red
highlight SpellErrors gui=underline ctermfg=white ctermbg=black
highlight SpellBad cterm=underline,bold

setlocal nospell

"-------------------------------------------------------------------------------
"-- FUNCTIONS
"-------------------------------------------------------------------------------

function! s:MyJavascriptSettings()
  setlocal omnifunc=javascriptcomplete#CompleteJS
  "set makeprg=cat\ %\ \\\|\ /my/path/to/js\ /my/path/to/mylintrun.js\ %
  "set errorformat=%f:%l:%c:%m
  map <F4> :call ToggleLwindow() <CR>
  imap <F4> <ESC>:call ToggleLwindow() <CR>i
  setlocal tabstop=2
  setlocal softtabstop=0
  setlocal shiftwidth=2
  setlocal expandtab
  setlocal fdm=marker
  setlocal textwidth=80
  setlocal nocindent
  "setlocal makeprg=/usr/local/bin/jshint\ %
  "setlocal errorformat=%m:%l:%c
  "nnoremap <F3> :call ModifyByFixJsStyle()<CR>
  "nnoremap <buffer> <F4> :make<CR>
endfunction

function! s:MyCoffeeSettings()
  setlocal omnifunc=javascriptcomplete#CompleteJS
  map <F4> :call ToggleLwindow() <CR>
  imap <F4> <ESC>:call ToggleLwindow() <CR>i
  setlocal tabstop=2
  setlocal softtabstop=0
  setlocal shiftwidth=2
  setlocal expandtab
  setlocal fdm=marker
  setlocal textwidth=80
  setlocal nocindent
endfunction

function! s:MyTxtSettings()
        autocmd FileType txt        setlocal formatoptions=tcrqn textwidth=72
  setlocal equalprg=par\ -\ 2>/dev/null
endfunction

function! s:MyRDocSettings()
        autocmd FileType txt        setlocal formatoptions=tcrqn textwidth=72
  setlocal equalprg=par\ -\ 2>/dev/null
endfunction

function! s:MyMailSettings()
  setlocal textwidth=72
  setlocal comments+=b:--
  setlocal formatoptions+=tcqn
  setlocal equalprg=par\ -\ 2>/dev/null
  imap <C-F> <ESC>:r!google-contacts-lookup.sh <cword><CR><ESC>
  " setlocal nosi nocin
  " setlocal comments=n:>
  " setlocal equalprg=fmt
  " remove the quoted signature, also positions cursor after quoted text
  " autocmd BufReadPost /tmp/mutt* :g/^> -- $/.;/^$/-d
  " try to remove signature from quoted text
  try | :%s/>> -- $\n\(>> .*\n\)*// | catch | endtry
  try | :%s/> -- $\n\(> .*\n\)*// | catch | endtry
  " try to convert quoting: > > -> >>
  try | :%s/^> >/>>/ | catch | endtry
  try | :%s/^>> >/>>>/ | catch | endtry
  try | :%s/^>>> >/>>>>/ | catch | endtry
  " remove multiple blank lines
  try | %s/\(^>\n\)\{2,}/>\r/g | catch | endtry
  " go to start
  normal gg
  " settings
  setlocal ignorecase infercase
  let @/ = '^>[ \t]*$'
  " do not set the file encoding -> use whatever $LANG is set to; mutt will assume it's that one too
  " setlocal fileencoding=iso8859-1
  " colors (matches mutt colors):
  highlight mailQuoted1 guifg=#000050 ctermfg=4 " blue
  highlight mailQuoted2 guifg=#a00000 ctermfg=1 " red
  highlight mailQuoted3 guifg=#006000 ctermfg=2 " green
  highlight mailQuoted4 guifg=#600060 ctermfg=5 " magenta
  highlight mailQuoted5 guifg=#B07000 ctermfg=3 " yellow
  " variables
  let b:url_nr = 1
  " visual mappings
  vmap <buffer> . c> [...]<Esc>
  " insert mode mappings
  imap <buffer> <C-l> :call FT_mail_insert_url()<CR>
  map <buffer> <leader>q :%s/=\(\x\x\)/\=nr2char(str2nr(submatch(1),16))/g<CR>

  function! Mail_Begining()
    exe "normal gg"
    if getline (line ('.')) =~ '^From: '
      " if we use edit_headers in Mutt, then go after the headers
      exe "normal /^$\<CR>"
    endif
  endfunction

  function! FT_mail_insert_url()
          let l:url = input("URL: ")
          execute "normal a[".b:url_nr."]\<Esc>mzG"
          try
                  execute "?^-- $"
                  if b:url_nr == 1
                          normal 0k
                  else
                          normal kk
                  endif
          catch
          endtry
          execute "normal o[".b:url_nr."] ".l:url."\<Esc>`za"
          let b:url_nr += 1
  endfunction
endfunction

" filetype markdown {{{
"  au! BufRead,BufNewFile *.mkd.*    setfiletype mkd
"  au! BufRead,BufNewFile *.mkd      setfiletype mkd
"  autocmd FileType mkd
"        \ setlocal autoindent |
"        \ setlocal textwidth=75 |
"        \ setlocal formatoptions+=tcan2wro |
"        \ setlocal comments=n:>
  " }}} filetype markdown

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

function! s:MySASSSettings()
  setlocal tabstop=4
  setlocal softtabstop=0
  setlocal shiftwidth=4
  setlocal expandtab
  setlocal textwidth=80
  setlocal nocindent
endfunction

function! s:MyXMLSettings()
  autocmd FileType text setlocal textwidth=78
  syntax match StatusLine /\%<80v.\%>79v/
  syntax match LineEndWS "\s\+$" containedin=ALL
  setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
endfunction

function! s:MyMarkdownSettings()
  runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim
  autocmd FileType text setlocal textwidth=78
  syntax match StatusLine /\%<80v.\%>79v/
  syntax match LineEndWS "\s\+$" containedin=ALL
  call EngSpell()
  setlocal comments=fb:*,fb:-,fb:+,n:> commentstring=>\ %s
  setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+
  setlocal textwidth=78
  setlocal formatoptions=tcq2ln

" vim:set sw=2:
  map <buffer> <F1> yypVr=
  map <buffer> <F2> yypVr-
  inoremap <buffer> <leader><CR> <Esc>:call FT_markdown_newline()<CR>A
  function! FT_markdown_newline()
          let l:pattern = @/
          if getline(line('.')) =~ "^\\s*\\d\\."
                  normal yyp0                     s/^\(\s*\d\+\.\).*/\1 /
          elseif getline(line('.')) =~ "^\\s*[*+-]"
                  normal yyp
                  s/^\(\s*[*+-]\).*/\1 /
          endif
          let @/ = l:pattern
  endfunction
endfunction

function! s:MyTextSettings()
  autocmd FileType text setlocal textwidth=78
  syntax match StatusLine /\%<80v.\%>79v/
  syntax match LineEndWS "\s\+$" containedin=ALL
  set nocindent               " nocin:  don't use C-indenting
  set nosmartindent           " nosi:  don't "smart" indent, either
  set autoindent              " ai:  indent to match previous line
  set noshowmatch             " nosm:  don't show matches on parens, brackets, etc.
  set comments=n:>,n:#,fn:-   " com: list of things to be treated as comments
  set formatoptions=tcrq      " fo:  word wrap, format comments

  set complete=.,w,b,u,t,i,k  " cpt:  complete words
  " alternate way of reflowing paragraphs
  map F {!}par-format<CR>
endfunction

function! s:MyPythonSettings()
  "pep8 friendly
  setlocal noic
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal textwidth=80
  setlocal smarttab
  setlocal expandtab
  "  setlocal cindent
  setlocal comments=:#
  setlocal tags+=./python.ctags
  setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
  setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
  setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  setlocal omnifunc=pythoncomplete#Complete
  nnoremap <buffer> <F4> :call Pep8()<CR>

  let b:interpreter="ipython"
  let b:interpreter_args="-profile vim" " vim profile has autoindent 0

  map <buffer><silent> <S-F1> :setlocal iskeyword+=.<CR>:let b:pydoc_word = expand("<cword>")<CR>:setlocal iskeyword-=.<CR>:call FT_python_showdoc(b:pydoc_word)<CR>
  "map <buffer> <leader>d V:!~/.vim/tools/pydocstring.py<CR>jjA

  " pydoc integration
  command! -nargs=1 Pydoc call FT_python_showdoc("<args>")
  function! FT_python_showdoc(name)
          new
          execute "read !pydoc " . a:name
          setlocal nomodifiable
          setlocal nomodified
          setlocal nobuflisted
          set filetype=man
          normal 1G
  endfunction
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
  set wildignore+=vendor/rails/**,logs,tmp,spec/fixture/raw_mails
  set ai sw=2 sts=2 expandtab nowrap syntax=ruby
  "let g:statusline_rvm = 1
  set omnifunc=rubycomplete#Complete
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1
  set completeopt+=longest,menu,preview
  "  map <F4> :call ToggleLwindow() <CR>
  "imap <F4> <ESC>:call ToggleLwindow() <CR>i
  "map <F2> :RunAllRubyTests
  map <leader>a :w<CR>:call RunVimTmuxCommand("rake test")<CR>
  map <leader>t :VroomRunTestFile<cr>
  map <leader>T :VroomRunNearestTest<cr>
  nmap <leader>s :call VimuxRunCommand(@" . "\n", 0)<CR> 
  set colorcolumn=80
  "  map <silent> <F2> :wa<CR> :RunAllRubyTests<CR>
  "  autocmd BufWritePost *.rb :call AutomaticCtags()

  "map <F2> :w<CR>:call RunVimTmuxCommand("clear; rake test")<CR>
 ":!python " . getreg("%") . "" <CR>
endfunction

" readonly files get green foreground, other files get white fg
function! ROColors()
  if &ro
    highlight Normal guifg=Green
  else
    highlight Normal guifg=#ffffff
  endif
endfunction
call ROColors()

if !exists("*ReloadConfigs")
  function ReloadConfigs()
      echo "source vimrc"
      :source ~/.vimrc
      if has("gui_running")
          :source ~/.gvimrc
      endif
  endfunction
  command! Recfg call ReloadConfigs()
endif


" change background depending on mode
function! s:EnterInsert()
    highlight Normal guibg=#442222
endfunction

function! s:LeaveInsert()
    highlight Normal guibg=#000000
endfunction

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
  match Error80 /\%>80v.\+/
  setlocal cinoptions=:0,l1,t0,g0
  setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
  setlocal softtabstop=2 shiftwidth=2 expandtab
endf

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

let g:showlw = 0
function! ToggleLwindow()
  if g:showlw == 0
    :Errors
    let g:showlw = 1
  else
    :lcl
    let g:showlw = 0
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

"if has("cscope")
  "set cscopequickfix=s-,c-,d-,i-,t-,e-
  "set cscopetag
  "set csto=0
  "set cspc=3
  "set cscopetagorder=0
  "set nocsverb
"endif

function ModifyByFixJsStyle()
        " save positions
        let pos = s:SavePositions()

        let tempfile = tempname() . '.js'
        silent call writefile(getbufline(bufname('%'), 1, '$'), tempfile)

        try
            " use fixjsstyle as filter
            silent! execute '!fixjsstyle --strict --nojsdoc' tempfile

            1,$delete "_
            execute 'read' tempfile
            1delete "_

            " restore positions
            call s:RestorePositions(pos)
        catch
            echoerr v:exception
        finally
            call delete(tempfile)
        endtry
endfunction

" save cursor and screen positions
" pair up this function with s:RestorePositions
if !exists('*s:SavePositions')
    function s:SavePositions()
        " cursor pos
        let cursor = getpos('.')

        " screen pos
        normal! H
        let screen = getpos('.')

        return [screen, cursor]
    endfunction
endif

" restore cursor and screen positions
" pair up this function with s:SavePositions
if !exists('*s:RestorePositions')
    function s:RestorePositions(pos)
        " screen
        call setpos('.', a:pos[0])

        " cursor
        normal! zt
        call setpos('.', a:pos[1])
    endfunction
endif


"" flyquickfixmake.vim (Modified to Python)
"function! FlyquickfixPrgSet(mode)
    "if a:mode == 0
        """" setting for pylint
        "setlocal makeprg=/usr/bin/pylint\ --rcfile=$HOME/.pylint\ -e\ %
        "setlocal errorformat=%t:%l:%m
        "echo "flymake prg: pylint"
    "elseif a:mode == 1
        """" setting for pyflakes
        "setlocal makeprg=/usr/local/bin/pyflakes\ %
        "setlocal errorformat=%f:%l:%m
        "echo "flymake prg: pyflakes"
    "else
        """" setting for pep8.py
        "setlocal makeprg=/usr/local/bin/pep8.py\ %
        "setlocal errorformat=%f:%l:%c:%m
        "echo "flymake prg: pep8.py"
    "endif
"endfunction

"function! FlyquickfixToggleSet()
    "if g:python_flyquickfixmake == 1
        "au! BufWritePost
        "echo "not-used flymake"
        "let g:python_flyquickfixmake = 0
    "else
        "echo "used flymake"
        "let g:python_flyquickfixmake = 1
        "au BufWritePost *.py make
    "endif
"endfunction

"if !exists("g:python_flyquickfixmake")
    "let g:python_flyquickfixmake = 1
    "call FlyquickfixPrgSet(8)
    ""au BufWritePost *.py silent make
    "au BufWritePost *.py make

"endif

"map fs :call FlyquickfixToggleSet()<CR>
"map pl :call FlyquickfixPrgSet(0)<CR>
"map pf :call FlyquickfixPrgSet(1)<CR>
"map p8 :call FlyquickfixPrgSet(8)<CR>

function! XMLMappings()
        noremap <leader>;xp :call Xpath()<cr>
endfunction

function! EngSpell()
        setlocal spellfile=~/.vim/spellfile.en_us.add
        setlocal spelllang=en_us
        setlocal spell!
        echo "English spell check: " . strpart("OffOn", 3 * &spell, 3)
endfunction

function! SweSpell()
        setlocal spellfile=~/.vim/spellfile.sv.add
        setlocal spelllang=sv
        setlocal spell!
        echo "Swedish spell check: " . strpart("OffOn", 3 * &spell, 3)
endfunction

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

function! Xpath()
        " Needs to get the real file name for the quickfix window
        let realname = bufname( "%" )
        " Write the buffer to a temp file
        let filename = tempname()
        let lines = getline( 1, "$" )
        call writefile( lines, filename )
        let xpath    = input("Enter xpath expression: ")
        let tmp1=&grepprg
        let tmp2=&grepformat
        set grepformat=%f:%l\ %m
        set grepprg=xpath
        exe "grep ".escape(filename, ' \')." \"".xpath."\" ".escape(realname, ' \')
        let &grepprg=tmp1
        let &grepformat=tmp2
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

