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

if has('multi_byte_ime') || has('xim')
    set iminsert=0 imsearch=0
    if has('xim') && has('GUI_GTK')
        " XIMの入力開始キー
        set imactivatekey=C-space
    endif
endif

" IMEの状態をカラー表示
if has('multi_byte_ime')
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIME guifg=NONE guibg=Purple
endif

" Windowsでディレクトリパスの区切りに/を使えるようにする
set shellslash

" 描画更新間隔
set updatetime=100
" swapファイル作成抑止
set noswapfile
" カーソル行を強調する
set cursorline

" □とか○の文字があってもカーソル位置がずれないようにする
" gnome-terminalの場合は効果なし
if exists('&ambiwidth')
  set ambiwidth=double
endif

" クリップボード有効化
set clipboard=unnamed,autoselect

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
" diff:非アクティブバッファへ反映
vnoremap <S-p> :diffput<CR>
" diff:アクティブバッファへの取り込み
vnoremap  <S-o> :diffget<CR>
" diff:次の差分へ
execute "set <M-j>=\ej"
nnoremap <M-j> ]c
nnoremap <F8> ]c
" diff:前の差分へ
execute "set <M-k>=\ek"
nnoremap <M-k> [c
nnoremap <F9> [c


"-----------------------------------------------------------------------------"
" vim/gvim個別設定
"-----------------------------------------------------------------------------"
if has('gui_running')
    "" GVimの設定
    " フォント設定
    if has('win32') || has('win64')
        set guifont=MS_Gothic:h9
        set guifontwide=MS_Gothic:h9
    else
        set guifont=Ricty\ Diminished\ 14
    endif
    set linespace=1

    " ツールバー非表示
    set guioptions-=T
    " メニューバー非表示
    set guioptions-=m

    " 外部grep
    set grepprg=grep\ -nH

    " Window位置の保存と復帰
    let s:infofile = '~/.vim/.vimpos'

    function! s:SaveWindowParam(filename)
        redir => pos
        exec 'winpos'
        redir END
        let pos = matchstr(pos, 'X[-0-9 ]\+,\s*Y[-0-9 ]\+S')
        let file = expand(a:filename)
        let str = []
        let cmd = 'winpos '.substitute(pos, '[^-9-0 ]', '', 'g')
        let l = &lines
        let c = & columns
        cal add(str, 'set lines='. l.' columns='. c)
        silent! let ostr = readfile(file)
        if str != ostr
            call wirtefile(str, file)
        endif
    endfunction

    augroup SaveWindowParam
        autocmd!
        execute 'autocmd SaveWindowParam VimLeave * call s:SaveWindowParam("'.s:infofile.'")'
    augroup END

    if filereadable(expand(s:infofile))
        execute 'source '.s:infofile
    endif
    unlet s:infofile
else
    "" vimの設定
endif


"-----------------------------------------------------------------------------"
" 外部定義ファイル読み込み
"-----------------------------------------------------------------------------"
set runtimepath+=~/.vim
runtime! config/plugins-config/*.vimrc


"-----------------------------------------------------------------------------"
" なぜか最後に設定しないと効かない、、、
"-----------------------------------------------------------------------------"
" シンタックスハイライト:ON
syntax on

" 色設定
set background=dark
colorscheme hybrid

