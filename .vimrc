set ai si et ts=4 sw=4 sta sm nu rnu
inoremap {<CR> {<CR>}<Esc>O
inoremap <NL> <ESC>o
nnoremap <NL> o
syntax on
highlight Normal ctermbg=NONE "No background
highlight nonText ctermbg=NONE
hi Normal ctermbg=none
highlight NonText ctermbg=none
au BufNewFile *.cpp 0r /home/gafeol/competitive-programming/Header.cpp
au BUfNewFile *.kt 0r ~/competitive-programming/Header.kt
set mouse=a
