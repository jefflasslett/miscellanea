UnBundle    'ack'
UnBundle    'spf13/PIV'
UnBundle    'arnaud-1b/vim-php-namespace'
UnBundle    'klen/python-mode'
UnBundle    'python.vim'
UnBundle    'python_match.vim'
UnBundle    'pythoncomplete'
UnBundle    'derekwyatt/vim-scala'
UnBundle    'derekwyatt/vim-sbt'
UnBundle    'beyondwords/vim-twig'
UnBundle    'airblade/vim-gitgutter'

set nocompatible
set autoindent
set smartindent
set nowrap
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
" "set clipboard=

let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

let g:spf13_no_autochdir = 1

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

let os = substitute(system('uname'), "\n", "", "")
if os =~ "Linux"
  " Do Linux-specific stuff.
  set guifont=Inconsolata\ 14
else
  set guifont=Inconsolata:h18
endif

set number
set shell=/bin/sh"

colorscheme coding_goodness
