if dein#tap('tagbar')
    let g:tagbar_autofocus=1
    let g:tagbar_compact=1
    let g:tagbar_show_linenumbers=1
endif

if dein#tap('gutentags')
    let g:gutentags_cache_dir=$CACHE_DIR . $SEP . 'tags'
    let g:gutentags_project_root=g:root_markers
endif
