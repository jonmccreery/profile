" autoload plugins
execute pathogen#infect()

filetype plugin indent on
if has("mouse")
  set mouse=a
endif

" aesthetics matters
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
set background=dark
colorscheme paintbox

" don't clutter things up
set nobackup
set noswapfile

set tags=./tags;
set iskeyword+=:

" json support
au BufRead,BufNewFile *.json set filetype=json
let g:syntastic_json_checkers=['jsonval']

" puppet support
au FileType puppet autocmd BufWritePre <buffer> :%s/\s\+$//e
au FileType puppet setl autoindent tabstop=2 expandtab shiftwidth=2 softtabstop=2 colorcolumn=81

" fire up NERDTree if there's no file given on the command line
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeDirArrows=0

nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
