
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
nnoremap <Leader>vbc :BundleClean<CR>
nnoremap <Leader>vbi :BundleInstall<CR>

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
nnoremap <Leader>e :EraseBadWhitespace<CR>

" Syntax checking
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

" Comment out stuff
Bundle 'tomtom/tcomment_vim'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" Super-quick file opening.
Bundle 'wincent/Command-T'

" A Git wrapper so awesome, it should be illegal.
Bundle 'tpope/vim-fugitive'

" Commands that interface with common web protocols
Bundle 'mattn/webapi-vim'

" Gist wrapper
Bundle 'mattn/gist-vim'

" Delete buffers without closing windows with :BD
Bundle 'bufkill.vim'

" Vim motions on speed!
Bundle 'Lokaltog/vim-easymotion'

" Maintain settings across editors
" Bundle 'editorconfig/editorconfig-vim'

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

" Rust
Bundle 'reusee/vim.rust'

" Go
set rtp+=$GOROOT/misc/vim

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

Bundle 'jonathanfilip/vim-lucius'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on
syntax on

" #########################################################
"   MAPPINGS
" #########################################################

nmap ' :

" Faster window switching
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" Faster window resizing
nnoremap + <C-w>+
nnoremap - <C-w>-

" Faster viewport scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Toggle showing whitespace
nnoremap <Leader>l :set list!<CR>

" Toggle spell-checking
nnoremap <Leader>s :set spell!<CR>

" Quickly open and source the .vimrc
nnoremap <Leader>ve :edit $VIMRC<CR>
nnoremap <Leader>vs :source $VIMRC<CR>

" Buffer navigation and control
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>] :bnext<CR>
nnoremap <Leader>\ :BD<CR>
nnoremap <Leader>= :ls<CR>

" Restore visual selection on indenting
vnoremap < <gv
vnoremap > >gv

" #########################################################
"   AUTOCOMMANDS
" #########################################################

au FileType vim
      \ setlocal shiftwidth=2 |
      \ HideBadWhitespace

au FileType python
      \ setlocal shiftwidth=4 |
      \ setlocal colorcolumn=80

au FileType ruby
      \ setlocal shiftwidth=2 |
      \ setlocal colorcolumn=80 |
      \ inoremap ' " |
      \ imap ";" '

au FileType javascript
      \ setlocal shiftwidth=2 |
      \ setlocal colorcolumn=80

au FileType json
      \ setlocal smartindent

au BufEnter,BufRead .jshintrc
      \ setlocal filetype=json

au FileType c,cpp,java
      \ setlocal shiftwidth=4 |
      \ setlocal colorcolumn=80

au FileType go
      \ setlocal noexpandtab |
      \ command! GoRun execute '!go run %'
au FileType go noremap <Leader>f :Fmt<CR>
au FileType go noremap <Leader>r :GoRun<CR>
au FileType go noremap <Leader>d :Drop 
au FileType go noremap <Leader>i :Import 

" Set the filetype to text if none is set already.
" This is a work-around for Vim help files keeping their syntax.
function! SetTextFiletypeIfNone()
  if &filetype == ''
    setlocal filetype=text
  endif
endfunction

" Give files with .txt extensions their own filetypes.
au BufEnter,BufRead *.txt,*.text
      \ call SetTextFiletypeIfNone()

" For filetypes used for writing, wrap long lines by breaking at words.
au FileType markdown,rst,text,gitcommit
      \ setlocal wrap |
      \ setlocal linebreak


" #########################################################
"   SETTINGS
" #########################################################

" set background=dark
" colorscheme lucius
colorscheme Tomorrow-Night

" Show the file name in the terminal's title bar.
set title

" Don't display long lines by wrapping them
set nowrap

" If sleuth.vim fails to heuristically set indentation settings, use this.
set expandtab
set shiftwidth=2

" I really hate folding
set nofoldenable

