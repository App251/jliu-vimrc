""""""""""""""""""""""""""""""""""""""
"    Normal Settings
""""""""""""""""""""""""""""""""""""""
set bs=indent,start,eol
set ts=4
set sw=4
set nu
set expandtab
set hlsearch
set noai
let mapleader=","
set clipboard+=unnamed

" Encoding
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8

" Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

au BufRead,BufNewFile *.robot setfiletype robot
au BufRead,BufNewFile *.suite setfiletype vsuite
""""""""""""""""""""""""""""""""""""""
"    Vundle Settings
""""""""""""""""""""""""""""""""""""""
set nocompatible              " required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'powerline/fonts'
Plugin 'dkprice/vim-easygrep'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/eclim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Key Mapping
nmap PS :PluginSearch
nmap PI :PluginInstall
nmap PL :PluginList<CR>
nmap PC :PluginClean<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

""""""""""""""""""""""""""""""""""""""
"    Plugins Settings
""""""""""""""""""""""""""""""""""""""
" Settings for YCM
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
let g:ycm_autoclose_preview_window_after_completion = 1

" Settings for nerdtree
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Settings for Tagbar
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width=35
let g:tagbar_autofocus=1

" Settings for AirLine
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
let g:airline_powerline_fonts = 1
set background=dark
let g:airline_theme='molokai'
syntax on
syntax enable

" Settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "level": "warnings"  }
nmap <leader>sr :SyntasticReset<CR>
nmap <leader>sc :SyntasticCheck<CR>

" Settings for CtrlP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" Settings for NerdCommenter
let g:NERDCustomDelimiters = {
    \ 'robot': { 'left': '# ' },
    \ 'vsuite': { 'left': '# ' }
\ }

