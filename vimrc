execute pathogen#infect()

set nocompatible
set encoding=utf-8

" Colorscheme
syntax on
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
colorscheme solarized

" Indenting
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
filetype plugin indent on
set nowrap

set number
set ruler

" Searching
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR> " find merge conflict markers

" Double-tap Space to Clear Selection
nmap <SPACE><SPACE> :noh<CR>

" Tab to, well, tab
nmap <Tab> :><CR>
nmap <S-Tab> :<<CR>

" Map jj to esc for insert mode
imap jj <Esc>

" Autosave
autocmd BufLeave,FocusLost * silent! wall

" Highlight when past character limit
autocmd BufWinEnter * let w:m1=matchadd('Error', '\%>94v.\+', -1)

" Strip whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Switch between panes
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w><C-w>
nmap <C-k> <C-w>W

" Rezise pane
nmap <C-n> <C-w>>
nmap <C-m> <C-w><
nmap <C-S-n> <C-w>+
nmap <C-S-m> <C-w>-

" Copy across vim sessions
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" NERDTree
"  Open NERDTree
nmap <Leader>n :NERDTreeToggle<CR>
"  Open NERDTree if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

" Files
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

" gettext
let g:surround_{char2nr("_")} = "<?= _('\r') ?>"
