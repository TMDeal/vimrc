if dein#tap('neomake')
    if dein#tap('nrun')
        let g:neomake_javascript_eslint_exe=nrun#Which('eslint')
    endif
endif
