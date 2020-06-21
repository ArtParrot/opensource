"ArtParrot
"My neovim config
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
"¦
set scrolloff=6
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set ttimeoutlen=100
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast
set lazyredraw
set visualbell
set updatetime=1000
set virtualedit=block
"set colorcolumn=
set undofile
set undodir=~/.config/nvim/undodir

let mapleader=" "
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" ===
" === Terminal Behaviors
" ===
"let g:terminal_color_0  = '#000000'
"let g:terminal_color_1  = '#FF5555'
"let g:terminal_color_2  = '#50FA7B'
"let g:terminal_color_3  = '#F1FA8C'
"let g:terminal_color_4  = '#BD93F9'
"let g:terminal_color_5  = '#FF79C6'
"let g:terminal_color_6  = '#8BE9FD'
"let g:terminal_color_7  = '#BFBFBF'
"let g:terminal_color_8  = '#4D4D4D'
"let g:terminal_color_9  = '#FF6E67'
"let g:terminal_color_10 = '#5AF78E'
"let g:terminal_color_11 = '#F4F99D'
"let g:terminal_color_12 = '#CAA9FA'
"let g:terminal_color_13 = '#FF92D0'
"let g:terminal_color_14 = '#9AEDFE'

map <LEADER>tt :e ~/.config/nvim/init.vim<CR>
map <LEADER>ala :e ~/.config/alacritty/alacritty.yml<CR>

noremap K 20k
noremap J 20j
noremap H 5h
noremap L 5l

noremap ; :
noremap s <nop>
noremap RR :w<CR>:source $MYVIMRC<CR>
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap <C-r><up> :res +5<CR>
noremap <C-r><down> :res -5<CR>
noremap <C-r><left> :vertical resize-5<CR>
noremap <C-r><right> :vertical resize+5<CR>
noremap tb :tabe<CR>
noremap to :-tabnext<CR>
noremap tp :+tabnext<CR>
noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>

inoremap <M-j> <Down>
inoremap <M-k> <Up>

inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>

inoremap <M-a> <ESC>A
inoremap <M-i> <ESC>I
inoremap <M-;> <nop>

inoremap <C-a> <CR><ESC>O
noremap <C-f> :FZF<CR>

map <F2> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!google-chrome-stable % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc

call plug#begin('~/.vim/plugged')

"Goyo
Plug 'junegunn/goyo.vim'

"Vim-snazzy
Plug 'connorholyday/vim-snazzy'

"AirLine
Plug 'vim-airline/vim-airline'

"Coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Space-vim
Plug 'liuchengxu/space-vim-theme'

" Undo Tree
Plug 'mbbill/undotree/'

"startify
Plug 'mhinz/vim-startify'

"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }

Plug 'lilydjwg/fcitx.vim'

"Dracula
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

"NERDTree-git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"Markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

"undotree
noremap Un :UndotreeToggle<CR>

"Coc
inoremap <expr> <ESC> pumvisible() ? "<ESC>a" : "\<ESC>"

let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-gitignore', 'coc-vimlsp',  'coc-tslint', 'coc-lists', 'coc-git', 'coc-explorer', 'coc-pyright', 'coc-sourcekit', 'coc-translator', 'coc-flutter']

"Goyo
noremap <LEADER>go :Goyo<CR>

colorscheme dracula
