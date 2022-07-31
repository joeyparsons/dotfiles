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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-fugitive'

call plug#end()

let g:neocomplete#enable_at_startup = 1


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

"au filetype go inoremap <buffer> . .<C-x><C-o>


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


" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

