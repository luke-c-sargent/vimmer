" somewhat based on: https://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html
" basics
set nocompatible
syntax on
set nowrap
set encoding=utf8


" get vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" begin plugin enumeration
call plug#begin('~/.vim/plugged')

" plugins:
"    util
Plug 'chr4/nginx.vim'
Plug 'scrooloose/nerdtree' " filesystem view
Plug 'majutsushi/tagbar'   " scope-ordered tags
Plug 'ervandew/supertab'   " tab completion
Plug 'SirVer/ultisnips'    " snippets!

"    programming support
Plug 'honza/vim-snippets'
" Plugin 'Townk/vim-autoclose' <- dunno about this one
" Plugin 'vim-syntastic/syntastic' <-- cool but maybe not yet
" maybe get fugitive too for git, cause its cool

" prettification
Plug 'ryanoasis/vim-devicons'

" init vim-plug
call plug#end()

" Enable Elite mode, No ARROW KEYS
" let g:elite_mode=1 <- i am not ready for this
set cursorline
set t_Co=256
set background=dark
if (has("termguicolors"))
  set termguicolors
endif

" Vim-Supertab Configuration
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" UtilSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" MAPPINGS
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
