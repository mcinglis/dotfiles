
set nocompatible
let mapleader=' '



"""""""""""""""""""""""""
""" PLUGINS
"""""""""""""""""""""""""

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' 	" Vundle needs to manage itself.
nnoremap <Leader>pi :PluginInstall<CR>
nnoremap <Leader>pu :PluginUpdate<CR>
nnoremap <Leader>pc :PluginClean<CR>

Plugin 'tpope/vim-sensible'	" Defaults everyone can agree on.
Plugin 'tpope/vim-repeat'	" Repeat plugin mappings too with `.`.
Plugin 'tpope/vim-unimpaired'	" Handy complimentary mappings.
Plugin 'tpope/vim-surround'	" Manipulate surrounding text.
Plugin 'tpope/vim-speeddating'	" Increment/decrement dates/times with C-A/X.
Plugin 'tpope/vim-characterize'	" Improve `ga` to provide more character info.
Plugin 'tpope/vim-eunuch'	" Commands that wrap shell commands.
Plugin 'tpope/vim-endwise'	" Wisely end control structures.
Plugin 'tpope/vim-commentary'   " Comment stuff out

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
Plugin 'scrooloose/syntastic'
let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_c_checkers = [ 'make' ]
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_json_checkers = [ 'jsonlint' ]
nnoremap <leader>st :SyntasticToggleMode<cr>
nnoremap <leader>sc :SyntasticCheck<cr>
nnoremap <leader>si :SyntasticInfo<cr>
nnoremap <leader>sr :SyntasticReset<cr>
nnoremap <leader>sx :Errors<cr>

" Fuzzy file, buffer, mru, and tag finder
Plugin 'kien/ctrlp.vim'
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>m :CtrlPMRU<cr>
nnoremap <leader>e :CtrlPQuickfix<cr>
nnoremap <leader>d :CtrlPDir<cr>
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }


" A Git wrapper so awesome, it should be illegal.
Plugin 'tpope/vim-fugitive'

" Language plugins:
Plugin 'mcinglis/vim-arduino'
Plugin 'leshill/vim-json'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-markdown'
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


""" EDITING

" flag 'g' is default for substitude commands like `:s/foo/bar/g`.
set gdefault

let c_no_curly_error=1


""" WHITESPACE

" Smarter automatic indenting when starting a new line.
set autoindent
set smartindent

" Always insert tabs (and indents) as spaces.
set expandtab

" Number of spaces to use for each auto-indentation step.
set shiftwidth=4


""" NAVIGATION

" :find over all files within the current working directory.
set path=**

" Enhanced command-line completion.
set wildmenu

" When pressing <Tab> on the wildmenu, autocomplete to the longest common
" string, and if there's more than one match, list them all.
set wildmode=list:full

" File patterns to ignore when autoexpanding file names.
set wildignore+=.git,.hg,.svn,*/deps/*,*.o,*.pyc,*.class,*/_site/*,*.dep.mk

" When switching between buffers, jump to the first open window that contains
" the specified buffer (if there is one).
set switchbuf=useopen

" Allow buffers to be hidden without saving them.
set hidden


""" DISPLAY

" Use a colorscheme optimal for a dark background.
set background=dark

" Show what mode you're on.
set showmode

" Don't display whitespace characters (by default).
set nolist

" Wrap lines longer than the window width.
set wrap

" Wrap lines at word boundaries.
set linebreak


""" SEARCHING

" Ignore case for all-lowercase search patterns.
set ignorecase
set smartcase

" Show matches while typing the search pattern.
set incsearch

" Highlight search pattern matches.
set hlsearch



"""""""""""""""""""""""""
""" AUTOCOMMANDS
"""""""""""""""""""""""""

" Give files with .txt extensions their own filetypes, but only if they
" haven't already been given a filetype.
autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO,LICENSE
            \ if &filetype == "" | setlocal filetype=text | endif

autocmd BufEnter,BufRead *.h
            \ setlocal filetype=c

autocmd BufNewFile,BufRead .jshintrc
            \ setlocal filetype=json

autocmd BufNewFile,BufRead .vimlessrc
            \ setlocal filetype=vim

autocmd BufNewFile,BufRead *.csv
            \ setlocal filetype=csv


autocmd FileType text,markdown,html
            \ setlocal textwidth=0

autocmd FileType csv
            \ setlocal list

autocmd FileType c,cpp,java
            \ setlocal commentstring=//\ %s |
            \ setlocal textwidth=77

autocmd FileType make
            \ setlocal noexpandtab |
            \ setlocal list

autocmd BufEnter,BufRead *.jinja
            \ setlocal filetype=jinja



"""""""""""""""""""
""" SYNTAX
"""""""""""""""""""

autocmd Syntax c
            \ syntax keyword cType
                \ schar uchar ushort uint ulong llong ullong ldouble
                \ ord lssize_t |
            \ syntax keyword cConstant LT EQ GT |
            \ syntax keyword cConstant
                \ EADDRNOTAVAIL EAFNOSUPPORT EHOSTUNREACH ENETUNREACH
                \ ENOBUFS ENODATA ENOMSG EOVERFLOW EPROTONOSUPPORT EPROTOTYPE

autocmd Syntax python
            \ syntax keyword pythonExceptions FileNotFoundError PermissionError



"""""""""""""""""""
""" MAPPINGS
"""""""""""""""""""

" Save the file by pressing Enter in normal mode.
nnoremap <cr> :write<cr>

" Switch off search highlighting until the next search:
nnoremap <leader>h :nohlsearch<cr>

" Move cursor over visible lines, not real lines.
noremap j gj
noremap k gk

" Swap the line movement keys:
nnoremap gj j
nnoremap gk k

" Easily jump around the location list; used with Syntastic's :Errors
nnoremap <leader>ln :lnext<cr>
nnoremap <leader>lp :lprevious<cr>


