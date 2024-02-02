let mapleader="\<space>"
imap jk <esc>
nmap <silent><tab> :bn<cr>
nmap <silent><S-tab> :bN<cr>
nnoremap <silent><M-w> :bd <CR>
imap <M-a> <esc>gg0vG$   "select all
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! "force write
cnoremap md execute 'silent! write !mkdir -p %:h;' <bar> edit! "force write

" ==== copy and paste ==================

" Paste system clipboard with Ctrl + v
inoremap <C-v> <ESC>"+gpi
nnoremap <C-v> "+gP<ESC>
vnoremap <C-v> d"+gP<ESC>
cnoremap <C-v> <C-r>+

" Cut to system clipboard with Ctrl + x
vnoremap <C-x> "+d
"nnoremap <C-x> "+dd
inoremap <C-x> <ESC>"+ddi

" Copy to system clipboard with Ctr + c
vnoremap <C-c> "+y
nnoremap <C-c> "+yy
inoremap <C-c> <ESC>"+yyi

" ==== end copy and paste ==================

" ==== editor ==================

nnoremap <leader>enh :noh<CR>
nnoremap <leader>eva gg0vG$<C-o>
nnoremap <leader>eca gg0vG$"+y<C-o>
vnoremap <leader>ec "+y
" ==== end editor ==================
