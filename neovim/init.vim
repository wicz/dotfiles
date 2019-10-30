set clipboard=unnamed " macos clipboard sharing
set expandtab " soft tabs
set tabstop=2 " two-space indentation
set shiftwidth=2
set softtabstop=2
set splitbelow " natural split order
set splitright
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
set number " show line numbers
set textwidth=80 " wrap at 80
set colorcolumn=+1 " show vertical guide at (textwidth + 1)
set scrolloff=10 " number of lines around cursor
set smartindent
set cursorline " highlight current line
set conceallevel=2
set tags+=.tags
set noswapfile
set termguicolors
set foldmethod=indent
set foldlevelstart=99 " all folds open by default
set nojoinspaces " use one space after punctuation

let g:python3_host_prog='/usr/local/bin/python3'

call plug#begin()
Plug 'carlitux/deoplete-ternjs'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'dense-analysis/ale'
Plug 'elzr/vim-json'
Plug 'evanleck/vim-svelte'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lambdalisue/vim-gista'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mattn/emmet-vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'shougo/context_filetype.vim'
Plug 'shougo/denite.nvim'
Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
call plug#end()

colorscheme base16-material-darker

" disable q:
nnoremap q: <nop>

" command aliases
command! Q :q
command! Qa :qa

" auto-pairs
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0

" context_filetype
let g:context_filetype#filetypes = {}
let g:context_filetype#filetypes.svelte =
  \ [
  \    {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
  \    {'filetype' : 'css', 'start' : '<style>', 'end' : '</style>'},
  \ ]

" vim-gutentags
let g:gutentags_ctags_tagfile = '.tags'

" nvim-colorizer
lua require 'colorizer'.setup({
  \ 'css';
  \ 'html';
  \ 'javascript';
  \ })

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-terraform
let g:terraform_fmt_on_save = 1

" ale

let g:ale_linter_aliases = {
  \ 'svelte': ['css', 'javascript'],
  \ 'gitcommit': ['markdown'],
  \ }
let g:ale_linters = {
  \ 'markdown': ['vale'],
  \ 'ruby': ['rubocop', 'solargraph'],
  \ 'javascript': ['eslint'],
  \ 'svelte': ['eslint', 'stylelint']
  \}
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#tabs_label = ''
highlight ALEWarning gui=italic guifg=#ffe135

" vim-tmux-runner
let g:VtrPercentage = 40

" vim-test
let test#strategy = "vtr"
nnoremap <Leader>ts :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>tl :TestLast<CR>

" vim-markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 0
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" vim-slim
autocmd BufRead,BufNewFile *.slim setlocal formatoptions-=t formatoptions+=l

" emmet-vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_install_global = 0
autocmd FileType html,css,svelte EmmetInstall

" deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
  \ 'smart_case': v:true,
  \ 'num_processes': 2,
  \ })

" call deoplete#custom#option('sources', {
"   \ 'ruby': ['ale'],
"   \ })

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_splits = 0

" vim-gista
let g:gista#client#default_username = 'wicz'
let g:gista#command#post#default_public = 0

" denite.vim
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select')
endfunction

call denite#custom#option(
  \ '_',
  \ 'highlight_matched_range',
  \ 'None'
  \)

call denite#custom#option(
  \ '_',
  \ 'highlight_matched_char',
  \ 'None'
  \)

call denite#custom#option(
  \ '_',
  \ 'split',
  \ 'floating'
  \)

call denite#custom#var(
  \ 'file/rec',
  \ 'command',
  \ ['rg', '--files', '--glob', '!.git']
  \)

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Disable deoplete within denite window
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction

nnoremap <Leader>p :Denite file/rec<CR>
nnoremap <Leader>b :Denite buffer<CR>
nnoremap <Leader>f :Denite -no-empty grep<CR>

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

" vim-fugitive
set previewheight=20
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gread<CR>:w<CR>

" strip whitespace on save for non-md
fun! StripWhitespace()
  if &ft =~ 'markdown'
    return
  endif

  %s/\s\+$//e
endfun
autocmd BufWritePre * :call StripWhitespace()

" set spell by filetype
autocmd FileType markdown,gitcommit setlocal spell spelllang=en
highlight SpellBad gui=italic guifg=#ff4444
highlight SpellCap gui=italic

" format whole file, keep current position
nnoremap <Leader>= mzgg=G`z

" colors
highlight Comment guifg=#ABCDEF
