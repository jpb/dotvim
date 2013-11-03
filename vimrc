execute pathogen#infect()

" Colorscheme
syntax on 
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
colorscheme solarized 

" Indenting
filetype plugin indent on

" NERDTree
"  Open NERDTree
nmap <Leader>n :NERDTreeToggle<CR>
"  Open NERDTree if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
"  Close NERDTree if it is the only window left in vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
