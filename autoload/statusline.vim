let s:indicator_warnings = get(g:, 'ale_sign_warning', 'W:')
let s:indicator_errors = get(g:, 'ale_sign_errors', 'E:')
let s:indicator_ok = 'OK'
let s:indicator_checking = 'Linting...'

function! statusline#Modified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! statusline#warnings() abort
  if !statusline#linted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf(g:ale_sign_warning . ' %d', all_non_errors)
endfunction

function! statusline#errors() abort
  if !statusline#linted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:all_errors == 0 ? '' : printf(g:ale_sign_error . ' %d', all_errors)
endfunction

function! statusline#ok() abort
  if !statusline#linted()
    return ''
  endif
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? s:indicator_ok : ''
endfunction

function! statusline#checking() abort
  return ale#engine#IsCheckingBuffer(bufnr('')) ? s:indicator_checking : ''
endfunction

function! statusline#linted() abort
  return getbufvar(bufnr(''), 'ale_linted', 0) > 0 && !ale#engine#IsCheckingBuffer(bufnr(''))
endfunction

function! statusline#Lint() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%d⚠ %d✖ ',
    \   all_non_errors,
    \   all_errors
    \)
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

function! statusline#TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction
