" First of all..
set nocompatible

" Fix copy/paste indentation
set pastetoggle=<F7>

" Let the buffer unchanged, with undo and marks
set hidden

set backspace=indent,eol,start
syntax on

" Folding
set foldmethod=manual
set foldcolumn=5

" Add ':' to the naitve keyword.
" This way double-colons should be autocomplete
set iskeyword+=:

" Close fold when leaving
" set foldclose=all

autocmd BufWinLeave *.pl,*.pm,*.cgi,*.sh mkview
autocmd BufWinEnter *.pl,*.pm,*.cgi,*.sh silent loadview

" Folded line color. In darkblue scheme this line has to be bright
autocmd BufWinEnter *.* highlight Folded ctermfg=white

" Activate plugins
filetype plugin on

" Set jumps to search word as you type
set incsearch

source ~/.vim/plugin/manpageview.vim

" Change default indend width
set tabstop=4
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class

" No backup
set nobackup
set noswapfile

" Auto wrapper
set textwidth=79
set nowrap

" Show whitelist
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Don't show whitelis for given types
autocmd filetype html,xml,pl set listchars-=tab:>.

" Jump to buffer by list
map <F6> :ls<CR>:e #

" Settings for winmanager
map <F2> :WMToggle<CR>

" Settings for code browser
let Tlist_Inc_Winwidth = 0
map <F3> :Tlist<CR>

" On/off the search highlitghs
map <F5> :set hls!<bar>set hls?<CR>

" Taglist tasks
let Tlist_Ctags_Cmd='/usr/bin/ctags'

map T :TlistToggle<CR>
map Y :TaskList<CR>

" Python identation
filetype plugin indent on

" Python syntax
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" Pydictionary
let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'

set tags=~/.vim/tags/python27.ctags,./tags

" Running prove
" autocmd BufRead,BufNewFile *.t set filetype=perl | compiler prove

" Perl syntax checker
autocmd BufNewFile,BufRead *.p? compiler perl

autocmd BufNewFile,BufRead *.sh so ~/.vim/ftplugin/sh.vim
autocmd BufNewFile,BufRead *.pl,*.pm,*.cgi so ~/.vim/ftplugin/perl.vim
autocmd BufNewFile,BufRead *.t so ~/.vim/plugin/perl-test-manage.vim
autocmd BufNewFile,BufRead *.t map <F3> :call Perl_Tests_Count()<CR>
autocmd BufNewFile,BufRead *.svg so ~/.vim/plugin/svg.vim
autocmd BufNewFile,BufRead *.mml setf mathml
" autocmd BufNewFile,BufRead *.xhtml,*.xht setf xhtml
autocmd BufNewFile,BufRead *.xhtml,*.xht so ~/.vim/plugin/xhtml.vim

" Add status line 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ [COLOR=%{g:colors_name}]
set laststatus=2

" Colors
colorscheme olive

" Update LAST UPDATE field on demand
" or on BufLeave
com! -nargs=0 Write call Last_Update()
" autocmd BufWinLeave *.pl,*.pm,*.t,*.cgi,*.sh :call Last_Update()

" Python add ons
" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
set makeprg="python\ -c\ \"import py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\""

