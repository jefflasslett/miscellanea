set nocompatible
set autoindent
set smartindent
set nowrap
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

let os = substitute(system('uname'), "\n", "", "")
if os =~ "Linux"
  " Do Linux-specific stuff.
  set guifont=Inconsolata\ 14
else
  set guifont=inconsolata:h18
endif

set number
set shell=/bin/sh

syntax on

colorscheme mycolours

