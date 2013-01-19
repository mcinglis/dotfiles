
set nocompatible            " be vimproved!
syntax on                   " enable syntax highlighting
set encoding=utf-8          " default to UTF8 encoding

let mapleader=';'
nnoremap ' :

"" Plugins

filetype off                " temporary for Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage itself (required)
Bundle 'gmarik/vundle'
map <Leader>vi :so %<CR>:BundleInstall<CR>
map <Leader>vc :so %<CR>:BundleClean<CR>

" Vundle help: (:h vundle for more details)
"   :BundleList         - list configured bundles
"   :BundleInstall      - install (or update) bundles
"   :BundleSearch foo   - search for foo
"   :BundleClean        - remove unused bundles

" easy file opening
Bundle 'wincent/Command-T'

" commenting
Bundle 'tomtom/tcomment_vim'
noremap // :TComment<CR> 
vnoremap // :TComment<CR>

" JSHint integration, etc.
Bundle 'scrooloose/syntastic' 
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1

" color schemes
Bundle 'Lucius'
Bundle 'altercation/vim-colors-solarized'

" better javascript
Bundle 'pangloss/vim-javascript'

" coffeescript highlighting
Bundle 'kchmck/vim-coffee-script'

" clojure support
Bundle 'VimClojure'

" less highlighting
Bundle 'groenewege/vim-less'

" arduino syntax highlighting
Bundle 'vim-scripts/Arduino-syntax-file'

" support for markdown with GitHub code blocks and inline code
Bundle 'jtratner/vim-flavored-markdown'

" support for markdown
" Bundle 'tpope/vim-markdown'

" easy surrounding manipulation
Bundle 'tpope/vim-surround'

" repeat supported plugin maps with .
Bundle 'tpope/vim-repeat'

" support for pandoc's extended markdown
" Bundle 'vim-pandoc/vim-pandoc'

filetype plugin indent on   " load filetype plugins and indentation

"" Autocmd
if has("autocmd")
    " override the filetype plugin from setting formatoptions
    " autocmd FileType * set fo=crqla
    " http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table

    " save files when vim loses focus
    autocmd FocusLost * silent! wa

    autocmd BufNewFile,BufRead *.jinja setlocal filetype=jinja
    autocmd BufNewFile,BufRead *.html.jinja setlocal filetype=htmljinja

    autocmd BufNewFile,BufRead *.json setlocal filetype=javascript
    autocmd BufNewFile,BufRead .jshintrc setlocal filetype=javascript

    autocmd BufNewFile,BufRead *.ino setlocal filetype=arduino

    autocmd BufNewFile,BufRead Gemfile set filetype=ruby

    " File types that should only use two spaces for tabs
    autocmd FileType html,xml,css,scss,javascript,coffee,eco,php,ruby,eruby,sql,sh,conf
          \ setlocal shiftwidth=2 |
          \ setlocal softtabstop=2 |
          \ setlocal smartindent


    autocmd FileType python 
          \ setlocal textwidth=79 |
          \ setlocal shiftwidth=4 |
          \ setlocal tabstop=4 |
          \ setlocal expandtab |
          \ setlocal softtabstop=4 |
          \ setlocal shiftround |
          \ setlocal colorcolumn=79 |
          \ map <Leader>p :!python<CR> |
          \ map <Leader>x :!python %<CR>

    autocmd FileType ruby
          \ setlocal textwidth=79 |
          \ setlocal shiftwidth=2 |
          \ setlocal tabstop=2 |
          \ setlocal softtabstop=2 |
          \ setlocal smartindent |
          \ setlocal expandtab |
          \ setlocal shiftround |
          \ setlocal colorcolumn=80

    autocmd FileType javascript
          \ setlocal textwidth=79 |
          \ setlocal shiftwidth=2 |
          \ setlocal tabstop=2 |
          \ setlocal softtabstop=2 |
          \ setlocal expandtab |
          \ setlocal shiftround |
          \ setlocal smartindent |
          \ setlocal colorcolumn=80

    autocmd FileType c,cpp
          \ setlocal textwidth=79 |
          \ setlocal shiftwidth=4 |
          \ setlocal tabstop=4 |
          \ setlocal softtabstop=4 |
          \ setlocal smartindent |
          \ setlocal expandtab

    " Use flavored markdown by default in all markdown files
    au BufNewFile,BufRead *.md,*.markdown
          \ setlocal filetype=ghmarkdown |
          \ setlocal wrap |
          \ setlocal linebreak |
          \ setlocal nolist |
          \ setlocal textwidth=0 |
          \ setlocal wrapmargin=0 |
          \ setlocal formatoptions+=l |
          \ setlocal spell
endif

"" Display
set background=dark         " dark terminal colours by default
set title                   " show file name in title bar
set wildmenu                " tab completion with menu
set wildignore+=*.o,*.pyc,*.jpg,*.jpeg,*.png,*.gif,node_modules/**,*.class
set scrolloff=5             " don't let cursor get to top of screen

"" Whitespace
set nowrap                        " don't wrap long lines
set tabstop=2 shiftwidth=2        " spaces used for tabs and auto-indentation
set expandtab                     " use spaces instead of tabs
set smarttab                      " smart tab handling for indenting
set smartindent                   " smart indentation rules
set textwidth=79                  " when to break lines
set backspace=indent,eol,start    " backspace over everything

"" Searching
set incsearch         " search incrementally (while typing)
set ignorecase        " case insensitive searching
set smartcase         " but become case sensitive if uppercase

"" Misc
" set autochdir                   " automatically change to directory of file
set vb t_vb=                    " turn off bell sound on error
set backupdir=~/.vim/sessions   " where to store backup files
set directory=~/.vim/sessions   " where to store the swap file
set undofile                    " enable persistent undo
set undodir=~/.vim/undodir      " where to store the persistent undo files
set history=1024                " keep 1024 lines of command history
set autowriteall                " automatically save buffer on switching

"" GUI options
if has("gui_running")
    colorscheme Tomorrow-Night
    set lines=52 columns=83
    set cursorline              " highlight the line the cursor is on
    set guifont=Source\ Code\ Pro\ 9
    set guioptions=ac
    set number                  " show line numbers
endif

"" Non-plugin shortcuts

map <Leader>r :so %<CR>

" easier saving
map <Leader>s :w<CR>

" hide search matches
nnoremap <Leader><Space> :nohlsearch<CR>

" restore visual selection on indenting.
vmap < <gv
vmap > >gv

" select the just-pasted text
nnoremap <Leader>v V`]

" easy buffer navigation and control
map <Leader>[ :bprevious<CR>
map <Leader>] :bnext<CR>
map <Leader>\ :bdelete<CR>
map <Leader>= :ls<CR>

