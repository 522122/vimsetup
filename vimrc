execute pathogen#infect()
" theme
colorscheme codedark
set termguicolors


filetype plugin indent on

let g:airline_theme='codedark'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set enc=utf-8
set guifont=Lucida_Console:h10:cANSI
set guifontwide=Lucida_Console:h12

set hlsearch
set cursorline
set wildmenu
set incsearch
set cmdheight=2
syntax on
set number
set sw=2
set ts=2
set sts=2
set et     "expand tabs to spaces
set backspace=indent,eol,start

nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"navigating tabs
nnoremap <C-Left>	  :bprevious<CR>
nnoremap <C-Right>	:bnextt<CR>
nnoremap <C-t>	  	:tabnew<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bd<CR>

nnoremap <C-p> :Files<CR>
" move lines
nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>

nnoremap <C-y> :y *<CR>

let g:user_emmet_leader_key=','

"run for css files
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"usually runs automatically for js files
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

