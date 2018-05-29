set clipboard=unnamed " macos clipboard sharing
set expandtab " soft tabs
set tabstop=2 " two-space indentation
set shiftwidth=2
set softtabstop=2
set splitbelow " natural split order
set splitright
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
set number " show line numbers
set colorcolumn=80 " show vertical guide at 80
set scrolloff=10 " number of lines around cursor
set smartindent
set cursorline " highlight current line
set conceallevel=2
set tags+=.tags
set noswapfile
set termguicolors

let g:python3_host_prog='/usr/local/bin/python3'

call plug#begin()
Plug 'ap/vim-css-color'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'elmcast/elm-vim'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'lambdalisue/vim-gista'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'shougo/denite.nvim'
Plug 'shougo/deoplete.nvim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
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

" vim-tmux-runner
let g:VtrPercentage = 40

" vim-test
let test#strategy = "vtr"
nnoremap <Leader>ts :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>tl :TestLast<CR>

" vim-markdown
let g:vim_markdown_frontmatter = 1

" emmet-vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_install_global = 0
autocmd FileType html,css,markdown EmmetInstall

" deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
  \ 'smart_case': v:true,
  \ 'num_processes': 2,
  \ })

call deoplete#custom#option('sources', {
  \ '_': ['buffer', 'omni', 'tag'],
  \})

" vim-jsx
let g:jsx_ext_required = 0

" vim-airline
let g:airline_powerline_fonts = 1

" vim-gista
let g:gista#client#default_username = 'wicz'
let g:gista#command#post#default_public = 0

" denite.vim
call denite#custom#map(
  \ 'insert',
  \ '<Down>',
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)

call denite#custom#map(
  \ 'insert',
  \ '<Up>',
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)

call denite#custom#var(
  \ 'file/rec',
  \ 'command',
  \ ['rg', '--files', '--glob', '!.git']
  \)

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

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <Leader>p :Denite file/rec<CR>
nnoremap <Leader>b :Denite buffer<CR>
nnoremap <Leader>f :Denite -no-empty grep<CR>

" tabs
nnoremap <Leader>tn :$tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>1 :1tabnext<CR>
nnoremap <Leader>2 :2tabnext<CR>
nnoremap <Leader>3 :3tabnext<CR>
nnoremap <Leader>4 :4tabnext<CR>

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
