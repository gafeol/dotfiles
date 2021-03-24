set ai si et ts=4 sw=4 sta sm nu rnu
""" plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'udalov/kotlin-vim'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Fuzzy file finder on a neovim pop-up window
Plug 'liuchengxu/vim-clap'
" JS, Typescript, JSX, TSX, Styled components, GraphQL
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'


call plug#end()

""" Looks

" highlight current line
set cursorline
highlight Cursorline cterm=bold

" show buffers on top
let g:airline#extensions#tabline#enabled=1

" theme
set t_Co=256
colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors=256
autocmd VimEnter * hi Normal ctermbg=none

""" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

""" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

""" coc.nvim config
set hidden
set updatetime=600
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type_definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> U :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:go_def_mapping_enabled = 0

""" nerdtree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

""" Headers

au BufNewFile *.cpp 0r /home/gafeol/competitive-programming/Header.cpp
au BUfNewFile *.kt 0r ~/competitive-programming/Header.kt

""" Corretor de Ortografia
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=pt
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=pt
let spell_auto_type="tex,doc,mail"
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

""" Auto make current file

map <A-c> :make %:r<CR>
