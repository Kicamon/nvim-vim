"============================================
" ███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║
" ██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║
" ██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
"============================================

"auto load
if empty(glob($HOME.'/.temp'))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
			    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent :! mkdir ~/.temp && mkdir ~/.temp/undo
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob($HOME.'/.config/coc/ultisnips/cpp.snippets'))
	silent :! cp -rf ~/.config/nvim/usr/ultisnips ~/.config/coc
endif

"====================================
"===  Basic setting for vim use   ===
"====================================
" color
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_CO=256
"hi NonText ctermfg=gray guifg=grey10
"hi NormalFloat guifg=LightGreen guibg=Green
"highlight NotifyBackground guibg=#000000
" highlight
syntax on
set cursorline
" line number
set nu
set relativenumber
" tab size
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
" ignore Uppercase and Lowercase
set ignorecase
" change windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" leader
let mapleader = "\<space>"
" wrap
set nowrap
nmap <leader>w :set wrap!<CR>
noremap j gj
noremap k gk
" change buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" copy and paste
set clipboard=unnamedplus
" distance with top and bottom
set scrolloff=6
" show tab and space
setlocal list
set listchars=tab:\┃\ ,trail:▫
" spell check
nnoremap <leader>sc :set spell!<CR>
" move
inoremap <A-l> <Right>
nnoremap <A-j> <cmd>m .+1<cr>==
nnoremap <A-k> <cmd>m .-2<cr>==
inoremap <A-j> <esc><cmd>m .+1<cr>==gi
inoremap <A-k> <esc><cmd>m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv
" change window size
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
" wrap line
set colorcolumn=80
" find next <++>
nmap <leader><leader> /<++><CR>:noh<CR>"_c4l
" undo
set undofile
set undodir=~/.temp/undo
" cursor place last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" cancel search highlight
nnoremap <leader><CR> :noh<CR>
" open init
nnoremap <leader>vim :edit ~/.config/nvim/init.vim<CR>

"my tools
source ~/.config/nvim/tools.vim
"md-snippets
source ~/.config/nvim/md-snippets.vim
"num-key
source ~/.config/nvim/cursor.vim

"====plugin management====
call plug#begin('~/.config/nvim/plugged')
"-----code-----
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'iamcco/vim-language-server'
Plug 'xeluxee/competitest.nvim'
" cpp highlight
Plug 'octol/vim-cpp-enhanced-highlight'
" commenter
Plug 'preservim/nerdcommenter'
" format
Plug 'akarl/autoformat.nvim'
" web
Plug 'ap/vim-css-color'
" preview code segment and jump
Plug 'SmiteshP/nvim-navbuddy'
" acm
Plug 'xeluxee/competitest.nvim'
"-----markdown-----
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'img-paste-devs/img-paste.vim'
"-------edit------
" quick chose text
Plug 'gcmt/wildfire.vim'
" change the characters wrapping words
Plug 'tpope/vim-surround'
" search files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" sudo
Plug 'lambdalisue/suda.vim'
" git
Plug 'lewis6991/gitsigns.nvim'
" more cursors
Plug 'mg979/vim-visual-multi'
" open link
Plug 'xiyaowong/link-visitor.nvim'
" undo tree
Plug 'mbbill/undotree'
"------beautify-------
" start page
Plug 'mhinz/vim-startify'
" notify
Plug 'rcarriga/nvim-notify'
" lines
Plug 'shellRaining/hlchunk.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mg979/vim-xtabline'
Plug 'rebelot/heirline.nvim'
" theme
Plug 'morhetz/gruvbox'
" icons
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
" rainbow parentheses
Plug 'luochen1990/rainbow'
call plug#end()



"====================================
"=== Plug config ====================
"====================================

"=====beautify=====
"-----vim-startify-----
let g:startify_custom_header = [
			\ '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
			\ '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
			\ '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
			\ '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
			\ '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
			\ '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
            \]
let g:startify_custom_footer = [
            \ '╭──────────────────────────────╮',
            \ '│        Just for Fun!         │',
            \ '╰──────────────────────────────╯',
            \]
let g:startify_files_number = 10
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

" -----hlchunk----
lua << EOF
require('hlchunk').setup({
    indent = {
        chars = { "┃", "┃", "┃", },

        style = {
			"#00BFFF",
            "#FF69B4",
			"#FFFFFF",
        },
    },
	line_num = {
        enable = true,
        use_treesitter = false,
        style = "#FFFF00",
    },
    blank = {
        enable = false,
    }
})
EOF

"-----airline----
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
" open tabline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"-----xtabline----
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
let g:xtabline_settings.theme='slate'

"----theme----
colorscheme gruvbox

"-----rainbow-----
" 1. vscode defult 2. author defult 3. vscode show
"	\	'guifgs': ['#B21212', '#1B9CED','#FFFC00'],
"	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
"	\	'guifgs': ['#C186BF', '#268EDB','#F79318'],
 let g:rainbow_conf = {
 \	'guifgs': ['#C186BF', '#268EDB','#F79318'],
 \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
 \	'operators': '_,_',
 \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
 \	'separately': {
 \		'*': {},
 \		'tex': {
 \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
 \		},
 \		'lisp': {
 \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
 \		},
 \		'vim': {
 \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
 \		},
 \		'html': {
 \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
 \		},
 \		'css': 0,
 \	}
 \}
