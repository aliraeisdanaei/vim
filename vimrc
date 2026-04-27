set number
set relativenumber
syntax on
set clipboard=unnamedplus

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab             " Convert tabs to spaces (better for sharing code)

set termguicolors
set background=dark       " Optimize colors for dark terminal

" Better search behavior
set incsearch             " Highlight matches as you type
set hlsearch              " Highlight all matches
set ignorecase            " Case-insensitive search
set smartcase             " Case-sensitive if uppercase in search

" Navigation and UI improvements
set cursorline            " Highlight current line
set scrolloff=5           " Keep 5 lines visible when scrolling
set sidescroll=5          " Smooth horizontal scrolling

" Better indentation
filetype plugin indent on
set cindent
set cinoptions+=t0

" ===== SET LEADER KEY =====
let mapleader = " "       " Use spacebar as leader key
let maplocalleader = ","  " Use comma for local leader (in specific filetypes)

" Keymaps for column markers
nnoremap <Leader>c :set colorcolumn=80<cr>
nnoremap <Leader>n :set colorcolumn=-80<cr>

" Better split navigation (more intuitive)
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Resize splits easily
nnoremap <C-Left>  :vertical resize -2<cr>
nnoremap <C-Right> :vertical resize +2<cr>
nnoremap <C-Up>    :resize -2<cr>
nnoremap <C-Down>  :resize +2<cr>
nnoremap <Leader>f <C-w>\|<C-w>_    " Maximize current split
nnoremap <C-f> <C-w>\|<C-w>_    " Maximize current split
nnoremap <C-=> <C-w>=            " Equalize all splits
nnoremap <Leader>= <C-w>=        " Alternative equalize

" Auto-complete parentheses, brackets, and quotes
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" Smart closing bracket handling
inoremap ) <c-r>=strpart(getline('.'), col('.')-1, 1) == ')' ? "\<Del>" : ')'<cr>
inoremap ] <c-r>=strpart(getline('.'), col('.')-1, 1) == ']' ? "\<Del>" : ']'<cr>
inoremap } <c-r>=strpart(getline('.'), col('.')-1, 1) == '}' ? "\<Del>" : '}'<cr>

" Better command mode completion
set wildmode=longest,list,full
set wildmenu              " Show menu for tab completion

" Performance
set lazyredraw            " Don't redraw during macros
set ttyfast               " Faster terminal connection

" Don't show mode (lightline/airline shows it)
set noshowmode

" ===== CURSOR SHAPE =====
let &t_SI = "\e[6 q"      " Insert mode: thin blinking line
let &t_SR = "\e[4 q"      " Replace mode: blinking underscore
let &t_EI = "\e[2 q"      " Normal mode: blinking block

if has('nvim')
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
endif

" ===== RIPGREP CONFIGURATION =====
" ===== RIPGREP CONFIGURATION =====
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --glob=!tags
set grepformat=%f:%l:%c:%m

nnoremap <Leader>rg :grep<Space>
nnoremap <Leader>rw :grep<Space><C-r><C-w><cr>
nnoremap <Leader>rf :grep<Space>--type<Space>

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost *grep* copen
augroup END

let mapleader = " "

" ===== TOGGLE LINE NUMBERS =====
nnoremap <Leader>ln :set relativenumber! set number<cr>
nnoremap <Leader>rn :set relativenumber<cr>

" ===== CUSTOM LEADER KEYBINDINGS =====
nnoremap <Leader>w :w<cr>                    " Save file
nnoremap <Leader>q :q<cr>                    " Quit
nnoremap <Leader>x :wq<cr>                   " Save and quit
nnoremap <Leader>e :e<Space>
nnoremap <Leader>vs :vsplit<cr>              " Vertical split
nnoremap <Leader>hs :split<cr>               " Horizontal split
nnoremap <Leader>nt :tabnew<cr>              " New tab
nnoremap <Leader>tc :tabclose<cr>            " Close tab
nnoremap <Leader>to :tabo<cr>                " Close other tabs

" ===== CTAGS NAVIGATION =====
nnoremap <Leader>tt :!ctags -R<cr>           " Generate tags
nnoremap <C-]> <cmd>execute "tag " . expand("<cword>")<cr>  " Jump to definition
" nnoremap <C-[> <cmd>pop<cr>                  " Jump back
nnoremap <C-t> <cmd>pop<cr>                  " Jump back (standard vim key)
nnoremap <Leader>ts :tag<Space>              " Search for tag
nnoremap <Leader>tl :tags<cr>                " List tag stack
nnoremap <Leader>tn :tnext<cr>               " Next tag match
nnoremap <Leader>tp :tprev<cr>               " Previous tag match

" CTRL-S to save
map <C-s> :w <CR>
imap <C-s> <esc> :w <CR>

" Open vimrc
nnoremap <Leader>v :tabnew ~/.config/vim/vimrc<CR>
