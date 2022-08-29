set nocompatible
set hlsearch
set nu
set enc=utf-8 fenc=utf-8
set autoindent smartindent
set ts=4 sw=4 sts=4
set background=dark

let g:python3_host_prog = '$HOME/.pyenv/shims/python'

"disable ESC

"VIM Visual Block
hi Visual ctermbg=255 guibg=#B2FFE0

filetype off
""" Plug start
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pearofducks/ansible-vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'hashivim/vim-terraform'
Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-docker', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-nginx', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-spell-checker', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'Valloric/YouCompleteMe'

call plug#end()

let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }
au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
filetype plugin indent on " Put your non-Plugin stuff after this line

let g:go_term_mode = "split"
let g:go_fmt_autosave = 0

"set completeopt-=preview

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype erb setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype crystal setlocal ts=2 sts=2 sw=2
"autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal foldmethod=syntax
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

let mapleader=","
let maplocalleader=","
"noremap <F3> :Autoformat<CR>
map <silent> <F10> :TagbarToggle<CR>

" NVIM Tree
nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <C-n> :NvimTreeFindFile<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Copy file path to clipboard
nnoremap <leader>cF :let @*=expand("%:p")<CR>
nnoremap <leader>ch :let @*=expand("%:p:h")<CR>

" Tab shortcut
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>

" NERDTree
nnoremap <C-W>. :vertical resize +5<CR>
nnoremap <C-W>, :vertical resize -5<CR>
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"Bundle 'Tagbar' 
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
let g:tagbar_type_crystal = {
    \'ctagstype': 'crystal',
    \'ctagsbin': 'crystalctags',
    \'kinds': [
        \'c:classes',
        \'m:modules',
        \'d:defs',
        \'x:macros',
        \'l:libs',
        \'s:sruct or unions',
        \'f:fun'
    \],
    \'sro': '.',
    \'kind2scope': {
        \'c': 'namespace',
        \'m': 'namespace',
        \'l': 'namespace',
        \'s': 'namespace'
    \},
\}
