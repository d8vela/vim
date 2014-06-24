
set number
set nocp
set backspace=indent,eol,start
syntax on
set hlsearch
set cindent

" VIM Mouse Support
set mouse=a
set ttymouse=xterm2

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows=0

" SolarizeDTreeDirArrows=0
if has("gui_running")
	set guioptions=egmrt
	set transparency=3
	set guifont=Monaco:h12
endif

syntax on
set background=dark
	let g:solarized_termtrans=1
	let g:solarized_termcolors=256
	let g:solarized_contrast = "high"
	let g:solarized_visibility = "high"
colorscheme solarized

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" SnipMate
execute pathogen#infect('bundle/{}', 'bundle/vim-snipmate/after/{}')

" Functions (Replace Selection with Incremental Numbers)
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" Set Cursor Line
set cursorline
