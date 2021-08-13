"
"
"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/
"
" curl -fL ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


" set noncompatible	" be iMproved, required
filetype off		" required

call plug#begin('~/.config/nvim/plugged')
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'habamax/vim-gruvbit'
Plug 'alvan/vim-closetag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'wakatime/vim-wakatime'
Plug 'vim-airline/vim-airline-themes'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'osyo-manga/vim-over'
Plug 'madskjeldgaard/supercollider-h4x-nvim'
Plug 'thinca/vim-qfreplace'
Plug 'kshenoy/vim-signature'
Plug 'editorconfig/editorconfig-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'posva/vim-vue'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'sirVer/ultisnips'
Plug 'mhartington/nvim-typescript', { 'build': './install.sh' }
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
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
Plug 'neovim/nvim-lspconfig'
Plug 'sbdchd/neoformat'
Plug 'gruvbox-community/gruvbox'
Plug 'mrk21/yaml-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch' : '0.5-compat'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch' : '0.5-compat'}
call plug#end()

"Enable DEOPLETE
let g:deoplete#enable_at_startup = 1

" Language
let g:LanguageClient_autoStart = 1

" Minimal LSP configuration for JavaScript
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
  " Use LanguageServer for omnifunc completion
  autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

" LUA attempt
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" ~THEMES AND COLORS~
augroup colorscheme_change | au!
    au ColorScheme gruvbit hi Comment gui=italic cterm=italic
augroup END
set termguicolors
colorscheme gruvbit
" ~OLD THEME~
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'medium'
" set background=dark

" ONEDARK 
" let g:onedark_hide_endofbuffer = 0
" let g:onedark_termcolors=16
" let g:onedark_terminal_italics = 1

" " AIRLINE change theme back to 'onedark'
" let g:airline_theme='onedark'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

" " COLORS, THESE ARE THE COLORS FOR THE OG SCHEME:
" colorscheme onedark
" set background=dark
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Gruvbox stuff for tabs 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='gruvbox'
"
" GENERAL CONFIG
inoremap jj <ESC>
inoremap jk <ESC>
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
syntax enable
command E Ex " Disambiguates E
filetype plugin on
filetype indent on
set encoding=utf-8
set exrc
set laststatus=2
set nocompatible
set nowrap
set ignorecase smartcase
set incsearch
set nohlsearch
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
set scrolloff=8
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

" VIM-YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

" Prettier on save
autocmd BufWritePre *.js Neoformat

" LEADER
let mapleader=" "

" GO
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

" ULTISSNIPS SNIPPETS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/general/path/of/snippets/']

"REMAPPED SNIPPETS, TO SEE THEM TYPE :Ultisnips edit, FOR THAT FILE TYPE 
nnoremap <leader>! ihb_t!
nnoremap <leader>rf! irf__c
nnoremap <leader>vs! ivs__j
nnoremap <leader>kdep ikdep_y
nnoremap <leader>kser ikser_y
nnoremap <leader>ksec iksec_y
nnoremap <leader>king iking_y
nnoremap <leader>kcon ikcon_y
nnoremap <leader>kpvc ikpvc_y
nnoremap <leader>kvol ikvol_y

" DEOPLETE
" let g:python_host_prog = '/usr/bin/python'
" let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'~/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ACK.VIM
let g:ackprg = 'ag --nogroup --nocolor --column'

" PENCIL
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 84
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md call pencil#init()
    autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

" STATUS LINES
set statusline+=%#warningmsg#
set statusline+=%*

" CTRL-P
let g:ctrlp_use_caching=0
let g:ctrlp_custom_ignore = 'bin$\|build$\|node_modules$\|tmp$\|dist$\|.git|.bak|.swp|.pyc|.class'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_max_height = 18

" FIND AND REPLACE
function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" GOYO
let g:goyo_width=90
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

" TELESCOPE
nnoremap <leader>ft <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" MAXIMIZER FOR THE DEBUGGER
nnoremap <leader>, :MaximizerToggle!<CR>
" VIMSPECTOR DUBUGGER
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
" JUMP AROUND
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
  call vimspector#AddWatch(word)
endfunction

" TOGGLE FOR DEBUG SERVERS/OFF FOR LOCAL 
" OFF IS LOCAL, ON IS GLOBAL
" let g:vimspector_base_dir = expand('$HOME/.config/vimspector-config')

"BUFFER MANAGEMENT
nnoremap <Leader>ff :CtrlP<CR> " Find a file in the current folder recursively
nnoremap <Leader>x :bd<CR> " Delete current buffer
nnoremap <Leader>X :bd!<CR> " Delete current buffer
nnoremap <Leader>n :bn!<CR> " Next buffer
nnoremap <Leader>N :bN!<CR> " Previous buffer
nnoremap <Leader>t :enew<CR> " Make a new empty buffer
nnoremap <Tab> :b#<CR> " Tab between buffers

" ESLINT
nnoremap <Leader>e :new<Bar>0r!npm run lint<CR> " Run eslint in vue

" SPLIT NAVIGATION
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NEWLINE GENERATION
nmap <C-o> O<Esc>
nmap <CR> o<Esc>

nnoremap <Leader>. @: " Repeat last ex command
nnoremap <Leader>r :set relativenumber!<CR> " Toggle relative line numbers

" YANK/PUT FROM/TO CLIPBOARD
vnoremap <leader>y "*y 
map<leader>p "*P  

" SPELLCHECK TOGGLE IS <F4>
:map <F4> :setlocal spell! spelllang=en_us<CR>
"
" SUPERCOLLIDER CONFIG
autocmd filetype supercollider,scnvim,scdoc,supercollider.help lua require'supercollider-h4x'.setup()

" SONIC PI CONFIG
noremap <leader>r :silent w !sonic_pi<CR>
noremap <leader>S :call system("sonic_pi stop")<CR>
let g:sonicpi_command = 'sonic-pi-tool'
let g:sonicpi_send = 'eval-stdin'
let g:sonicpi_stop = 'stop'
let g:vim_redraw = 1
