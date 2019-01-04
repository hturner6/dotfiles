call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
call plug#end()

set nu "set line numbers
colorscheme onedark "set color scheme

"key mappings
map <C-n> :NERDTreeFocus<CR>  
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "map Ctrl-n to toggle NERDTree tab
"Move lines with Ctrl-j/k
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
"close opening brackets
"inoremap {      {}<Left>
inoremap {<CR>  {<CR><BS>}<Esc>O
"inoremap {{     {
"inoremap {}     {}
"inoremap (      ()<Left>
inoremap (<CR>  (<CR><BS>)<Esc>O
"inoremap ((     (
"inoremap ()     ()

"latex package
let g:livepreview_previwer = 'xdg-open'
autocmd Filetype tex setl updatetime=10

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'Blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('cc', 'Red', 'none', 'red', '#151515')

