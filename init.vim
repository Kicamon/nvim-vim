"============================================
" ███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║
" ██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║
" ██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
"============================================

"====================================
"===  Basic setting for vim use   ===
"====================================
"配色
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_CO=256
silent! color deus
hi NonText ctermfg=gray guifg=grey10
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'
highlight NotifyBackground guibg=#000000
" 基本高亮
syntax on
" 行号显示与相对行号
set nu
set relativenumber
" tab缩进大小为4格
if &filetype == "cpp" || &filetype == "vim"
    set expandtab
endif
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set termguicolors
" 忽略大小而写
set ignorecase
" 高亮本行
set cursorline
"换行
set nowrap
map<M-w> :set wrap<CR>
map<M-S-w> :set nowrap<CR>
" changebuffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
"复制粘贴
vnoremap <C-Insert> "+y
nnoremap <S-Insert> "*p
"离底行数
set scrolloff=4
"leader
let mapleader = "\<space>"
"渲染Tab和空格
setlocal list
set listchars=tab:▸\ ,trail:▫
"显示命令
set wildmenu
" insert模式下右移
imap <A-l> <Right>
" 浮动窗口配色
hi NormalFloat guifg=LightGreen guibg=Green

" run code
map  <F5>  :w<CR>:call Run()<CR>
imap <F5>  <ESC>:w<CR>:call Run()<CR>
func! Run()
    :lua require("notify")("code run")
    if &filetype == 'c'
        set splitbelow
        :sp
        term gcc % -o %< && ./%< && rm -f ./%<
    elseif &filetype == "cpp"
        set splitbelow
        :sp
        term g++ % -std=c++17 -O2 -g -Wall -o %< && ./%< && rm -f ./%<
    elseif &filetype == "python"
        set splitbelow
        :sp
        term python3 %
    elseif &filetype == "lua"
        set splitbelow
        :sp
        term lua %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'html'
        tabe
        term live-server --browser=chromium
        tabclose
    endif
endfunction

" fcitx5
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx5-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx5-remote -c")
    endif
endfunction

function! Fcitx2zh()
    if expand("%:e")== "md"
        let s:input_status = system("fcitx5-remote")
        if s:input_status != 2 && g:input_toggle == 1
            let l:a = system("fcitx5-remote -o")
            let g:input_toggle = 0
        endif
    endif
endfunction
set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()

"md-snippets
source ~/.config/nvim/md-snippets.vim
"num-key
source ~/.config/nvim/num-key.vim

call plug#begin('~/.config/nvim/plugged')
" 代码
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'SmiteshP/nvim-navbuddy'
Plug 'iamcco/vim-language-server'
" cpp高亮方案
Plug 'octol/vim-cpp-enhanced-highlight' " 一键注释
Plug 'preservim/nerdcommenter'
" 格式化
Plug 'vim-autoformat/vim-autoformat'
" 前端
Plug 'ap/vim-css-color'
" markdown
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ferrine/md-img-paste.vim'

" 美化
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
" 配色
Plug 'tanvirtin/monokai.nvim'
" 小图标
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
" 彩虹括号
Plug 'luochen1990/rainbow'

" 常用工具
" 快捷选中文本
Plug 'gcmt/wildfire.vim'
" 搜索文件
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" tree
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
" sudo
Plug 'lambdalisue/suda.vim'
" git
Plug 'lewis6991/gitsigns.nvim'
" 多光标
Plug 'mg979/vim-visual-multi'
call plug#end()



"====================================
"=== Plug config ====================
"====================================

" check function
lua <<EOF
local navbuddy = require("nvim-navbuddy")

require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}
EOF
nmap \c :Navbuddy<CR>

" -----hlchunk----
lua << EOF
require('hlchunk').setup({
    indent = {
        chars = { "│", "¦", "┆", "┊", },

        style = {
            "#8B00FF",
        },
    },
    blank = {
        enable = false,
    }
})
EOF

"-----markdown-----
let g:mkdp_browser='chromium'
let g:table_mode_corner='|'	" 表格
command TMR TableModeRealign
command TOC GenTocGitLab
" markdown文件中的conceal
" 基本
let g:vim_markdown_conceal=0
" 代码块
let g:vim_markdown_conceal_code_blocks = 0
" latex数学公式
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" 关闭折叠
let g:vim_markdown_folding_disabled = 1
" 让其他类型文件遵循上列标准
let g:vim_markdown_auto_extension_ext = 'txt'

" 配色
colorscheme monokai
colorscheme monokai_pro
colorscheme monokai_soda
colorscheme monokai_ristretto

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

"-----vim-startify-----
let g:startify_custom_header = [
            \ ' █████╗  ██████╗███╗   ███╗███████╗██████╗ ',
            \ '██╔══██╗██╔════╝████╗ ████║██╔════╝██╔══██╗',
            \ '███████║██║     ██╔████╔██║█████╗  ██████╔╝',
            \ '██╔══██║██║     ██║╚██╔╝██║██╔══╝  ██╔══██╗',
            \ '██║  ██║╚██████╗██║ ╚═╝ ██║███████╗██║  ██║',
            \ '╚═╝  ╚═╝ ╚═════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝',
            \]
let g:startify_custom_footer = [
            \ '╭──────────────────────────────╮',
            \ '│        Just for Fun!         │',
            \ '╰──────────────────────────────╯',
            \]
let g:startify_files_number = 5
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

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
set helpfile
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
" coc-translator
nmap ts <Plug>(coc-translator-p)

"-----vim-cpp-enhanced-highlight-----
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"-----nerdcommenter-----
map \\ <leader>cc
map \a <leader>cu

"-----vim-autoformat-----
let g:formatdef_clangformat_microsoft = '"clang-format -style microsoft -"'
let g:formatters_cpp = ['clangformat_microsoft']
let g:formatters_c = ['clangformat_microsoft']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:autoformat_verbosemode=1
nnoremap <C-i> :call AutoFormat()<CR>:w<CR>
inoremap <C-i> <ESC>:call AutoFormat()<CR>:w<CR>
func! AutoFormat()
    if &filetype == "markdown"
        :TableModeEnable
    else
        :Autoformat
    endif
endfunction

"-----telescope.nvim-----
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope grep_string<CR>

"-----suda.vim-----
cnoreabbrev sw w suda://%

" ----tree----
let g:neo_tree_remove_legacy_commands = 1
nmap <F12> :Neotree<CR>

"-----airline----
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"-----xtabline----
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 1
let g:xtabline_settings.theme='slate'
noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>

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
