syntax on
filetype plugin indent on
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
set clipboard=unnamed
set nosplitbelow
set splitright

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

let mapleader = " "

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-dictionary',
  \ 'coc-eslint',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-jest',
  \ 'coc-json',
  \ 'coc-lit-html',
  \ 'coc-marketplace',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-sh',
  \ 'coc-snippets',
  \ 'coc-spell-checker',
  \ 'coc-svelte',
  \ 'coc-svg',
  \ 'coc-terminal',
  \ 'coc-tsserver',
  \ 'coc-vetur',
  \ 'coc-webpack',
  \ 'coc-xml',
  \ 'coc-yaml',
  \ 'coc-yank'
  \ ]

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" - Avoid using standard Vim directory names like 'plugin'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }
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
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'wincent/scalpel'
Plug 'tpope/vim-commentary'
Plug 'lifepillar/vim-cheat40'
Plug 'wellle/targets.vim'

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

" fzf and grep and CoC
let FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.85 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Cheat40 default sheet is off
let g:cheat40_use_default = 0

" Remaps
inoremap <C-c> <esc>
inoremap jk <esc>
noremap <end> <esc>
" Tab completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> <leader> :WhichKey '<SPACE>'<CR>
nnoremap <leader>? :Cheat40<CR>
nnoremap <leader>hw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>cr :CocRestart<CR>
nnoremap <leader>cc :CocCommand<CR>
nnoremap <leader>cl :CocList<CR>

" Code actions so 'aw' spellcheck works
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>H :vertical resize -10<CR>
nnoremap <Leader>J :resize -10<CR>
nnoremap <Leader>K :resize +10<CR>
nnoremap <Leader>L :vertical resize +10<CR>
nnoremap <Leader>= <C-w>=
nnoremap <Leader>w <C-w>c
nnoremap <silent> <Leader>n <C-w>v
nnoremap <silent> <Leader>nh <C-w>n
nnoremap <leader>o :only<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '<+1<CR>gv-gv

" FZF
nnoremap <leader>ff :GFiles<CR>
nnoremap <Leader>fd :Files<CR>
nnoremap <leader>fb :Buffers<CR>

" RG
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>rgw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Renaming
nmap <leader>rn <Plug>(coc-rename)

" clear search
nnoremap <leader>/ :BLines<CR>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)

" Sweet Sweet FuGITive
nmap <leader>gs :G<CR>
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gbl :Git blame<CR>
nnoremap <leader>gc :Git checkout -b<SPACE>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gpp :Gpush -u origin HEAD<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gmm :Git merge master<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

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

augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

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

" .........................................
" Fern Directory Browser
" see: https://github.com/nickjj/dotfiles/commit/7dde08e7e2c44965999c4d416a803b8f19014ee1

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1
let g:fern#disable_viewer_hide_cursor = 1
let g:fern#default_hidden = 1
let g:fern#drawer_width = 35
let g:fern#renderer = "nerdfont"

noremap <silent> <Leader>- :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> * <Plug>(fern-action-mark:toggle)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

