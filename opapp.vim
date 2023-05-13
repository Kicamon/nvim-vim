command CCH call OpenCCH()
command Music call OpenMusic()

func! OpenCCH()
    tabe
    term cch
    tabclose
endfunction

func! OpenMusic()
    tabe
    term /opt/appimages/lx-music-desktop.AppImage
    tabclose
endfunction
