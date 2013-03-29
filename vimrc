
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set leader keys here so that plugins map to the intended key.
let mapleader = ' '

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
noremap <Leader>vbc :BundleClean<CR>
noremap <Leader>vbi :BundleInstall<CR>
noremap <Leader>vbu :BundleUpdate<CR>

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
" cs"' cs'<q> cst" ds" ysiw] cs]{ yss)
" in visual mode: S<p class="important">

" Manipulate multiple variants of a word
Bundle 'tpope/vim-abolish'
" :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{}
" :%Subvert/facilit{y,ies}/building{,s}/g
" crs (snake case), crm (mixed case), crc (camel case), cru (upper case)
noremap <Leader>ab :Abolish<Space>
noremap <Leader>as :%Subvert/

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

" Markup mappings and helpers (e.g. tag, C-x, Space or Enter)
Bundle 'tpope/vim-ragtag'

" Highlight and remove trailing whitespace
Bundle 'bitc/vim-bad-whitespace'
noremap <Leader>we :EraseBadWhitespace<CR>
noremap <Leader>ww :ToggleBadWhitespace<CR>

" Syntax checking
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['html'] }

" Comment out stuff
Bundle 'tomtom/tcomment_vim'
noremap // :TComment<CR>

" Fuzzy file, buffer, most-recently-used, tag, ... finder
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '\'
let g:ctrlp_user_command = 'ag --nogroup --nobreak --noheading --nocolor -g "" %s'
noremap <Bar> :CtrlPBuffer<CR>

" Text filtering and alignment
Bundle 'godlygeek/tabular'
noremap <Leader>a= :Tabularize /=<CR>
noremap <Leader>a# :Tabularize /#<CR>
noremap <Leader>a: :Tabularize /:\zs<CR>
noremap <Leader>a, :Tabularize /,\zs<CR>

" Vim motions on speed!
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'
nmap s <Leader><Leader>w
nmap S <Leader><Leader>b

" Code completion engine for Vim
" Bundle 'Valloric/YouCompleteMe'

" Maintain settings across editors
" Bundle 'editorconfig/editorconfig-vim'

" The ultimate statusline and prompt utility
Bundle 'Lokaltog/vim-powerline'

" Tree explorer plugin for vim
" Bundle 'scrooloose/nerdtree'
" noremap <Leader>e :NERDTreeToggle<CR>
" au BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")

" ######
"   COLORSCHEMES
" #######

" One colorscheme pack to rule them all
Bundle 'flazz/vim-colorschemes'

Bundle 'jnurmine/Zenburn'

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

" Cucumber
Bundle 'tpope/vim-cucumber'

" Python autocompletion
" Bundle 'davidhalter/jedi-vim'
" let g:jedi#use_tabs_not_buffers = 1

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


filetype plugin indent on
syntax on


" #########################################################
"   SETTINGS
" #########################################################

" set background=dark
" colorscheme lucius
colorscheme Tomorrow-Night
" colorscheme zenburn

" Show the file name in the terminal's title bar.
set title

" Don't display long lines by wrapping them
set nowrap

" Make searches case-insensitive for all lower-case search terms
set ignorecase
set smartcase

" If sleuth.vim fails to heuristically set indentation settings, and
" the filetype doesn't have an autocommand setting indentation settings,
" use these settings.
set expandtab
set shiftwidth=2

" I really hate folding
set nofoldenable

" Filetypes to ignore (in wildmenu and Ctrl-P)
set wildignore+=*/tmp/*,*.so,*.pyc,*.o,*.class

" Ctrl-Left/Right won't work in Tmux without this
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" #########################################################
"   MAPPINGS
" #########################################################

" Shift-less typing of commands
noremap ; :

" Move cursor over visible lines, not real lines
noremap j gj
noremap k gk

" I've recently become more arrow-key happy again
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Restore visual selection on indenting
vnoremap < <gv
vnoremap > >gv

" Save the file with just Enter in Normal mode; yell if I forget.
nnoremap <CR> :write<CR>
cabbrev w nope

" Faster window switching
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" Switch between files
noremap <C-e> :e#<CR>

" Quickly open and source the .vimrc
noremap <Leader>ve :edit $VIMRC<CR>
noremap <Leader>vs :source $VIMRC<CR>

" Easy toggling
noremap <Leader>th :setlocal hlsearch!<CR>
noremap <Leader>tl :setlocal list!<CR>
noremap <Leader>tn :setlocal number!<CR>
noremap <Leader>tp :setlocal paste!<CR>
noremap <Leader>ts :setlocal spell!<CR>

" Easy wrapping of lines
noremap <Leader>wl :setlocal wrap! linebreak!<CR>

" #########################################################
"   AUTOCOMMANDS
" #########################################################

au FileType vim
      \ setlocal shiftwidth=2

au BufEnter,BufRead .tmux.conf setlocal filetype=tmux

au FileType python
      \ setlocal shiftwidth=4 |
      \ setlocal colorcolumn=80

au FileType ruby
      \ setlocal shiftwidth=2 |
      \ setlocal colorcolumn=80

au BufEnter,BufRead Guardfile setlocal filetype=ruby

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
au FileType go noremap <Leader>gf :Fmt<CR>
au FileType go noremap <Leader>gr :GoRun<CR>
au FileType go noremap <Leader>gd :Drop<Space>
au FileType go noremap <Leader>gi :Import<Space>

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

