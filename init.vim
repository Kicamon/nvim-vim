"============================================
" ███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║
" ██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║
" ██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
"============================================

"auto load
if empty(glob($HOME.'/.config/nvim/tmp'))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
			    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    silent :! mkdir -p ~/.config/nvim/tmp/undo
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"====================================
"===  Basic setting for vim use   ===
"====================================
" leader
let mapleader = "\<space>"
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
" wrap
set nowrap
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
set smartcase
" timeout
set ttimeoutlen=0
set notimeout
set virtualedit=block
" close the conceal
set conceallevel=0
" show tabline
set showtabline=2
" show tab and space
set list
set listchars=tab:\┃\ ,trail:▫
" distance with top and bottom
set scrolloff=6
" wrap line
set colorcolumn=80
" undo
set undofile
set undodir=~/.config/nvim/tmp/undo
" cursor place last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" change defualt key
noremap s <nop>
nnoremap C cl
nnoremap Q :q<cr>
nnoremap W :w<cr>
nnoremap B :bd<cr>
" windows operation
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sl :set splitright<CR>:vsplit<CR>
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
" wrap
nmap <leader>sw :set wrap!<CR>
noremap j gj
noremap k gk
" change buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" copy and paste
"set clipboard=unnamedplus
vnoremap Y "+y
nnoremap P "+p
" spell check
nnoremap <leader>sc :set spell!<CR>
" move
inoremap <A-l> <Right>
nnoremap <A-j> <cmd>m .+1<cr>==
nnoremap <A-k> <cmd>m .-2<cr>==
"inoremap <A-j> <esc><cmd>m .+1<cr>==gi
"inoremap <A-k> <esc><cmd>m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv
" change window size
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
" find next <++>
nmap <leader><leader> /<++><CR>:noh<CR>"_c4l
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
"study
source ~/.config/nvim/usr/study/study.vim

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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
"-----markdown&note-----
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'img-paste-devs/img-paste.vim'
Plug 'vimwiki/vimwiki'
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
" git
Plug 'lewis6991/gitsigns.nvim'
" more cursors
Plug 'mg979/vim-visual-multi'
" open link
Plug 'xiyaowong/link-visitor.nvim'
" undo tree
Plug 'mbbill/undotree'
" float ranger
Plug 'kevinhwang91/rnvimr'
" auto alignment
Plug 'junegunn/vim-easy-align'
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
" theme
Plug 'morhetz/gruvbox'
" icons
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
" rainbow parentheses
Plug 'luochen1990/rainbow'
"-----other------
" goyo
Plug 'junegunn/goyo.vim'
" sudo
Plug 'lambdalisue/suda.vim'
call plug#end()



"====================================
"=== Plug config ====================
"====================================

"=====beautify=====
"-----vim-startify-----
let g:startify_custom_header = [
			\ '   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
			\ '   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
			\ '   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
			\ '   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
			\ '   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
			\ '   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
            \]
let g:startify_custom_footer = [
            \ '   ╭──────────────────────────────╮',
            \ '   │        Just for Fun!         │',
            \ '   ╰──────────────────────────────╯',
            \]
let g:startify_files_number = 5
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

"-----hlchunk----
lua << EOF
require('hlchunk').setup({
	chunk = {
		enable = true,
		notify = false,
		support_filetypes = {
			"*.lua",
			"*.js",
			"*.cpp",
			"*.c",
			"*.py",
		},
		use_treesitter = true,
		chars = {
			horizontal_line = "─",
			vertical_line = "│",
			left_top = "╭",
			left_bottom = "╰",
			right_arrow = ">",
		},
		style = {
			{ fg = "#D2691E" },
		},
	},
	indent = {
		chars = { "┃", "┃", "┃", },

		style = {
			"#00BFFF",
			"#B0E0E6",
			"#FF69B4",
		},
	},
	line_num = {
		enable = true,
		use_treesitter = true,
		style = "#FFFF00",
	},
	blank = {
		enable = false,
	},
})
EOF

