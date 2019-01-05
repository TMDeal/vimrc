function! statusline#Modified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! statusline#Readonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! statusline#Fileformat()
    return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! statusline#Filetype()
    return winwidth(0) > 80 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! statusline#Fileencoding()
    return winwidth(0) > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! statusline#Git()
    try
        if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
            let mark = ''
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! statusline#Filename()
    let fname = expand('%:t')
    return fname == 'ControlP' ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? '' :
                \ fname =~ 'NERD_tree\|undotree*\|diffpanel*' ? '' :
                \ ('' != statusline#Readonly() ? statusline#Readonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != statusline#Modified() ? ' ' . statusline#Modified() : '')
endfunction

function! statusline#Mode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname =~ 'undotree*' ? 'Undotree' :
                \ fname =~ 'diffpanel*' ? 'Diffpanel' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! statusline#CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

function! statusline#CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! statusline#CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

function! statusline#TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction
