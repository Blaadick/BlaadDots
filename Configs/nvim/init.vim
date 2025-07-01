set number
set tabstop=4
set softtabstop=4
set shiftwidth=4

call plug#begin()
    Plug 'prabirshrestha/vim-lsp'
    Plug 'Shougo/deoplete.nvim'
    Plug 'lighttiger2505/deoplete-vim-lsp'
 
    Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/yanil'
 Plug 'ryanoasis/vim-devicons'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

autocmd VimEnter * NERDTree | wincmd p
