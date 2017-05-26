call plug#begin('~/.vim/plugged')

" Our lord and savior
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'othree/html5.vim'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kien/ctrlp.vim'
Plug 'Jelera/vim-javascript-syntax'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ap/vim-css-color'
Plug 'neomake/neomake'
Plug 'rking/ag.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'Raimondi/delimitMate'
" Plug 'editorconfig/editorconfig-vim'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/tabular'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

call plug#end()

set nowrap
set number
set foldmethod=indent
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set laststatus=1

set background=dark
colorscheme base16-unikitty-dark
let g:airline_theme='base16'

" ctrlp options
let g:ctrlp_working_path_mode = 0
set wildignore+=*/build/**
set wildignore+=*/tmp/**
set wildignore+=*/dist/**
set wildignore+=*/bower_components/**
set wildignore+=*/node_modules/**
set wildignore+=*/docs/**
set wildignore+=*/staticfiles/**
set wildignore+=*.pyc

" .swp and backup file locations
set directory=~/.vim-tmp
set backupdir=~/.vim-tmp

" vim-airline options
let g:airline_section_error=''

autocmd Filetype javascript setlocal ts=2
let g:javascript_ignore_javaScriptdoc = 1

" Syntastic options
let g:syntastic_javascript_checkers = ['eslint']

" Neomake options
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_verbose = 0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_tex_enabled_makers = []
let g:neomake_markdown_enabled_makers = []

" VimTex options
let g:vimtex_latexmk_options = '-pdf -shell-escape'
let g:vimtex_indent_enabled = 0
let g:vimtex_index_show_help = 0
let g:vimtex_toc_show_numbers = 0
let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_method="zathura"

" Workaround to enable clientserver support (for the vimtex quickfix window).
" This requires the `neovim-remote` package from PyPi.
let g:vimtex_latexmk_progname = 'nvr'  

let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#omni#input_patterns.tex = '\\(?:'
  \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
  \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
  \ . '|hyperref\s*\[[^]]*'
  \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
  \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
  \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
  \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
  \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
  \ .')'

" vim-pencil options
let g:pencil#textwidth = 79
let g:pencil#conceallevel = 0

" For using neovim pip package in virtualenvs
let g:python_host_prog = '/usr/local/bin/python'

" vim-go options
au FileType go nmap <leader>gt <Plug>(go-test)

" Exit NeoVim terminal mode with esc key
tnoremap <Esc> <C-\><C-n>

" I just want to be a wizard
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-i> :call Incr()<CR>

nnoremap <leader>t :terminal<CR>
nnoremap <leader>c :ClearAllCtrlPCaches<CR>
nnoremap <leader>n :noh<CR>
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <leader>w :SoftPencil<CR>:Goyo<CR>
nnoremap <leader>lw :VimtexCompile<CR>:SoftPencil<CR>
vnoremap <C-a> :Tab /&<CR> :Tab /\\\\<CR>