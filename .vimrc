" - put in /etc/vim/
"
" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" use pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin on
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
nnoremap / /\v
vnoremap / /\v
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set hlsearch
set showmode
set wildmenu
set wildmode=list:longest
"set visualbell
"
set cursorline

set ruler
" set relativenumber " not yet available until vim 7.3 which i don't have yet
" show line numbers
set number
"set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
inoremap kj <ESC> " map jj to the escape key
" auto return to bookmarked line and column
noremap ' `
noremap ` '
" easier <leader>
let mapleader = ","

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" use spaces for tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

:syntax enable
:colorscheme aaron

" autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" share system clipboard
set clipboard=unnamed

" auto indenting
set ai

" folding
set foldenable
set fdm=indent " fold indents
:nnoremap <space> za " use spacebar for general open/close

" default font
" set dfn=

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=blue guibg=blue
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" tell vim to sytax highlight custom files
au BufWinEnter,BufNewFile,BufRead *.jade setf jade
au BufWinEnter,BufNewFile,BufRead *.styl setf css

" highlight characters over an 85 column limit
if has("colorcolumn")
  set colorcolumn=85
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>85v.\+', -1)
endif

hi CursorLine NONE ctermbg=000 guibg=blue " NONE turns off underline
"call ExpextCursorSlowDown(now)

let g:gist_clip_command='xclip -selection clipboard'
let g:gist_detect_filetype=1
let g:github_user='aheckmann'
let g:github_token='XXX'
