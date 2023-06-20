"============================================
" ███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗
" ████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║
" ██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║
" ██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
"============================================

"get username
let g:User=system('echo -n $USER')
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
" ==================== Terminal Colors ====================
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
" show lines
set showtabline=2
set laststatus=2
" show tab and space
set list
set listchars=tab:\┃\ ,trail:▫
" distance with top and bottom
set scrolloff=6
" wrap line
set colorcolumn=80
"cmd
set cmdheight=1
set noshowmode
" undo
set undofile
set undodir=~/.config/nvim/tmp/undo
" cursor place last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" auto change dir
autocmd BufEnter * silent! lcd %:p:h
" change default key
noremap s <nop>
nnoremap C cl
nnoremap Q :q<cr>
nnoremap B :bd<cr>
nnoremap W :w<cr>
noremap I 0
vnoremap A $
nnoremap J 10j
nnoremap K 10k
" windows operation
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sl :set splitright<CR>:vsplit<CR>
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
nmap smv <C-w>t<c-W>H
nmap smh <C-w>t<c-W>K
" wrap
nmap <leader>sw :set wrap!<CR>
nnoremap <expr>j (v:count==0?"gj":"j")
nnoremap <expr>k (v:count==0?"gk":"k")
" change buffers & tabs
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
nnoremap tu :tabe<CR>:edit<space>
nnoremap tU :tab split<CR>
nnoremap tj :+tabnext<CR>
nnoremap tk :-tabnext<CR>
nnoremap tmj :+tabmove<CR>
nnoremap tmk :-tabmove<CR>
" copy and paste
"set clipboard=unnamedplus
vnoremap Y "+y
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
nnoremap <leader>vim :tabe ~/.config/nvim/init.vim<CR>

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
Plug 'xeluxee/competitest.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" heilight
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': ['python', 'vim-plug'] }
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
Plug 'dhruvasagar/vim-table-mode',{ 'for': ['markdown','vimwiki', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc',{ 'for': ['markdown','vimwiki'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': ['markdown','vimwiki', 'vim-plug'] }
Plug 'img-paste-devs/img-paste.vim',{ 'for': ['markdown','vimwiki', 'vim-plug'] }
Plug 'dkarter/bullets.vim',{ 'for': ['markdown','vimwiki', 'vim-plug'] }
Plug 'vimwiki/vimwiki'
"-------edit------
" quick chose text
Plug 'gcmt/wildfire.vim'
" change the characters wrapping words
Plug 'tpope/vim-surround'
" search files
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
" lines and bar
Plug 'shellRaining/hlchunk.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mg979/vim-xtabline'
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
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

"--- hlchunk ---
lua << EOF
require('hlchunk').setup({
	chunk = {
		enable = true,
		notify = true,
		support_filetypes = {
			"*.lua",
			"*.js",
			"*.cpp",
			"*.c",
			"*.py",
		},
		use_treesitter = false,
		chars = {
			horizontal_line = "━",
			vertical_line = "┃",
			left_top = "┏",
			left_bottom = "┗",
			right_arrow = ">",
		},
		style = {
			{ fg = "#00FFFF" },
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
		use_treesitter = false,
		style = "#FFFF00",
	},
	blank = {
		enable = false,
	},
})
EOF

"-----lualine----
lua << EOF
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#3c3836',
  fg       = '#bbc2cf',
  yellow   = '#F0E68C',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#afd787',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
  pink     = '#FF69B4',
  snow     = '#FFFAFA',
  black    = '#000000',
  none     = '#282828',
}

local conditions = {
  buffer_not_empty = function()
	return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
	return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
	local filepath = vim.fn.expand('%:p:h')
	local gitdir = vim.fn.finddir('.git', filepath .. ';')
	return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
	-- Disable sections and component separators
	component_separators = '',
	section_separators = '',
	theme = {
	  -- We are going to use lualine_c an lualine_x as left and
	  -- right section. Both are highlighted by c theme .  So we
	  -- are just setting default looks o statusline
	  normal = { c = { fg = colors.fg, bg = colors.bg } },
	  inactive = { c = { fg = colors.fg, bg = colors.bg } },
	},
  },
  sections = {
	-- these are to remove the defaults
	lualine_a = {},
	lualine_b = {},
	lualine_y = {},
	lualine_z = {},
	-- These will be filled later
	lualine_c = {},
	lualine_x = {},
  },
  inactive_sections = {
	-- these are to remove the defaults
	lualine_a = {},
	lualine_b = {},
	lualine_y = {},
	lualine_z = {},
	lualine_c = {},
	lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
	function()
		return ''
	end,
	padding = { right = 0 },
	color = function()
	local mode_color = {
		n = colors.green,
		i = colors.violet,
		v = colors.yellow,
		[''] = colors.yellow,
		V = colors.yellow,
		c = colors.magenta,
		no = colors.red,
		s = colors.orange,
		S = colors.orange,
		[''] = colors.orange,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		['r?'] = colors.cyan,
		['!'] = colors.red,
		t = colors.red,
	}
	return { fg = mode_color[vim.fn.mode()], gui='bold' }
	end,
}

ins_left {
	'mode',
	icon = '󰕷',
	color = function()
	local mode_color = {
		n = colors.green,
		i = colors.violet,
		v = colors.yellow,
		[''] = colors.yellow,
		V = colors.yellow,
		c = colors.magenta,
		no = colors.red,
		s = colors.orange,
		S = colors.orange,
		[''] = colors.orange,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		['r?'] = colors.cyan,
		['!'] = colors.red,
		t = colors.red,
	}
	return { fg = colors.bg, bg = mode_color[vim.fn.mode()], gui='bold' }
	end,
}

ins_left {
	function()
		return ''
	end,
	color = function()
	local mode_color = {
		n = colors.green,
		i = colors.violet,
		v = colors.yellow,
		[''] = colors.yellow,
		V = colors.yellow,
		c = colors.magenta,
		no = colors.red,
		s = colors.orange,
		S = colors.orange,
		[''] = colors.orange,
		ic = colors.yellow,
		R = colors.violet,
		Rv = colors.violet,
		cv = colors.red,
		ce = colors.red,
		r = colors.cyan,
		rm = colors.cyan,
		['r?'] = colors.cyan,
		['!'] = colors.red,
		t = colors.red,
	}
	return { fg = mode_color[vim.fn.mode()], gui='bold' }
	end,
	padding = { left = 0}
}

ins_left {
	function()
		if(vim.wo.spell) then
			return "SPELL"
		else
			return ""
		end
	end,
	icon = '󰓆',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.red, gui = 'bold' },
}

