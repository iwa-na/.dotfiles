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


