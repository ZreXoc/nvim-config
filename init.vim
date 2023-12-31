let g:python3_host_prog = '/bin/python'

" ==== mappings ==================
let mapleader="\<space>"
imap jk <esc>
nmap <tab> :bn<cr>
nnoremap <M-w> :bd <CR>
nnoremap <leader>nh :noh<CR>

set termguicolors
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set background=dark

set ai              " 自动缩进
set si              " 智能缩进
set cindent         " C/C++风格缩进
" tab转化为4个字符
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab
set history=500  " vim记住的历史操作的数量，默认的是20
set autoread     " 当文件在外部被修改时，自动重新读取
set mouse=a      " 在所有模式下都允许使用鼠标，还可以是n,v,i,c等

"如果行尾有多余的空格(包括 Tab 键),该配置将让这些空格显示成可见的小方块
"set listchars=tab:»■,trail:■
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list
set noshowmode
set updatetime=300
" set signcolumn=yes
set number relativenumber

" ==== Clipboard Settings ==================

" set clipboard+=unnamedplus
let g:clipboard = {
      \   'name': 'win32yank',
      \   'copy': {
      \      '+': 'win32yank -i --crlf',
      \      '*': 'win32yank -i --crlf',
      \    },
      \   'paste': {
      \      '+': 'win32yank -o --lf',
      \      '*': 'win32yank -o --lf',
      \   },
      \   'cache_enabled': 0,
      \ }

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

" ==== end Clipboard Settings ==================

"ctags
set tags=./.tags;,.tags;$HOME/.cache/tags
set autochdir


" tex for md
" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as "math"
hi link math Statement

call plug#begin()
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'godlygeek/tabular'
    Plug 'rcarriga/nvim-notify'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'ryanoasis/vim-devicons'

	Plug 'plasticboy/vim-markdown'

	Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'
	Plug 'preservim/nerdcommenter'
	Plug 'ferrine/md-img-paste.vim'
	Plug 'frazrepo/vim-rainbow'
    Plug 'rhysd/vim-clang-format'
    " Plug 'JBakamovic/cxxd-vim'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'skywind3000/asynctasks.vim'
    Plug 'karb94/neoscroll.nvim'
    Plug 'ludovicchabant/vim-gutentags'

    Plug '907th/vim-auto-save'

    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-syntax'
    Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
    Plug 'sgur/vim-textobj-parameter'

    Plug 'octol/vim-cpp-enhanced-highlight'
    " Plug 'Shougo/echodoc.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'mzlogin/vim-markdown-toc'
    Plug 'lervag/vimtex'

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'sillybun/zyt-snippet'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'ahmedkhalf/project.nvim'
    " Plug 'puremourning/vimspector'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'easymotion/vim-easymotion'
    Plug 'justinmk/vim-sneak'
    Plug 'unblevable/quick-scope'

    Plug 'michaelb/sniprun', {'do': 'sh install.sh'}

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
call plug#end()

" ==== Plug Settings ==================
" colorscheme
colorscheme gruvbox

" vim-sneak
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T','s',"S"]

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1        "显示buffer编号
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#battery#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_theme="raven"

" neoscroll
lua require('neoscroll').setup()

let g:rainbow_active = 1

autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'image'
let g:mdip_imgname = 'image'


" vim-markdown
let g:vim_markdown_math = 1

" vim-auto-save
let g:auto_save = 1
nmap <Leader>s :AutoSaveToggle<CR>

" vim-clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

"==== end Plug Settings ==================

" ==== load vim files ==================

for f in globpath('~/.config/nvim/configs/', '*.vim', 0, 1, 0)
    execute 'source' f
endfor

for l in globpath('~/.config/nvim/configs/', '*.lua', 0, 1, 0)
    execute 'source' l
endfor

" ==== end load vim files ==================

" ==== Plugin Mappings ==================

" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T

" ==== end Plugin Mappings ==================
