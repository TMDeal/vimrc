if dein#tap('vim-test')
    if has('nvim')
        let test#strategy = "neovim"
    else
        let test#strategy = "vimterminal"
    endif
endif
