function! statusline#Mode()
    let mode_map = {
                \'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
                \'c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'TERMINAL'
                \}
    return winwidth(0) > 60 ? '[' . (&paste ? "PASTE|" : "") . get(mode_map, mode(), '') . ']' : ''
endfunction

function! statusline#Modified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! statusline#Readonly()
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! statusline#Fileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! statusline#Fileencoding()
    return winwidth(0) > 70 ? '[' . (strlen(&fenc) ? &fenc : &enc) . ']' : ''
endfunction

function! statusline#Filetype()
    return winwidth(0) > 70 ? '[' . (strlen(&filetype) ? &filetype : 'no ft') . ']' : ''
endfunction

function! statusline#Filename()
    let fname = expand('%:t')
    return fname =='ControlP' ? '[CTRLP]' :
                \ fname =~ '__Tagbar__' ? '' :
                \ fname =~ 'NERD_tree\|undotree*\|diffpanel*' ? '' :
                \ ('' != statusline#Readonly() ? '[' . statusline#Readonly() . ' ' : '[') .
                \ ('' != fname ? fname : 'No Name') .
                \ ('' != statusline#Modified() ? ' ' . statusline#Modified() . ']' : ']')
endfunction

function! statusline#Git()
    try
        if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
            let mark = ''
            let _ = fugitive#head()
            return strlen(_) ? '[' . mark._ .']' : ''
        endif
    catch
    endtry
    return ''
endfunction
