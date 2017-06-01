if dein#tap('nerdtree')
    let g:NERDTreeHijackNetrw=1
    let g:NERDTreeMouseMode=2
    let g:NERDTreeRespectWildIgnore=1
    let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
    let g:NERDTreeWinPos="left"
    let g:NERDTreeMinimalUI=1
    let g:NERDTreeAutoDeleteBuffer=1
    " let g:NERDTreeQuitOnOpen=1
    let g:NERDTreeIndicatorMapCustom = {
                \ 'Modified':  '·',
                \ 'Staged':    '‧',
                \ 'Untracked': '?',
                \ 'Renamed':   '≫',
                \ 'Unmerged':  '≠',
                \ 'Deleted':   '✃',
                \ 'Dirty':     '⁖',
                \ 'Clean':     '✓',
                \ 'Unknown':   '⁇'
                \ }
endif

if dein#tap('ctrlp')
    let g:ctrlp_map = ''
    let g:ctrlp_cache_dir=$EDITOR_ROOT . '/.cache/ctrlp'
    let g:ctrlp_clear_cache_on_exit=0
    let g:ctrlp_regexp=0
    let g:ctrlp_root_markers=g:root_markers
    let g:ctrlp_show_hidden=0
    let g:ctrlp_max_files=10000
    let g:ctrlp_max_depth=40
    let g:ctrlp_open_new_file='v'
    let g:ctrlp_arg_map=1
    let g:ctrlp_follow_symlinks=1
    let g:ctrlp_lazy_update=0

    let g:ctrlp_custom_ignore = {
                \ 'dir': '\v[\/](\.git|\.hg|\.svn|node_modules|build|bundle|dist|tmp|third_party|vendor)$',
                \ }
endif

if dein#tap('buffergator')
    let g:buffergator_suppress_keymaps=0
endif

if dein#tap('list-toggle')
    let g:lt_height=5
    let g:lt_location_list_toggle_map = '<leader>ol'
    let g:lt_quickfix_list_toggle_map = '<leader>oq'
endif
