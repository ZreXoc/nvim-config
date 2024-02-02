nmap <leader>pq :%SnipRun<cr>
vmap <leader>pq :SnipRun<cr>


nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]
nnoremap <silent>[fzf-p]p :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent>[fzf-p]* :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort<CR>
nnoremap <silent>[fzf-p]w :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR><CR>
nnoremap <silent>[fzf-p].     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
