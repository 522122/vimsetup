execute pathogen#infect()
" theme
colorscheme paramount

filetype plugin indent on

let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set hlsearch
set cursorline
set wildmenu
syntax on
set number
set sw=2
set ts=2
set sts=2
set et     "expand tabs to spaces

nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
"navigating tabs
nnoremap <C-Left>	  :tabprevious<CR>
nnoremap <C-Right>	:tabnext<CR>
nnoremap <C-t>	  	:tabnew<CR>
"nnoremap <C-q> :q<CR>

nnoremap <C-p> 		  :Files<CR>
" move lines
nnoremap <C-k> 	  :m-2<CR>
nnoremap <C-j> 	:m+<CR>

nnoremap <C-y> :y *<CR>

let g:user_emmet_leader_key=','

command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Eslint :CocCommand eslint.executeAutofix
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

