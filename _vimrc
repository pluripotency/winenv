set nocompatible
filetype off

let g:neobundle_default_git_protocol='https'
let s:neobundledir   = expand('~/local/neobundle')

if isdirectory(s:neobundledir)
  if has('vim_starting')
    execute 'set runtimepath+=' . s:neobundledir . '/neobundle.vim'
  endif
  call neobundle#begin(s:neobundledir)
  NeoBundleFetch 'Shougo/neobundle.vim'

  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/unite.vim'
  " other plugins...
  " Color Scheme
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle '29decibel/codeschool-vim-theme'
  " lightline
  NeoBundle 'itchyny/lightline.vim'

  call neobundle#end()

else
  command! NeoBundleInit call s:neobundle_init()
  function! s:neobundle_init()
    call mkdir(s:neobundledir, 'p')
    execute 'cd' s:neobundledir
    call system('git clone https://github.com/Shougo/neobundle.vim')
    execute 'set runtimepath+=' . s:neobundledir . '/neobundle.vim'
    call neobundle#rc(s:neobundledir)
    NeoBundle 'Shougo/unite.vim'
    "NeoBundle 'Shougo/vimproc', { 'build': { 'unix': 'make -f make_unix.mak', 'windows': 'make -f make_mingw32.mak', }, }

    NeoBundleInstall
  endfunction
endif

filetype plugin indent on
syntax on

if !has('gui_running')
  set t_Co=256
endif

nnoremap <Space>. :<C-u>edit $HOME/_vimrc<Enter>
nnoremap <Space>s. :<C-u>source $HOME/_vimrc<Enter>

set imdisable
set number
set noswapfile
set backspace=indent,start,eol
set ignorecase
set smartcase
set hlsearch
set showcmd
set pastetoggle=<F4>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set nosmartindent
set cindent

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

set statusline=%m%r%h%w\ %{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[%Y]%t\ %{fugitive#statusline()}\ %1l/%L,%c\ %P
set laststatus=2

"colorscheme blue
colorscheme solarized
"colorscheme codeschool
"colorscheme badwolf
"set background=dark

