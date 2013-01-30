
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set mapleader here so that plugins map to the intended key.
let mapleader=';'

" #########################################################
"   PLUG-INS
" #########################################################

" Vundle needs the filetype detection to be temporarily off.
" It is reactivated at the end of the plug-ins section.
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle needs to manage itself.
Bundle 'gmarik/vundle'

" Defaults everyone can agree on
Bundle 'tpope/vim-sensible'

" Heuristically set whitespace options.
Bundle 'tpope/vim-sleuth'

" Readline key bindings in insert and command modes
Bundle 'tpope/vim-rsi'

" Pairs of handy bracket mappings
Bundle 'tpope/vim-unimpaired'

" Manipulate surrounding text
Bundle 'tpope/vim-surround'

" Manipulate multiple variants of a word
Bundle 'tpope/vim-abolish'

" Use Ctrl-A/Ctrl-X to increment and decrement dates, times and more
Bundle 'tpope/vim-speeddating'

" Repeat plug-in maps too with '.'
Bundle 'tpope/vim-repeat'

" Reveal more information about characters on pressing `ga`
Bundle 'tpope/vim-characterize'

" Commands that wrap some UNIX shell commands
Bundle 'tpope/vim-eunuch'

" Wisely end control structures, like 'end' in Ruby
Bundle 'tpope/vim-endwise'

" Highlight and remove trailing whitespace
Bundle 'bitc/vim-bad-whitespace'

" Syntax checking
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

" Comment out stuff
Bundle 'tomtom/tcomment_vim'
nmap // :TComment<CR>
vmap // :TComment<CR>

" Super-quick file opening.
Bundle 'wincent/Command-T'

" A Git wrapper so awesome, it should be illegal.
Bundle 'tpope/vim-fugitive'

" Commands that interface with common web protocols
Bundle 'mattn/webapi-vim'

" Gist wrapper
Bundle 'mattn/gist-vim'

" ######
"   LANGUAGE SUPPORT
" #######

" Set 'path' for JVM languages from the Java class path
Bundle 'tpope/vim-classpath'

" Rails
Bundle 'tpope/vim-rails'

" Rake
Bundle 'tpope/vim-rake'

" Bundler
Bundle 'tpope/vim-bundler'

" Haskell analysis
Bundle 'bitc/vim-hdevtools'

" Clojure
Bundle 'guns/vim-clojure-static'

" Clojure REPL
Bundle 'tpope/vim-foreplay'

" Arduino
Bundle 'kingbin/vim-arduino'

" JavaScript
Bundle 'pangloss/vim-javascript'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" JSON
Bundle 'leshill/vim-json'

" Haml, Sass and SCSS
Bundle 'tpope/vim-haml'

" LESS
Bundle 'groenewege/vim-less'

" Handlebars
Bundle 'nono/vim-handlebars'

" Jinja
Bundle 'lepture/vim-jinja'

" Markdown
Bundle 'tpope/vim-markdown'

" #######
"   COLOR SCHEMES
" #######

Bundle 'Lucius'
Bundle 'altercation/vim-colors-solarized'


" #########################################################
"   MAPPINGS
" #########################################################

nmap ' :

" Save a file with sudo permissions from a non-sudo vim session
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q

" Quickly open up the vimrc
nmap <Leader>v :edit $VIMRC<CR>

" Restore visual selection on indenting
vmap < <gv
vmap > >gv

" Buffer navigation and control
nmap <Leader>[ :bprevious<CR>
nmap <Leader>] :bnext<CR>
nmap <Leader>\ :bdelete<CR>
nmap <Leader>= :ls<CR>

" Strip whitespace
nmap <Leader>w :EraseBadWhitespace<CR>

" Toggle spell-checking
nmap <Leader>s :set spell!<CR>

" #########################################################
"   AUTOCOMMANDS
" #########################################################

" sleuth.vim incorrectly determines .vimrc to be shiftwidth=6.
au BufEnter,BufRead vimrc,.vimrc
      \ setlocal shiftwidth=2

au FileType python
      \ setlocal shiftwidth=4 |
      \ setlocal colorcolumn=80

au FileType ruby
      \ setlocal shiftwidth=2 |
      \ setlocal colorcolumn=80

au FileType javascript
      \ setlocal shiftwidth=2 |
      \ setlocal colorcolumn=80

au FileType c,cpp,java
      \ setlocal shiftwidth=4 |
      \ setlocal colorcolumn=80

" Give files with .txt extensions their own filetypes.
au BufEnter,BufRead *.txt
      \ setlocal filetype=text

" For filetypes used for writing, wrap long lines by breaking at words.
au FileType markdown,rst,text,gitcommit
      \ setlocal wrap |
      \ setlocal linebreak


" #########################################################
"   SETTINGS
" #########################################################

colorscheme Tomorrow-Night

" Show the file name in the terminal's title bar.
set title

" Don't display long lines by wrapping them
set nowrap

" If sleuth.vim fails to heuristically set indentation settings, use this.
set expandtab
set shiftwidth=2

