set hlsearch
set wrap!
let g:gruvbox_italic=1
set termguicolors
syntax on
set number
set splitright
set splitbelow

" Press Space to turn off highlighting and clear any message already
" displayed.
" TODO fix this
" :nnoremap <silent> <C-A-Space> :nohlsearch<Bar>:echo<CR>


" remap meta to escape key
imap <Super> <Esc>

set nocompatible              " required
filetype off                  " required

" Search visually selected text wtih //.
" Overwrites clipboard.
vnoremap // y/<C-R>"<CR>

" set the runtime path to include Vundle and initialize

" Either comment (and write in init file) or modify the following line
" for neovim
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" NerdTree
Plugin 'scrooloose/nerdtree'

" Colour Schemes
Plugin 'flazz/vim-colorschemes'

" Set Colors plugin
Plugin 'felixhummel/setcolors.vim'

" Install SimplyFold
Plugin 'tmhedberg/SimpylFold'

" Python indent
Plugin 'vim-scripts/indentpython.vim'

" Auto complete
" Install dependencies after installing using vundle
" https://github.com/Valloric/YouCompleteMe
" Plugin 'Valloric/YouCompleteMe'

" File finder
" Plugin 'ctrlpvim/ctrlp.vim'
" Install fzf - apt install fzf / brew install fzf
" Map fzf oto Ctrl P
Plugin 'junegunn/fzf'
nmap <C-P> :FZF<CR>

" GitGutter - Show diffs in gutter
Plugin 'airblade/vim-gitgutter'

" BufExplorer - Buffer management
Plugin 'jlanzarotta/bufexplorer'

" Bracket management
Plugin 'tpope/vim-surround'

" Show indent guide
Plugin 'nathanaelkane/vim-indent-guides'

" Vim misc (required for automatic tag generation)
Plugin 'xolox/vim-misc'

" Automatic tag generation
Plugin 'xolox/vim-easytags'

" Display current class/function - TagBar
" Plugin 'majutsushi/tagbar'

" Nerd Commenter
" Plugin 'scrooloose/nerdcommenter'

" ...

" Swagger
Plugin 'xavierchow/vim-swagger-preview'

" JS Beautify
Plugin 'maksimr/vim-jsbeautify'

" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'

"Gruvbox
Plugin 'morhetz/gruvbox'
" autocmd vimenter * ++nested colorscheme gruvbox

Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
autocmd vimenter * ++nested colorscheme gruvbox


" Enable indent guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 1

" let g:ackprg 'ag --nogroup --nocolor --nocolumn'
let g:ackprg = 'ag --vimgrep'

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za


" Docstrings for folded code
" let g:SimpylFold_docstring_preview=1

" Python indentation
au BufNewFile,BufRead *.py,*.js,*.html
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Highlight trailing whitespaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Error /\s\+$/
" Remove trailing whitespace
command Delwhite :%s/\s\+$//e

" Toggle tag bar
nmap <F8> :TagbarToggle<CR>


function! NextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! 1G
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction

nmap <silent> }c :call NextHunkAllBuffers()<CR>
nmap <silent> {c :call PrevHunkAllBuffers()<CR>


" Custom command for pdb
let @p = '^i€kuimport pdb; pdb.set_trace()'

" UTF-8 support
set encoding=utf-8

" Default color scheme
" colorscheme tropikos
colorscheme desert
colorscheme gruvbox
" colorscheme slate

" Use system clipboard for yanking

:nnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:nnoremap <expr> yy (v:register ==# '"' ? '"+' : '') . 'yy'
:nnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'
:xnoremap <expr> y (v:register ==# '"' ? '"+' : '') . 'y'
:xnoremap <expr> Y (v:register ==# '"' ? '"+' : '') . 'Y'

:nnoremap <expr> p (v:register ==# '"' ? '"+' : '') . 'p'
:nnoremap <expr> pp (v:register ==# '"' ? '"+' : '') . 'pp'
:nnoremap <expr> P (v:register ==# '"' ? '"+' : '') . 'P'
:xnoremap <expr> p (v:register ==# '"' ? '"+' : '') . 'p'
:xnoremap <expr> P (v:register ==# '"' ? '"+' : '') . 'P'

:nnoremap <expr> x (v:register ==# '"' ? '"+' : '') . 'd'
:nnoremap <expr> xx (v:register ==# '"' ? '"+' : '') . 'xx'
:nnoremap <expr> X (v:register ==# '"' ? '"+' : '') . 'X'
:xnoremap <expr> x (v:register ==# '"' ? '"+' : '') . 'x'
:xnoremap <expr> X (v:register ==# '"' ? '"+' : '') . 'X'


" Searching within visual selection - Alt + /
:vnoremap <M-/> <Esc>/\%V
