
" Use Vim defaults, not Vi defaults.
" This must be first, because it changes other settings.
set nocompatible

let mapleader=' '


"""""""""""""""""""
" PLUGINS
"""""""""""""""""""

" Prepare the Vundle plugin manager.
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle needs to manage itself.
Bundle 'gmarik/vundle'
noremap <Leader>vc :BundleClean<CR>
noremap <Leader>vi :BundleInstall<CR>
noremap <Leader>vu :BundleUpdate<CR>

" Defaults everyone can agree on.
Bundle 'tpope/vim-sensible'

" Repeat plug-in maps too with '.'.
Bundle 'tpope/vim-repeat'

" Handy complementary mappings.
Bundle 'tpope/vim-unimpaired'

" Manipulate surrounding text.
Bundle 'tpope/vim-surround'

" Increment and decrement dates and times with C-A and C-X.
Bundle 'tpope/vim-speeddating'

" Improve 'ga' to provide more character info.
Bundle 'tpope/vim-characterize'

" Commands that wrap shell commands.
Bundle 'tpope/vim-eunuch'

" Wisely end control structures.
Bundle 'tpope/vim-endwise'

" Hueristically set whitespace options.
Bundle 'tpope/vim-sleuth'

" Manipulate multiple variants of a word.
Bundle 'tpope/vim-abolish'
" :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{}
" :%Subvert/facilit{y,ies}/building{,s}/g
" crs (snake case), crm (mixed case), crc (camel case), cru (upper case)
noremap <Leader>ab :Abolish<Space>
noremap <Leader>as :%Subvert/

" A Git wrapper so awesome, it should be illegal.
Bundle 'tpope/vim-fugitive'

" Highlight and remove trailing whitespace.
Bundle 'bitc/vim-bad-whitespace'
noremap <Leader>we :EraseBadWhitespace<CR>
noremap <Leader>wt :ToggleBadWhitespace<CR>

" Syntax checking.
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_c_checkers = [ 'make' ]
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_json_checkers = [ 'jsonlint' ]

" Quick universal comment toggling.
Bundle 'tomtom/tcomment_vim'
noremap // :TComment<CR>

" Fuzzy file and buffer finder.
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '\'
nnoremap <Bar> :CtrlPBuffer<CR>
nnoremap <Leader>t :CtrlPTag<CR>

" Live preview of LaTeX files
"Bundle 'xuhdev/vim-latex-live-preview'

" Language plugins.
Bundle 'leshill/vim-json'
Bundle 'vim-perl/vim-perl'
Bundle 'chikamichi/mediawiki.vim'
"Bundle 'tkztmk/vim-vala'
"Bundle 'wting/rust.vim'
Bundle 'tpope/vim-markdown'
let g:markdown_fenced_languages = [ 'javascript', 'json',
                                  \ 'ruby', 'c', 'sh', 'bash=sh', 'xml' ]

" Finished registering plugins; switch filetype detection back on.
filetype plugin indent on


"""""""""""""""""""
" OPTIONS
"""""""""""""""""""

" Enable syntax highlighting, but don't clobber existing ':highlight's.
syntax enable

" Use Unicode UTF-8 by default.
set encoding=utf-8

" Remember more commands and searches
set history=10000

" Don't let files impose configuration settings.
set nomodeline

" Create swap files in the first possible directory in this list.
set directory=~/.vim/swaps,/tmp

" Make a backup before overwriting a file, in the first possible directory.
set backup
set backupdir=~/.vim/backups,/tmp

" Save undo histories for files.
set undofile
set undodir=~/.vim/undos,/tmp

" Remember the cursor position and folds in windows (but not options).
set viewoptions=cursor,folds
set viewdir=~/.vim/views
autocmd BufWinLeave ?* silent! mkview
autocmd BufWinEnter ?* silent! loadview


""" EDITING

" Always use '\n' for line breaks.
set fileformat=unix

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Insert two spaces after a '.', '?' and '!' with a join command.
set joinspaces

" Automatically break lines longer than this.
set textwidth=79


""" WHITESPACE

" Smarter automatic indenting when starting a new line.
set autoindent
set smartindent

" Always insert tabs (and indents) as spaces.
set expandtab

" Number of spaces to use for each auto-indentation step.
set shiftwidth=4

" Backspacing over a <Tab> will replace it with 'shiftwidth' spaces.
set softtabstop=-1


""" NAVIGATION

" Enhanced command-line completion.
set wildmenu

" When pressing <Tab>, autocomplete to the longest common string, and if
" there's more than one match, list them all.
set wildmode=longest,list

" File patterns to ignore when autoexpanding file names.  This also effects
" the Command-T plugin.
set wildignore+=*.swp,*.swo,*.o,*.pyc,*.class,.git/*,.svn/*,*.dep.mk,_site/*

" When switching between buffers, jump to the first open window that contains
" the specified buffer (if there is one).
set switchbuf=useopen

" Allow buffers to be hidden without saving them.
set hidden

" Minimum number of screen lines to keep above and below the cursor.
set scrolloff=3


""" DISPLAY

" Use a colorscheme optimal for a dark background.
set background=dark

" Allow for 256 colors.
set t_Co=256

" Show the line and column number of the cursor position.
set ruler

" Always display windows' status lines.
set laststatus=2

" Show the incoming command in the last line of the screen.
set showcmd

" Number of screen lines to use for the command line.
set cmdheight=1

" Highlight this column.
"set colorcolumn=80

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Highlight the line of the cursor.
"set cursorline

" Only display the line with tab page labels when there are multiple tabs.
set showtabline=1

" Minimum number of columns for the current window.  If the current window
" is smaller, its size is increased at the expense of other windows.
set winwidth=20

" Don't display whitespace characters (by default).
set nolist

" Wrap lines longer than the window width.
set wrap

" Wrap lines at word boundaries.
set linebreak

" Start wrapped lines with:
let &showbreak='↳ '


""" SEARCHING

" Ignore case for all-lowercase search patterns.
set ignorecase
set smartcase

" Show matches while typing the search pattern.
set incsearch

" Highlight search pattern matches.
set hlsearch


"""""""""""""""""""
" AUTOCOMMANDS
"""""""""""""""""""

" Give files with .txt extensions their own filetypes, but only if they
" haven't already been given a filetype.
autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO,LICENSE
            \ if &filetype == "" | setlocal filetype=text | endif

autocmd FileType text,markdown,html
            \ setlocal textwidth=0

autocmd BufEnter,BufRead *.h
            \ setlocal filetype=c

autocmd FileType c,cpp,java
            \ setlocal commentstring=//\ %s |
            \ setlocal textwidth=77 |
            \ setlocal shiftwidth=4

autocmd FileType make
            \ setlocal noexpandtab

autocmd FileType gitcommit
            \ setlocal textwidth=72

autocmd FileType vim
            \ setlocal shiftwidth=4

autocmd BufNewFile,BufRead .jshintrc
            \ setlocal filetype=json


"""""""""""""""""""
" MAPPINGS
"""""""""""""""""""

" Save the file by pressing Enter in normal mode.
noremap <CR> :write<CR>

" Move cursor over visible lines, not real lines.
noremap j gj
noremap k gk

" Switch to the last-edited buffer.
nnoremap <Leader>e :e#<CR>


"""""""""""""""""""
" SYNTAX
"""""""""""""""""""

autocmd Syntax c
            \ syntax keyword cType schar uchar ushort uint ulong llong
                                 \ ullong ldouble ord lssize_t |
            \ syntax keyword cConstant LT EQ GT

