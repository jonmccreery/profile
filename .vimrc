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
