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
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
Plug 'junegunn/fzf'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'lotabout/skim.vim'
Plug 'habamax/vim-gruvbit'
Plug 'alvan/vim-closetag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wsdjeg/dein-ui.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'wakatime/vim-wakatime'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'
Plug 'osyo-manga/vim-over'
Plug 'madskjeldgaard/supercollider-h4x-nvim'
Plug 'thinca/vim-qfreplace'
Plug 'kshenoy/vim-signature'
Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neovim/nvim-lspconfig'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'posva/vim-vue'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'sirVer/ultisnips'
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
Plug 'Shougo/ddc.vim'
Plug 'Shougo/dein.vim'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'Shougo/denite.nvim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'gruvbox-community/gruvbox'
Plug 'mrk21/yaml-vim'
Plug 'crispgm/nvim-go'
Plug 'fatih/vim-go'
Plug 'nvim-treesitter/nvim-treesitter', {'branch' : '0.5-compat'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch' : '0.5-compat'}
call plug#end()

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

" COC.NVIM
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" VIM-YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

" LEADER
let mapleader=" "

" GO
lua <<EOF
require('go').setup({})
require('lspconfig').gopls.setup({})
require('go').config.update_tool('quicktype', function(tool)
	tool.pkg_mgr = 'npm'
end)
EOF
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

" PRETTIER 
let g:prettier#autoformat_require_pragma = 0

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

" SUPERCOLLIDER CONFIG
autocmd filetype supercollider,scnvim,scdoc,supercollider.help lua require'supercollider-h4x'.setup()

" SONIC PI CONFIG
noremap <leader>r :silent w !sonic_pi<CR>
noremap <leader>S :call system("sonic_pi stop")<CR>
let g:sonicpi_command = 'sonic-pi-tool'
let g:sonicpi_send = 'eval-stdin'
let g:sonicpi_stop = 'stop'

