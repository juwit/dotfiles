set nocompatible                             " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on                    " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256                                 " enable 256-color mode.
syntax enable                                " enable syntax highlighting (previously syntax on).
set number                                   " show line numbers
set laststatus=2                             " last window always has a statusline
filetype indent on                           " activates indenting for files
set ignorecase                               " Make searches case-insensitive.
set ruler                                    " Always show info along bottom.
set autoindent                               " auto-indent
set tabstop=4                                " tab spacing
set softtabstop=4                            " unify
set shiftwidth=4                             " indent/outdent by 4 columns
set shiftround                               " always indent/outdent to the nearest tabstop
set expandtab                                " use spaces instead of tabs
set nowrap                                   " don't wrap text
highlight LineNr ctermfg=black ctermbg=white " use white background for line numbers