let g:rainbow_active = 1

" =====code=====
"-----coc.nvim-----
let g:coc_global_extensions = [
        \ 'coc-clangd',
        \ 'coc-python',
        \ 'coc-lua',
        \ 'coc-snippets',
        \ 'coc-vimlsp',
        \ 'coc-translator',
        \ 'coc-pairs',
        \ 'coc-highlight',
        \ 'coc-css',
        \ 'coc-json',
        \ 'coc-texlab',
      \ ]
"set helpfile
set nobackup
set nowritebackup
set pumheight=10
set updatetime=100
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-o> coc#refresh()
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
" coc-translator
nmap ts <Plug>(coc-translator-p)

"-----vim-cpp-enhanced-highlight-----
autocmd FileType cpp let g:cpp_class_scope_highlight = 1
autocmd FileType cpp let g:cpp_member_variable_highlight = 1
autocmd FileType cpp let g:cpp_class_decl_highlight = 1
autocmd FileType cpp let g:cpp_experimental_simple_template_highlight = 1
autocmd FileType cpp let g:cpp_experimental_template_highlight = 1
autocmd FileType cpp let g:cpp_concepts_highlight = 1

"-----nerdcommenter-----
"map \c <leader>cc
map <leader>aa <leader>cu

"-----autoformat-----
call autoformat#config('cpp', 
	\ ['clang-format -style microsoft -'])
call autoformat#config('c', 
	\ ['clang-format -style microsoft -'])
call autoformat#config('python',
	\ ['autopep8 -'])
call autoformat#config('html',
    \ ['html-beautify -s 2'])
autocmd! BufWritePre * :Autoformat
nnoremap <C-i> :call AutoFormat()<CR>:w<CR>
inoremap <C-i> <ESC>:call AutoFormat()<CR>:w<CR>
func! AutoFormat()
    if &filetype == "markdown"
        :TableModeToggle
    else
        :Autoformat
    endif
endfunction

"-----nvim-navbuddy-----
lua <<EOF
local navbuddy = require("nvim-navbuddy")

require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}
EOF
nmap \n :Navbuddy<CR>

"----competitest----
lua require('competitest').setup()
autocmd FileType cpp,python nmap rr :CompetiTestRun<CR>
autocmd FileType cpp,python nmap ra :CompetiTestAdd<CR>
autocmd FileType cpp,python nmap re :CompetiTestEdit<CR>
autocmd FileType cpp,python nmap ri :CompetiTestReceive testcases<CR>
autocmd FileType cpp,python nmap rd :CompetiTestDelete<CR>

"-----markdown-----
" disable default key mappings
let g:vim_markdown_no_default_key_mappings = 1
autocmd FileType markdown let g:mkdp_browser='chromium'
"tabe
autocmd FileType markdown let g:table_mode_corner='|'
autocmd FileType markdown let g:mkdp_theme = 'dark'
autocmd FileType markdown nnoremap <buffer> toc :GenTocGitLab<CR>
"the conceal in markdown
"base
autocmd FileType markdown let g:vim_markdown_conceal=0
" code segment
autocmd FileType markdown let g:vim_markdown_conceal_code_blocks = 0
"latex
autocmd FileType markdown let g:tex_conceal = ""
autocmd FileType markdown let g:vim_markdown_math = 1
"close fold
let g:vim_markdown_folding_disabled = 1
"navigable table
autocmd FileType markdown nnoremap <buffer> T :call Toc_tree()<CR>
let g:toc_tree_close=1
func! Toc_tree()
	if g:toc_tree_close == 1
		let g:toc_tree_close = 0
		:Toc
		:vertical resize-30
		:set wrap
	else
		let g:toc_tree_close = 1
		:Toc
		q
	endif
endfunction
" images
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'

"-----telescope.nvim-----
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope grep_string<CR>

" ----tree----
let g:NERDTreeWinPos = "right"
noremap <F12> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"-----suda.vim-----
cnoreabbrev sw w suda://%

"-----gitsigns.nvim-----
lua <<EOF
require('gitsigns').setup({
	signs = {
    add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '▒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
})
EOF
nnoremap <LEADER>gr :Gitsigns reset_hunk<CR>
nnoremap <LEADER>gb :Gitsigns blame_line<CR>
nnoremap <LEADER>g- :Gitsigns prev_hunk<CR>
nnoremap <LEADER>g= :Gitsigns next_hunk<CR>

"-----link-visitor----
lua << EOF
require("link-visitor").setup({
  open_cmd = nil,
  silent = true, -- disable all prints, `false` by defaults skip_confirmation
  skip_confirmation = false, -- Skip the confirmation step, default: false
  border = "rounded" -- none, single, double, rounded, solid, shadow see `:h nvim_open_win()`
})
EOF
nnoremap gl :VisitLinkUnderCursor<CR>

"----undotree---
nnoremap L :UndotreeToggle<CR>
