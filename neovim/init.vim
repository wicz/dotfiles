runtime! 'plugin/sensible.vim'

set clipboard=unnamed " macos clipboard sharing
set colorcolumn=+1    " show vertical guide at (textwidth + 1)
set conceallevel=0
set cursorline        " highlight current line
set expandtab         " soft tabs
set foldlevelstart=99 " all folds open by default
set foldmethod=indent
set hidden
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→
set nobackup
set nocompatible
set nojoinspaces      " use one space after punctuation
set noswapfile
set number            " show line numbers
set pumheight=10
set scrolloff=10      " number of lines around cursor
set shiftwidth=2
set shortmess+=c
set smartindent
set softtabstop=2
set splitbelow        " natural split order
set splitright
set tabstop=2         " two-space indentation
set tags+=.tags
set termguicolors
set textwidth=80      " wrap at 80
set lazyredraw
syntax on

let g:python3_host_prog='/usr/local/bin/python3'

call plug#begin()
Plug 'cohama/lexima.vim'
Plug 'dense-analysis/ale'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'mail'] }
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim', { 'for': ['html', 'svelte', 'eruby'] }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'shougo/context_filetype.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme dracula

" ale
let g:ale_linter_aliases = {
  \ 'svelte': ['css', 'javascript'],
  \ 'gitcommit': ['markdown'],
  \ }
let g:ale_linters = {
  \ 'markdown': ['vale'],
  \ 'javascript': ['eslint'],
  \ 'svelte': ['eslint', 'stylelint']
  \}
let g:ale_completion_enabled = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 'on_save'

" vim-fugitive
set previewheight=20
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gread<CR>:w<CR>

" vim-gutentags
let g:gutentags_ctags_tagfile = '.tags'

" emmet-vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_install_global = 0
autocmd FileType html,css,svelte,eruby EmmetInstall

" disable q:
nnoremap q: <nop>

" deoplete
let g:deoplete#enable_at_startup = 1

" goyo
function! s:goyo_enter()
  set textwidth=0
endfunction

function! s:goyo_leave()
  set textwidth=80
endfunction

autocmd FileType mail Goyo
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-projectionist
let g:projectionist_heuristics = {
  \ "Gemfile|package.json": {
  \   "*": { "path": ["app", "lib"] }
  \ }
  \ }

" vim-test
let test#strategy = "dispatch"
nnoremap <Leader>ts :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>tl :TestLast<CR>

" vim-dispatch
let g:dispatch_quickfix_height = 20
let g:dispatch_no_maps = 1

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#scrollbar#enabled = 0

" fzf.vim
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.5 } }

imap <c-x><c-f> <plug>(fzf-complete-path)

nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Rg<Space>

" context_filetype
let g:context_filetype#filetypes = {}
let g:context_filetype#filetypes.svelte =
  \ [
  \    {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
  \    {'filetype' : 'css', 'start' : '<style>', 'end' : '</style>'},
  \ ]

" tabs
nnoremap <Leader>tn :$tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>t[ :tabprevious<CR>
nnoremap <Leader>t] :tabnext<CR>
nnoremap <Leader>1 :1tabnext<CR>
nnoremap <Leader>2 :2tabnext<CR>
nnoremap <Leader>3 :3tabnext<CR>
nnoremap <Leader>4 :4tabnext<CR>
nnoremap <Leader>5 :5tabnext<CR>

" cycling between splits
nnoremap <Leader>] <C-w>w
nnoremap <Leader>[ <C-w>W

" toggle search highlight
nnoremap <Leader>h :set hlsearch!<CR>

" back to previous buffer
nnoremap <Leader>\ :b#<CR>

" set spell by filetype
autocmd FileType markdown,gitcommit,mail setlocal spell spelllang=en,es
highlight SpellBad gui=italic guifg=#ff4444
highlight SpellCap gui=italic

" format whole file, keep current position
nnoremap <Leader>= mzgg=G`z

" C-c to Esc
inoremap <C-c> <Esc>

" colors
highlight Comment guifg=#ABCDEF gui=italic
highlight Visual  guifg=#FFFFFF guibg=#4B0082

" strip whitespace on save for non-md
fun! StripWhitespace()
  if &ft =~ 'markdown'
    return
  endif

  %s/\s\+$//e
endfun
autocmd BufWritePre * :call StripWhitespace()
