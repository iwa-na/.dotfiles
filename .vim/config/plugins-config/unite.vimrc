"挿入モードで開始
"let g:unite_enable_start_insert=1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case=1
let g:unite_enable_smart_case=1

" ESCキー2回で終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Prefix key.
nnoremap    [unite] <Nop>
nmap    <Space> [unite]

" unite.vim keymap
nnoremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]p :<C-u>Unite<Space>file_point<CR>
nnoremap <silent> [unite]v :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
