setlocal wrap
setlocal spell
setlocal textwidth=80

augroup tex
    au!
    if dein#tap('vimtex')
        au User VimtexEventQuit VimtexClean
    endif
augroup END

if dein#tap('vimtex')
    let g:vimtex_enabled=1
    let g:vimtex_fold_enabled=0
    let g:vimtex_indent_enabled=1
    let g:vimtex_indent_bib_enabled=1
    let g:vimtex_mappings_enabled=0
    let g:vimtex_view_general_viewer='zathura'
    let g:tex_flavor='latex'
endif

if dein#tap('latex-live-preview')
    let g:livepreview_previewer='zathura'
endif
