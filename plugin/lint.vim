if dein#tap('ale')
    let g:ale_lint_delay=200
    let g:ale_lint_on_text_changed=1
    let g:ale_lint_on_enter=1
    let g:ale_set_highlights=0
    let g:ale_lint_on_save=0
    let g:ale_set_loclist=1
    let g:ale_set_signs=1
    let g:ale_sign_column_always=0
    let g:ale_echo_cursor=1

    let g:ale_sign_error='✖'
    let g:ale_sign_warning='⚠'

    let g:ale_statusline_format=['✖ %d', '⚠ %d', '⬥ OK']

    let g:ale_echo_msg_error_str='E'
    let g:ale_echo_msg_warning_str='W'
    let g:ale_echo_msg_format='[%linter%] %s [%severity%]'

    let g:ale_linters={
                \   'c': ['gcc'],
                \   'cpp': ['clang'],
                \   'python': ['flake8'],
                \   'javascript': ['eslint'],
                \   'typescript': ['tslint']
                \}

    let g:ale_python_flake8_args='--format=default --ignore=F403,F401,W391,E125 --max-line-length=100'
    let g:ale_cpp_clang_options='-std=c++1y'
    let g:ale_c_gcc_options='-std=c11'
endif