ins_left {
	function()
		return 'SIZE: '
	end,
	color = { fg = colors.red, gui = 'bold' }, -- Sets highlighting of component
	padding = { left = 1, right = 0 }
}

ins_left {
	'filesize',
	cond = conditions.buffer_not_empty,
	padding = { left = 0 }
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
	color_error = { fg = colors.red },
	color_warn = { fg = colors.yellow },
	color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
	return '%='
  end,
}

ins_left {
	'hostname',
	icon = vim.g.User .. ' at',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.pink, gui = 'bold' },
}

ins_right {
	'filetype',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
	added = { fg = colors.green },
	modified = { fg = colors.orange },
	removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
	function()
		return ''
	end,
	padding = { right = 0 },
	color = { fg = colors.green, gui = 'bold' },
}

ins_right {
	'progress',
	icon = '',
	color = { fg = colors.bg, bg = colors.green, gui = 'bold' },
}

ins_right {
	'location',
	icon='',
	padding = { left = 0, right = 0 },
	color = { fg = colors.bg, bg = colors.green, gui = 'bold' },
}

ins_right {
  function()
	return ''
  end,
  color = { bg = colors.none, fg = colors.green },
  padding = { left = 0 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)
EOF

"-----xtabline----
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['tabs','buffers']
let g:xtabline_settings.enable_persistance = 0
let g:xtabline_settings.last_open_first = 0
let g:xtabline_settings.tab_number_in_left_corner = 0
let g:xtabline_settings.show_right_corner = 1
let g:xtabline_settings.theme='slate'

"----- nvim-scrollbar ---
lua <<EOF
require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
	show = true,
	handle = {
		text = " ",
		color = "#928374",
		hide_if_all_visible = true,
	},
	marks = {
		Search = { color = "yellow" },
		Misc = { color = "purple" },
	},
	handlers = {
		cursor = true,
		diagnostic = true,
		gitsigns = true,
		handle = true,
		search = true,
	},
})
EOF

"----- nvim-hlslens ---
" ==================== nvim-hlslens ====================
noremap <silent> = <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> - <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
            \<Cmd>lua require('hlslens').start()<CR>
noremap * *<Cmd>lua require('hlslens').start()<CR>
noremap # #<Cmd>lua require('hlslens').start()<CR>
noremap g* g*<Cmd>lua require('hlslens').start()<CR>
noremap g# g#<Cmd>lua require('hlslens').start()<CR>

"----theme----
colorscheme gruvbox

" =====code=====
"-----coc.nvim-----
let g:coc_global_extensions = [
        \ 'coc-clangd',
        \ 'coc-css',
        \ 'coc-flutter',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-lua',
        \ 'coc-pairs',
        \ 'coc-pyright',
        \ 'coc-snippets',
        \ 'coc-translator',
        \ 'coc-texlab',
        \ 'coc-vimlsp',
        \ 'coc-explorer',
      \ ]
"set helpfile
set nobackup
set nowritebackup
set pumheight=10
set updatetime=100
highlight CocFloating ctermbg=Black
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
nnoremap <silent> <c-p> :call ShowDocumentation()<CR>
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
nmap <F12> :CocCommand explorer<CR>

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
nnoremap <C-S-i> :call AutoFormat()<CR>
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

require("lspconfig").clangd.setup {
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
}
EOF
nmap \n :Navbuddy<CR>

"---- nvim-treesitter -----
lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- one of "all", "language", or a list of languages
	ensure_installed = {"typescript", "dart", "java", "c", "cpp", "prisma", "bash", "go"},
	highlight = {
		enable = false,              -- false will disable the whole extension
		disable = { "rust" },  -- list of language that will be disabled
	},
}
EOF

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
" Bullets
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
let g:bullets_outline_levels = ['num']
let g:bullets_set_mappings = 0
let g:bullets_mapping_leader = '<M-b>'
let g:bullets_custom_mappings = [
	\ ['imap', '<cr>', '<Plug>(bullets-newline)'],
	\ ['inoremap', '<C-cr>', '<cr>'],
	\
	\ ['nmap', 'o', '<Plug>(bullets-newline)'],
	\
	\ ['vmap', 'gN', '<Plug>(bullets-renumber)'],
	\ ['nmap', 'gN', '<Plug>(bullets-renumber)'],
	\
	\ ['nmap', '<leader>x', '<Plug>(bullets-toggle-checkbox)'],
	\
	\ ['imap', '<C-=>', '<Plug>(bullets-demote)'],
	\ ['imap', '<C-->', '<Plug>(bullets-promote)'],
	\ ]

"----vinwiki----
let g:vimwiki_list = [{'path': '~/Documents/study/Note/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
autocmd FileType vimwiki set wrap

"-----telescope.nvim-----
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fk :Telescope keymaps<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fg :Telescope grep_string<CR>

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
