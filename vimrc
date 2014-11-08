
set nocompatible
let mapleader=' '



"""""""""""""""""""""""""
""" PLUGINS
"""""""""""""""""""""""""

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' 	" Vundle needs to manage itself.

Plugin 'tpope/vim-sensible'	" Defaults everyone can agree on.
Plugin 'tpope/vim-repeat'	" Repeat plugin mappings too with `.`.
Plugin 'tpope/vim-unimpaired'	" Handy complimentary mappings.
Plugin 'tpope/vim-surround'	" Manipulate surrounding text.
Plugin 'tpope/vim-speeddating'	" Increment/decrement dates/times with C-A/X.
Plugin 'tpope/vim-characterize'	" Improve `ga` to provide more character info.
Plugin 'tpope/vim-eunuch'	" Commands that wrap shell commands.
Plugin 'tpope/vim-endwise'	" Wisely end control structures.

" Manipulate multiple variants of a word.
Plugin 'tpope/vim-abolish'
" :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{}
" :%Subvert/facilit{y,ies}/building{,s}/g
" crs (snake case), crm (mixed case), crc (camel case), cru (upper case)

" Highlight and remove trailing whitespace.
Plugin 'bitc/vim-bad-whitespace'
noremap <Leader>we :EraseBadWhitespace<CR>
noremap <Leader>wt :ToggleBadWhitespace<CR>

" Syntax checking.
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_c_checkers = [ 'make' ]
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_json_checkers = [ 'jsonlint' ]

" Fuzzy file and buffer finder.
Bundle 'kien/ctrlp.vim'
let g:ctrlp_user_command = 'ag --nocolor --files-with-matches -g "" %s'

" Language plugins:
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-markdown'
let g:markdown_fenced_languages = [ 'javascript', 'json',
                                  \ 'ruby', 'c', 'sh', 'bash=sh', 'xml' ]

call vundle#end()
filetype plugin indent on



"""""""""""""""""""""""""
""" OPTIONS
"""""""""""""""""""""""""

" Enable syntax highlighting, but don't clobber existing ':highlight's.
syntax enable

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

" When pressing <Tab> on the wildmenu, autocomplete to the longest common
" string, and if there's more than one match, list them all.
set wildmode=longest,list

" When switching between buffers, jump to the first open window that contains
" the specified buffer (if there is one).
set switchbuf=useopen

" Allow buffers to be hidden without saving them.
set hidden


""" DISPLAY

" Use a colorscheme optimal for a dark background.
set background=dark

" Don't display whitespace characters (by default).
set nolist

" Wrap lines longer than the window width.
set wrap

" Wrap lines at word boundaries.
set linebreak



"""""""""""""""""""""""""
""" AUTOCOMMANDS
"""""""""""""""""""""""""

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


