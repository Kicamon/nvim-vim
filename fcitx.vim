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
