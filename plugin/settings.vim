let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

if !has('nvim')
    set encoding=utf-8
    set backspace=indent,eol,start
    set history=10000
    set autoread
    set laststatus=2
    set t_vb=
    set t_u7=
endif

if exists('&inccommand')
  set inccommand=split
endif

set titlestring=%t

if executable('rg')
    set grepprg=rg\ --vimgrep
endif

set mouse=a
set completeopt-=preview
" set completeopt+=noinsert
set number
set relativenumber
set sidescroll=1
set showcmd
set title
set autowrite
set hidden
set nowrap
set cmdheight=1
set mousehide
set noerrorbells
set novisualbell
set splitbelow
set splitright
set foldmethod=marker
set foldnestmax=10
set updatetime=1000
set ruler
set shortmess+=c
set diffopt+=vertical
set pumheight=10
set showtabline=1
set list
set listchars=extends:»,precedes:«
set listchars+=tab:│·,eol:¬
set listchars+=nbsp:.,trail:.
set noshowmode

set timeout
set ttimeout
set timeoutlen=600
set ttimeoutlen=0

if !has('nvim')
    set autoindent
    set smarttab
endif
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

if !has('nvim')
    set hlsearch
    set incsearch
endif
set ignorecase
set smartcase
set gdefault
set showmatch

set undofile
set undoreload=10000
set undodir=$EDITOR_ROOT/.cache/undo//
set backupdir=$EDITOR_ROOT/.cache/backup//
set directory=$EDITOR_ROOT/.cache/swap//
set backup
set noswapfile

set wildmenu
set wildmode=list:longest
set wildignorecase
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.mp3,*.wav,*.wav
set wildignore+=*.class,*.o,*.pyc
set wildignore+=.tern-port
"
if has('gui_running')
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guifont=Monospace\ 11
endif
