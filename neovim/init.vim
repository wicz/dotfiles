set clipboard=unnamed " macos clipboard sharing
set expandtab " soft tabs
set tabstop=2 " two-space indentation
set shiftwidth=2
set softtabstop=2
set splitbelow " natural split order
set splitright

let g:python3_host_prog='/usr/local/bin/python3'

call plug#begin()
Plug 'lambdalisue/vim-gista'
Plug 'Shougo/denite.nvim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme base16-material-darker

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

nnoremap <Leader>p :Denite file/rec<CR>
nnoremap <Leader>b :Denite buffer<CR>

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
