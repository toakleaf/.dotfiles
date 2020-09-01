syntax on
filetype plugin on
set cmdheight=2
set guicursor=
set nu rnu
set nowrap
set termguicolors
set cursorline
set scs
set updatetime=50
set noswapfile
set ignorecase
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set showmatch
set mps+=<:>
set mouse=a
set hidden
set confirm
set scrolloff=8
set nohlsearch
set autoread

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

let mapleader = " "

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" - Avoid using standard Vim directory names like 'plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align' " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-vinegar'

" Initialize plugin system
call plug#end()

" Theme stuff
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_italicize_strings = '1'
colorscheme gruvbox
set background=dark
highlight Comment cterm=italic gui=italic
highlight String cterm=italic gui=italic

let g:rainbow_active = 1

" fzf and grep and netrw and CoC
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Spellcheck setting
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remaps
inoremap <C-c> <esc>
inoremap jk <esc>
noremap <end> <esc>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" clear search
nnoremap <leader>/ :let @/=""<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>hcw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>csw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+1<CR>gv-gv
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" FZF
nnoremap <leader>ff :GFiles<CR>
nnoremap <Leader>fd :Files<CR>
nnoremap <leader>fg :Rg<SPACE>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gp :Gpush<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

fun! PrettierAutoformat()
    let l:conf = globpath(system("git rev-parse --show-toplevel")[:-2], ".prettierrc*")
    "let result = confirm(l:conf)
    if !empty(l:conf)
        call CocAction('runCommand', 'prettier.formatFile')
    endif
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

augroup prettier_it_up
    autocmd!
    autocmd BufWritePre *.{js,jsx,css,html,vue,md,scss,less,json,yaml,yml,mdx,ts,tsx} :call PrettierAutoformat()
augroup END
