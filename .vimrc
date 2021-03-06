execute pathogen#infect()

syntax enable               " enable syntax highlighting
"set background=light       " set background color
set background=dark         " set background color
colorscheme solarized       " user solarized colorscheme
set cursorline              " highlight current line
set cursorcolumn              " highlight current columnn

filetype on
filetype indent on          " use filetype plugin for indent

" Search
set hlsearch	            " highlighting search
set incsearch	            " incremental search
set ignorecase	            " ignore case in searches

" tabs
set expandtab	            " Convert tabs to spaces
set tabstop=4	            " <TAB> four spaces
set shiftwidth=4            " for autoindent
set softtabstop=4           " for backspacing

" indent and parentheses
"set noautoindent            " turn offfor smartindent
set textwidth=0	            " no max linewidth
set wrap    	            " don't wrap
set showmode	            " show matching parentheses

" numbering and rulers
set number  	            " show line numbers
set scrolljump=5            " jump 5 lines when running out of screen
set ruler	                " show col,rows

" fancy remappings
inoremap jk <Esc>
let mapleader = ","

" font
set guifont=Monaco:h14

" backups
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" remove trailing whitespace
autocmd FileType c,cpp,java,php,ruby,python,html,css autocmd BufWritePre <buffer> :%s/\s\+$//e

" window size
set lines=58 columns=121

" NERDTree
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>nc :NERDTreeClose<cr>
nmap <leader>nf :NERDTreeFind<cr>
let g:NERDTreeWinSize = 20
let NERDTreeShowHidden=1

