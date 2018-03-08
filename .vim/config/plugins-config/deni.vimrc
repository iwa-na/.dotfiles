"-----------------------------------------------------------------------------"
" dein
"-----------------------------------------------------------------------------"
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = fnamemodify('~/.vim/bundle/dein', ':p')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . s:dein_repo_dir
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

filetype plugin indent on
syntax enable

" もし、未インストールものものがあったらインストール
if dein#check_install()
    call dein#install()
endif

