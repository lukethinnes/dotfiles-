"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" Plugins. run the command :PlugInstall to set changes
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin(stdpath('data') . '/plugged')
Plug 'Shougo/neobundle.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'osyo-manga/vim-over'
Plug 'thinca/vim-qfreplace'
Plug 'kshenoy/vim-signature'
Plug 'editorconfig/editorconfig-vim'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'posva/vim-vue'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'sirVer/ultisnips'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'tsx'], 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim'  
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
call plug#end()

" General config
inoremap jj <ESC>
inoremap jk <ESC>
syntax enable
command E Ex " Disambiguates E
filetype plugin on
filetype indent on
set encoding=utf-8
set laststatus=2
set nocompatible
set nowrap
set ignorecase smartcase
set t_Co=256
set number
set tabstop=2
set expandtab
set autoindent smartindent
set softtabstop=2
set shiftwidth=2
set nobackup
set noswapfile
set noerrorbells
set spelllang=en_us
set hidden " Puts buffer in the background without writing
set lazyredraw " Don't update display during macros
set ttyfast " Send more characters at once
set history=999
set undolevels=999
set autoread
set title
set scrolloff=5
set sidescrolloff=7
set guicursor=       
set relativenumber
set wildmenu
set wildchar=<TAB>
set wildmode=full
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set diffopt=filler
set diffopt+=iwhite
set listchars=trail:·,nbsp:⚋
set fillchars=fold:-
set updatetime=100 " Keeps gitgutter speedy

" Leader
let mapleader=" "

" Typescript
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

" Go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
au FileType go nnoremap <leader>got :GoTest -short<cr>
au Filetype go nnoremap <leader>goa <Plug>(go-alternate-edit)
au FileType go nnoremap <leader>goc :GoCoverageToggle -short<cr>
au FileType go nnoremap <leader>god <Plug>(go-def)

" ALE
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_lint_on_save = 1
let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:airline#extensions#ale#enabled = 1
autocmd BufWritePost *.js ALEFix

" Ultisnips snippets 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/general/path/of/snippets/']

"Remapped snippets
nnoremap <leader>! ihb_t!
nnoremap <leader>rf! irf_c!


" Deoplete
let g:deoplete#enable_at_startup = 1
" let g:python_host_prog = '/full/path/to/neovim2/bin/python'
" let g:python3_host_prog = '/full/path/to/neovim3/bin/python'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim.ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Pencil
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 84
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md call pencil#init()
    autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

" Goyo
let g:goyo_width=90

"Onedark 
let g:onedark_hide_endofbuffer = 0
let g:onedark_termcolors=16
let g:onedark_terminal_italics = 1

" Airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Status line
set statusline+=%#warningmsg#
set statusline+=%*

" Colors
colorscheme onedark
set background=dark
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Ctrlp
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore = 'bin$\|build$\|node_modules$\|tmp$\|dist$\|.git|.bak|.swp|.pyc|.class'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_max_height = 18


" Find and replace
function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" Goyo
nnoremap <leader>m :Goyo<cr>

" Fugitive
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR> " Views status, use `-` and `p` to add/remove files
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gg :Gcommit -v -q %:p<CR> " Commits current file
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gm :Git merge<CR>

"TELESCOPE
nnoremap <leader>ft <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" >>MAXIMIZER FOR THE DEBUGGER
nnoremap <leader>, :MaximizerToggle!<CR>
"VIMSPECTOR DUBUGGER
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()><CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

nnoremap <leader>d? :call AddToWatch()<CR>
func! AddToWatch() 
  let word = expand("<cexpr>")
  call vimspector#AddToWatch(word)
endfunction

" TOGGLE THIS ON TO DEBUG SERVERS/OFF FOR LOCAL (MAKE  YOUR OWN VIM SPEC JSON)
" let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')

"BUFFER MANAGEMENT
nnoremap <Leader>ff :CtrlP<CR> " Find a file in the current folder recursively
nnoremap <Leader>x :bd<CR> " Delete current buffer
nnoremap <Leader>X :bd!<CR> " Delete current buffer
nnoremap <Leader>n :bn<CR> " Next buffer
nnoremap <Leader>N :bN<CR> " Previous buffer
nnoremap <Leader>t :enew<CR> " Make a new empty buffer
nnoremap <Tab> :b#<CR> " Tab between buffers

" Eslint
nnoremap <Leader>e :new<Bar>0r!npm run lint<CR> " Run eslint in vue

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Newline Generation
nmap <C-o> O<Esc>
nmap <CR> o<Esc>

nnoremap <Leader>. @: " Repeat last ex command
nnoremap <Leader>r :set relativenumber!<CR> " Toggle relative line numbers

"copy/paste to clipboard
vnoremap <leader>y "*y 
map<leader>p "*P  

"spell check toggle is <F5>
:map <F4> :setlocal spell! spelllang=en_us<CR>

