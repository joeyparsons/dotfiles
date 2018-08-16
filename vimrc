call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fatih/molokai'
Plug 'Shougo/neocomplete.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'alpaca-tc/beautify.vim'
Plug 'ballerinalang/plugin-vim'
Plug 'vim-airline/vim-airline'
Plug 'ekalinin/Dockerfile.vim'
call plug#end()

let g:neocomplete#enable_at_startup = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:terraform_align = 1

" color scheme
" trying some onehalfdark for a bit instead of molokai
set t_Co=256
set cursorline
colorscheme onehalfdark
set bg=dark
let g:rehash256 = 1
let g:airline_theme='onehalfdark'

" colorscheme molokai
" let g:molokai_original = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set nowrap

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

nmap <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>
