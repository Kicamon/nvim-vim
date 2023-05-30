"----codeing----
nmap <F5>  :w<CR>:call Run()<CR>
imap <F5>  <ESC>:w<CR>:call Run()<CR>
func! Run()
	if filereadable('Makefile')
        set splitbelow
        :sp
		term make && ./Main
	elseif &filetype == 'c'
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

nnoremap rm :call Delete()<CR>
func! Delete()
	if filereadable('Makefile')
		:! make clean
		:lua require("notify")("󰆴 Clearance completed")
	else
		:! rm -f ./%< && rm -f ./%<_*.txt
		:lua require("notify")("󰆴 Test Samples Delete completed")
	endif
endfunction

nmap <leader>mk :call GetMakefile()<CR>
func! GetMakefile()
	if &filetype == "cpp"
		silent :! cp ~/.config/nvim/usr/Makefile_cpp ./Makefile
	endif
endfunction

"-----fcitx5-----
let g:input_toggle = 1
function! Fcitx5en()
    let s:input_status = system("fcitx5-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx5-remote -c")
    endif
endfunction

function! Fcitx5zh()
        let s:input_status = system("fcitx5-remote")
        if s:input_status != 2 && g:input_toggle == 1
            let l:a = system("fcitx5-remote -o")
            let g:input_toggle = 0
        endif
endfunction
set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx5en()
"进入插入模式
autocmd InsertEnter *.md,*.txt call Fcitx5zh()
