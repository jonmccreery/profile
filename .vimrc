" autoload plugins
execute pathogen#infect()

filetype plugin indent on
if has("mouse")
  set mouse=a
endif

" aesthetics matters
set expandtab
syntax on
set background=dark
colorscheme solarized

" don't clutter things up
set nobackup
set noswapfile

set tags=./tags;
set iskeyword+=:

au BufRead,BufNewFile *.json set filetype=json

au FileType puppet autocmd BufWritePre <buffer> :%s/\s\+$//e
au FileType puppet setl autoindent tabstop=2 expandtab shiftwidth=2 softtabstop=2 colorcolumn=81

let g:syntastic_json_checkers=['jsonval']