"-----airline----
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
" open tabline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"-----xtabline----
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 0
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
nmap ts <Plug>(coc-translator-p)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

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
nnoremap <S-i> :call AutoFormat()<CR>
func! AutoFormat()
    if &filetype == "markdown" || &filetype == "vimwiki"
        :TableModeToggle
    else
        :Autoformat
    endif
	exec "w"
endfunction

"-----nvim-navbuddy-----
lua <<EOF
local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

navbuddy.setup {
    window = {
        border = "single",  -- "rounded", "double", "solid", "none"
                            -- or an array with eight chars building up the border in a clockwise fashion
                            -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
        size = "60%",       -- Or table format example: { height = "40%", width = "100%"}
        position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
        scrolloff = nil,    -- scrolloff value within navbuddy window
        sections = {
            left = {
                size = "20%",
                border = nil, -- You can set border style for each section individually as well.
            },
            mid = {
                size = "40%",
                border = nil,
            },
            right = {
                -- No size option for right most section. It fills to
                -- remaining area.
                border = nil,
                preview = "leaf",  -- Right section can show previews too.
                                   -- Options: "leaf", "always" or "never"
            }
        },
    },
    node_markers = {
        enabled = true,
        icons = {
            leaf = "  ",
            leaf_selected = " → ",
            branch = " ",
        },
    },
    icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = " ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
    },
    lsp = {
        auto_attach = true,   -- If set to true, you don't need to manually use attach function
        preference = nil,      -- list of lsp server names in order of preference
    },
    source_buffer = {
        follow_node = true,    -- Keep the current node in focus on the source buffer
        highlight = true,      -- Highlight the currently focused node
        reorient = "smart",    -- "smart", "top", "mid" or "none"
        scrolloff = nil        -- scrolloff value when navbuddy is open
    }
}
EOF
nmap \n :Navbuddy<CR>

"-------treesitter-------
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
	enable = true,

	-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
	-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
	-- the name of the parser)
	-- list of language that will be disabled
	disable = { "c", "rust", "cpp" },
	-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
	disable = function(lang, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
			return true
		end
	end,

	-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- Instead of true it can also be a list of languages
	additional_vim_regex_highlighting = false,
  },
}
EOF

"----competitest----
lua require('competitest').setup()
autocmd FileType cpp,python nnoremap rr :CompetiTestRun<CR>
autocmd FileType cpp,python nnoremap ra :CompetiTestAdd<CR>
autocmd FileType cpp,python nnoremap re :CompetiTestEdit<CR>
autocmd FileType cpp,python nnoremap ri :CompetiTestReceive testcases<CR>
autocmd FileType cpp,python nnoremap rd :CompetiTestDelete<CR>

"-----markdown-----
autocmd FileType markdown set wrap
" disable default key mappings
let g:vim_markdown_no_default_key_mappings = 1
let g:mkdp_browser='chromium'
"tabe
autocmd FileType markdown let g:table_mode_corner='|'
autocmd FileType markdown let g:mkdp_theme = 'dark'
"toc
autocmd FileType markdown nnoremap <buffer> toc :GenTocGitLab<CR>
" images
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
autocmd FileType markdown let g:PasteImageFunction = 'g:MarkdownPasteImage'
autocmd FileType tex let g:PasteImageFunction = 'g:LatexPasteImage'

"----vinwiki----
let g:vimwiki_list = [{'path': '~/Documents/study/Note/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
autocmd FileType vimwiki set wrap

"-----telescope.nvim-----
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fk :Telescope keymaps<CR>
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

"-----gitsigns.nvim-----
lua <<EOF
require('gitsigns').setup({
	signs = {
    add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
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

"----rnvimr----
nnoremap <leader>R :RnvimrToggle<CR>

"-----vim-easy-align---
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"-----suda-----
cnoreabbrev sw w suda://%

"-----goyo--------
nnoremap <leader>gy :Goyo<CR>
