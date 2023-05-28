"============================================
" ███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║
" ██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║
" ██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
"============================================

if empty(glob($HOME.'/.undo'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	silent :! mkdir ~/.undo
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"====================================
"===  Basic setting for vim use   ===
"====================================
"配色
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_CO=256
"hi NonText ctermfg=gray guifg=grey10
"hi NormalFloat guifg=LightGreen guibg=Green
"highlight NotifyBackground guibg=#000000
" 基本高亮
syntax on
" 行号显示与相对行号
set nu
set relativenumber
" tab缩进大小为4格
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
" 忽略大小而写
set ignorecase
" 高亮本行
set cursorline
" 切换窗口
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"leader
let mapleader = "\<space>"
"换行
set nowrap
nmap <leader>w :set wrap!<CR>
noremap j gj
noremap k gk
" changebuffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
"复制粘贴
set clipboard=unnamedplus
"离底行数
set scrolloff=6
"渲染Tab和空格
setlocal list
set listchars=tab:\┃\ ,trail:▫
"显示命令
set wildmenu
" insert模式下右移
imap <A-l> <Right>
" 警示线
set colorcolumn=80
" 寻找下一个<++>
nmap <leader><leader> /<++><CR>:noh<CR>c4l
" undo
set undofile
set undodir=~/.undo
" 光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 取消高亮
nnoremap <leader>nh :noh<CR>

"run code
source ~/.config/nvim/run.vim
"fcitx5
source ~/.config/nvim/fcitx.vim
"md-snippets
source ~/.config/nvim/md-snippets.vim
"num-key
source ~/.config/nvim/num-key.vim

"====plugin management====
call plug#begin('~/.config/nvim/plugged')
" code
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'iamcco/vim-language-server'
Plug 'xeluxee/competitest.nvim'
" 快速预览跳转
Plug 'SmiteshP/nvim-navbuddy'
" acm
Plug 'xeluxee/competitest.nvim'
" cpp高亮方案
Plug 'octol/vim-cpp-enhanced-highlight'
" 一键注释
Plug 'preservim/nerdcommenter'
" 格式化
Plug 'akarl/autoformat.nvim'
" 前端
Plug 'ap/vim-css-color'
" markdown
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ferrine/md-img-paste.vim'
" 快捷选中文本
Plug 'gcmt/wildfire.vim'
" 快捷修改包裹符号
Plug 'tpope/vim-surround'
" 搜索文件
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" tree
Plug 'nvim-neo-tree/neo-tree.nvim'
" sudo
Plug 'lambdalisue/suda.vim'
" git
Plug 'lewis6991/gitsigns.nvim'
" 多光标
Plug 'mg979/vim-visual-multi'

" butify
" 起始页面
Plug 'mhinz/vim-startify'
" 通知
Plug 'rcarriga/nvim-notify'
" lines
Plug 'shellRaining/hlchunk.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mg979/vim-xtabline'
Plug 'rebelot/heirline.nvim'
" theme
Plug 'morhetz/gruvbox'
" 小图标
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
" 彩虹括号
Plug 'luochen1990/rainbow'
call plug#end()



"====================================
"=== Plug config ====================
"====================================

"=====butify=====
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
let g:startify_files_number = 5
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

" -----hlchunk----
lua << EOF
require('hlchunk').setup({
	chunk = {
		chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
        },
        style = {
            { fg = "#7FFFAA" },
        },
    },
    indent = {
        chars = { "│", "│", },

        style = {
            "#FF69B4",
			"#00BFFF",
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
" 开启tabline
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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
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

if empty(glob($HOME.'/.config/coc/ultisnips/cpp.snippets'))
	silent :! cp -rf ~/.config/nvim/usr/ultisnips ~/.config/coc
endif

"-----vim-cpp-enhanced-highlight-----
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"-----nerdcommenter-----
"map \c <leader>cc
map <leader>aa <leader>cu

"-----autoformat-----
call autoformat#config('cpp', 
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
        :TableModeEnable
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
nmap rm :call Delete()<CR>
func! Delete()
	if filereadable('Makefile')
		:! make clean
		:lua require("notify")("󰆴 Clearance complete")
	else
		:! rm -f ./%< && rm -f ./%<_*.txt
		:lua require("notify")("󰆴 Test Samples Delete completed")
	endif
endfunction

"-----markdown-----
let g:mkdp_browser='chromium'
"表格
let g:table_mode_corner='|'
let g:mkdp_theme = 'dark'
autocmd FileType markdown nnoremap <buffer> toc :GenTocGitLab<CR>
"markdown文件中的conceal
"基本
let g:vim_markdown_conceal=0
"代码块
let g:vim_markdown_conceal_code_blocks = 0
"latex数学公式
let g:tex_conceal = ""
let g:vim_markdown_math = 1
"关闭折叠
let g:vim_markdown_folding_disabled = 1
"让其他类型文件遵循上列标准
let g:vim_markdown_auto_extension_ext = 'txt'


"-----telescope.nvim-----
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope grep_string<CR>

" ----tree----
let g:neo_tree_remove_legacy_commands = 1
nmap <F12> :Neotree source=filesystem reveal=true position=right<CR>
lua << EOF
require("neo-tree").setup({
	close_if_last_window = true,
})
EOF

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
nnoremap H :Gitsigns preview_hunk_inline<CR>
nnoremap <LEADER>gr :Gitsigns reset_hunk<CR>
nnoremap <LEADER>gb :Gitsigns blame_line<CR>
nnoremap <LEADER>g- :Gitsigns prev_hunk<CR>
nnoremap <LEADER>g= :Gitsigns next_hunk<CR>
