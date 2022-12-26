source $VIMRUNTIME/defaults.vim

set relativenumber number
set fileencodings=utf-8
syntax enable
set hlsearch
set incsearch

if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif

set clipboard+=unnamed
set laststatus=2
set wildmenu

" indent
set smartindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=0
set breakindent " 改行時にインデントを考慮する

" statusline
set statusline=%F%m%r%h%w%=\|\ %{&fenc!=''?&fenc:&enc}\ \|\ %Y\ \|\ %{&ff}\ \|\ %l/%L\ \|\ 
set laststatus=2

" map
inoremap <silent>jj <ESC>
noremap <S-h> ^
noremap <S-l> $
  " インデントを修正
nnoremap == gg=G

" true color
if exists('+termguicolors')
  set termguicolors
  " $TERMがxterm以外のときは以下を設定する必要がある。
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" " 文字色
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" " 背景色
endif

" vim-plug =====================
" vim-plugを自動インストール
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' } " カラースキーム
Plug 'markonm/traces.vim'    " 置換時にわかりやすく
Plug 'cohama/lexima.vim'     " 閉じカッコの補完系
Plug 'sheerun/vim-polyglot'  " 言語パック
Plug 'dense-analysis/ale'    " Linter
Plug 'ervandew/supertab'     " Tabで補完
Plug 'preservim/nerdtree'    " Tree Explorer
Plug 'joshdick/onedark.vim'  " カラースキーム
call plug#end()

syntax on
colorscheme onedark

" NERDTree
nnoremap <F3> :NERDTree<CR>
