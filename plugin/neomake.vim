if dein#tap('neomake')
    let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeErrorSign'}
    let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarningSign'}
    let g:neomake_message_sign={'text': '➤', 'texthl': 'NeomakeMessageSign'}
    let g:neomake_info_sign={'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}


    let g:lightline#neomake#prefix_infos=get(g:, 'neomake_info_sign').text . ' '
    let g:lightline#neomake#prefix_warnings=get(g:, 'neomake_warning_sign').text . ' '
    let g:lightline#neomake#prefix_errors=get(g:, 'neomake_error_sign').text . ' '
    let g:lightline#neomake#prefix_ok='OK'

    let g:neomake_highlight_columns=0
    let g:neomake_highlight_lines=0
    let g:neomake_go_enabled_makers=['go']
endif
