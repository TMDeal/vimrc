set background=dark
set t_Co=256

if !has($TMUX) && has('termguicolors')
    set termguicolors
endif

if dein#tap('jellybeans')
    let g:jellybeans_use_lowcolor_black=0
    let g:jellybeans_use_term_italics=0
    let g:jellybeans_use_gui_italics=0
    colorscheme jellybeans
endif

hi Normal ctermbg=NONE
hi SignColumn ctermbg=NONE
hi NonText ctermbg=NONE
hi LineNr ctermbg=NONE
hi Folded ctermbg=NONE ctermfg=7
hi SpecialKey ctermbg=NONE

hi TabLine ctermbg=0 ctermfg=15 guibg=#373b37
hi TabLineFill ctermbg=0 guibg=#373b37
hi TabLineSel ctermbg=8 ctermfg=15 guibg=#989898 guifg=#ffffff

hi Error NONE
hi ErrorMsg NONE

hi statusline ctermfg=149 ctermbg=0 cterm=NONE
hi statusline guifg=Black guibg=Grey guisp=NONE

hi User1  guifg=#393939 guibg=#222222
hi User9  guifg=#535551 guibg=#222222
hi User2  guifg=#CA674A guibg=#222222
hi User10 guifg=#EA2828 guibg=#222222
hi User3  guifg=#96A967 guibg=#222222
hi User11 guifg=#87DD32 guibg=#222222
hi User4  guifg=#D3A94A guibg=#222222
hi User12 guifg=#F7E44D guibg=#222222
hi User5  guifg=#5778C1 guibg=#222222
hi User13 guifg=#6F9BCA guibg=#222222
hi User6  guifg=#9C35AC guibg=#222222
hi User14 guifg=#A97CA4 guibg=#222222
hi User7  guifg=#6EB5F3 guibg=#222222
hi User15 guifg=#32DDDD guibg=#222222
hi User8  guifg=#A9A9A9 guibg=#222222
hi User16 guifg=#E9E9E7 guibg=#222222
