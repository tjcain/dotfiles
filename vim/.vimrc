set nocompatible
scriptencoding utf-8

syntax on
filetype plugin indent on

set title
set ruler
set number
set showcmd
set showmatch
set lazyredraw
set noerrorbells
set nowrap
set expandtab
set autoindent
set tabstop=4 softtabstop=4
set nobackup
set noswapfile
set relativenumber
set scrolloff=8
set termguicolors
set ruler
set noshowmode
set hidden

set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start

set smartcase
set incsearch
set hlsearch

" govim
set cmdheight=2
set updatetime=50
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif
set balloondelay=250
set signcolumn=yes

set nofoldenable
set background=dark

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let mapleader=" "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" don't leave visual mode when indenting
vnoremap > >gv
vnoremap < <gv

" don't jump when yanking
vnoremap y myy'y
vnoremap Y myY'y

if has('statusline')
	set laststatus=2 " always display a status line in the last window

	set statusline=%<%f
	set statusline+=%w%h%m%r
	set statusline+=\ [%{&ff}/%Y]
	set statusline+=\ [%{getcwd()}]
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%
endif

" move to last position of previous session
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
endif

" highlight trailing whitespace
highlight TrailingWhitespace ctermbg=196 guibg=red
match TrailingWhitespace /\s\+$/

" gruuuvvvbox baby
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
silent! colorscheme gruvbox
