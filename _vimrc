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
  nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
  " ファイル一覧
  nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  " レジスタ一覧
  nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
  " 最近使用したファイル一覧
  nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
  " 常用セット
  nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
  " 全部乗せ
  nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
  " ウィンドウを分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " ウィンドウを縦に分割して開く
  au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " ESCキーを2回押すと終了する
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

  " vimfiler
  NeoBundle 'Shougo/vimfiler'
  nnoremap <silent> ,v :<C-u>VimFiler -split-simple -winwidth=35<CR>

  " other plugins...
  " NERDTree
  NeoBundle 'scrooloose/nerdtree'
  nmap <Leader>^ :NERDTreeToggle<CR>
  nnoremap <silent> ,n :NERDTreeToggle<CR>

  " Color Scheme
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle '29decibel/codeschool-vim-theme'
  NeoBundle 'sjl/badwolf'

  " lightline
  NeoBundle 'itchyny/lightline.vim'
  set statusline=%m%r%h%w\ %{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[%Y]%t\ %{fugitive#statusline()}\ %1l/%L,%c\ %P
  set laststatus=2

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

"colorscheme blue
"colorscheme solarized
"colorscheme codeschool
colorscheme badwolf
"set background=dark

:cd c:\users\kokuryo-m\

