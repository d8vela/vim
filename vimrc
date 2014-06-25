
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
nnoremap <silent> <Leader>r ml:execute 'match Search /\%'.line('.').'l/'<CR>
nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_jump=1
let g:syntastic_loc_list_height=5
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting=1
let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_id_checkers=1
let g:syntastic_error_symbol="E>"
let g:syntastic_warning_symbol="W>"
let g:syntastic_perl_checkers=['perl']
"let g:syntastic_perl_lib_path=['/work/davela/perl5/lib/perl5']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_python_checkers=['python', 'pyflakes']
"let g:syntastic_javascript_checkers = ['jslint']
"let g:syntastic_html_checkers = ['w3']
"let g:syntastic_json_checkers = ['jsonlint']
"let g:syntastic_xml_checkers = ['xmllint']

