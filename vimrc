
" Use Vim defaults, not Vi defaults.
" This must be first, because it changes other settings.
set nocompatible

let mapleader=' '

let c_no_bracket_error=1
let c_no_curly_error=1

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

" Highlight and remove trailing whitespace.
Bundle 'bitc/vim-bad-whitespace'
noremap <Leader>we :EraseBadWhitespace<CR>
noremap <Leader>ww :ToggleBadWhitespace<CR>

" Syntax checking.
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_c_checkers = ['make']

" Quick universal comment toggling.
Bundle 'tomtom/tcomment_vim'
noremap // :TComment<CR>

" Fuzzy file and buffer finder.
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '\'
noremap <Bar> :CtrlPBuffer<CR>

" Live preview of LaTeX files
Bundle 'xuhdev/vim-latex-live-preview'

" Language plugins.
Bundle 'tpope/vim-markdown'
Bundle 'tkztmk/vim-vala'
Bundle 'wting/rust.vim'

" Finished registering plugins; switch filetype detection back on.
filetype plugin indent on


"""""""""""""""""""
" OPTIONS
"""""""""""""""""""

" Use \n for line breaks, not carriage return.
set fileformat=unix

" Use a colorscheme optimal for a dark background.
set background=dark

" What special characters to display.
"set list
"set listchars="tab:⇥ ,extends:⇉,precedes:⇇,nbsp:·"

" Smart autoindenting when starting a new line. Use with autoindent.
set smartindent

" Insert tabs (and indents) as spaces.
set expandtab

" Number of spaces to use for each auto-indentation step.
set shiftwidth=4

" File patterns to ignore when expanding on the 'wildmenu'.
set wildignore+=*.o,*.pyc,*.class,.git/*,.svn/*,*.dep.mk

" Ignore case for all-lowercase search patterns.
set ignorecase
set smartcase

" Highlight search pattern matches.
set hlsearch

" Where to store swap files.
"set directory=~/.vim/swapdir

" Save undo histories for files.
set undofile
set undodir=~/.vim/undodir

" Mouse works fine in most modern terminals.
"set mouse=a


"""""""""""""""""""
" AUTOCOMMANDS
"""""""""""""""""""

" Remember cursor position, folds, and options.
autocmd BufWinLeave ?* mkview
autocmd VimEnter ?* loadview

" Used for a temporary bash file.
autocmd BufEnter,BufRead ebash.sh call SetFileTypeSH("bash")

" Give files with .txt extensions their own filetypes, but only if they
" haven't already been given a filetype.
function! SetTextFiletypeIfNone()
    if &filetype == ''
        setlocal filetype=text
    endif
endfunction
autocmd BufEnter,BufRead *.txt call SetTextFiletypeIfNone()

autocmd FileType c,cpp
            \ setlocal textwidth=72
autocmd BufEnter,BufRead *.h
            \ setlocal filetype=c

autocmd FileType make
            \ setlocal noexpandtab

autocmd FileType html
            \ setlocal shiftwidth=2

" For filetypes used for writing, wrap long lines by breaking at words.
autocmd FileType text,markdown,gitcommit,rst
            \ setlocal wrap |
            \ setlocal nolist |
            \ setlocal linebreak

autocmd FileType gitcommit
            \ setlocal textwidth=72

autocmd BufRead,BufNewFile *.rs
            \ setlocal filetype=rust


"""""""""""""""""""
" MAPPINGS
"""""""""""""""""""

" Enter command mode without holding shift.
noremap ; :

" Move the cursor over visible lines, not real lines.
noremap j gj
noremap k gk

" Switch to the last-edited buffer with Ctrl-E.
noremap <C-e> :e#<CR>

" Easier window switching.
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" Save the file by pressing Enter in normal mode.
nnoremap <CR> :write<CR>

" Clear the highlighting of search matches.
nnoremap <Leader>h :nohlsearch<CR>

