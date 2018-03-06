"-----------------------------------------------------------------------------"
" 基本設定
"-----------------------------------------------------------------------------"
" ファイルタイプ変更時のいろいろ再設定
filetype plugin indent on

" ルーラー表示
set ruler
" 入力中のコマンド表示
set showcmd
" バックアップファイル：作成しない
set nobackup
" 右下へコマンド表示
set showcmd
" インクリメンタルサーチ:ON
set incsearch
" 自動インデント:ON
set cindent
" バックスペース設定：字下げ／行末／挿入位置を超えて削除可能とする
set backspace=indent,eol,start

" 大文字小文字を区別しない
set ignorecase
" 大文字指定でnoignorecase同等
set smartcase
" インクリメンタル
set wrapscan
" 一致文字列ハイライト
set hlsearch

" 行番号を表示
set number
" タイトル表示
set title
" 不可視文字表示
set list
set listchars=tab:^\ ,trail:_

" 文字コードの自動認識
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

" 改行コードの自動認識
set fileformats=unix,dos,mac

" 対応する括弧のハイライト
set showmatch
" 対応する括弧のハイライト表示時間
set matchtime=1

" タブ幅
set tabstop=4
" タブを空白へ展開
set expandtab
" インデント挿入時のタブ幅
set shiftwidth=4

" エラー時の音とビジュアルレベルの抑止
set noerrorbells
set novisualbell
set visualbell t_vb=

" Windowsでディレクトリパスの区切りに/を使えるようにする
set shellslash

"TODO:
set updatetime=100
set noswapfile
set cursorline

" □とか○の文字があってもカーソル位置がずれないようにする
" gnome-terminalの場合は効果なし
if exists('&ambiwidth')
  set ambiwidth=double
endif

" クリップボード有効化
set clipboard=unnamedplus,autoselect

" 色設定
set background=dark
colorscheme hybrid

" ステータスライン設定
set statusline=%F%m%r%h%w\ \ FORMAT=%{&ff}\ \ TYPE=%Y\ \ \%{'ENC='.(&fenc!=''?&fenc:&enc).''}\ \ ASCII=\%03.3b\ \ HEX=\%02.2B\ \ POS=[%04l\/%L,%04v]\ \ %p%%
set laststatus=2

" キーバインド追加
nmap <C-j> 5j
nmap <C-k> 5k
nmap <C-h> 5h
nmap <C-l> 5l
nmap <C-f> :next<CR>
nmap <C-b> :rewind<CR>

" タブの設定
set showtabline=2
nmap <silent> <F3> :tabnext<CR>
nmap <silent> <F2> :tabprevious<CR> 
map <F4> :only<CR>:tabo<CR>:tab sball<CR>:call ProgrammingMode()<CR>
map <C-F4> tabc<CR>

" プログラミングモード設定
command! Pmode call ProgrammingMode()
function! ProgrammingMode()
    copen 3
    Tlist
    execute "normal! ¥<C-w>w"
    execute "normal! ¥<C-w>w"
endfunction

" バッファの設定
map <silent> <F5> :bp<cr>
map <silent> <F6> :bn<cr>
nmap gb :ls<CR>:buf

" diffの縦画面設定
set diffopt+=vertical


"-----------------------------------------------------------------------------"
" GTAGS
"-----------------------------------------------------------------------------"
"関数参照している箇所を一覧表示
map <C-t> :Gtags -r<CR>
"定義箇所-参照箇所を移動
map <C-g> :GtagsCursor<CR>
"検索項目の上方向へ移動＆表示
map <C-p> :cp<CR>
"検索項目の下方向へ移動＆表示
map <C-n> :cn<CR>

if has('gui_running')
    "" GVimの設定
    " フォント設定
    set guifont=Ricty\ Diminished\ 14
    set linespace=1
    " ツールバー非表示
    set guioptions-=T
else
    "" vimの設定
endif


"-----------------------------------------------------------------------------"
" dein
"-----------------------------------------------------------------------------"
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/bundle/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/bundle/dein-toml')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif


"-----------------------------------------------------------------------------"
" 外部定義ファイル読み込み
"-----------------------------------------------------------------------------"
runtime! config/plugins-config/*.vimrc


"-----------------------------------------------------------------------------"
" なぜか最後に設定しないと効かない、、、
"-----------------------------------------------------------------------------"
" シンタックスハイライト:ON
syntax on

