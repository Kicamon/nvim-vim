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

nmap <leader>mk :call GetMakefile()<CR>
func! GetMakefile()
	if &filetype == "cpp"
		silent :! cp ~/.config/nvim/usr/Makefile_cpp ./Makefile
	endif
endfunction
