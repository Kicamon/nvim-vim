map  <F5>  :w<CR>:call Run()<CR>
imap <F5>  <ESC>:w<CR>:call Run()<CR>
func! Run()
    :lua require("notify")(" code running")
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
