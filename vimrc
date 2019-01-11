if !has('nvim')
    set nocompatible
endif

nnoremap <SPACE> <NOP>
let g:mapleader="\<SPACE>"
let g:maplocalleader="\<SPACE>"

if has('win16') || has('win32') || has('win64')
    let g:sep = '\'
else
    let g:sep = '/'
endif

if !exists('g:leader_map')
    call leader#Init()
endif

if has('nvim')
    if has('win16') || has('win32') || has('win64')
        let $EDITOR_ROOT=expand('$HOME'.g:sep).join(['AppData', 'Local', 'nvim'], g:sep)
    else
        let $EDITOR_ROOT=expand('$HOME'.g:sep).join(['.config', 'nvim'], g:sep)
    endif
else
    let $EDITOR_ROOT=expand('$HOME'.g:sep).join(['.vim'], g:sep)
endif

let $BUNDLE_DIR=expand('$EDITOR_ROOT'.g:sep).join(['bundle'], g:sep)
let $CACHE_DIR=expand('$EDITOR_ROOT'.g:sep).join(['.cache'], g:sep)
let $DEIN_DIR=expand('$BUNDLE_DIR'.g:sep).join(['repos', 'github.com', 'Shougo', 'dein.vim'], g:sep)

if !isdirectory(expand('$DEIN_DIR'))
    if executable('git')
       let command=expand('!git clone https://github.com/Shougo/dein.vim $DEIN_DIR')
       exec command
    endif
endif

set runtimepath+=$DEIN_DIR

let g:root_markers=[
            \'.projectroot',
            \'.lvimrc',
            \'.git',
            \'.clang_complete',
            \'manage.py',
            \'Gopkg.toml',
            \'mix.exs',
            \'tsconfig.json',
            \'package.json',
            \'angular.json'
            \]

for s:dir in ['tags', 'backup', 'undo', 'swap']
    if !isdirectory(expand($CACHE_DIR . g:sep .s:dir))
        call mkdir(expand($CACHE_DIR . g:sep .s:dir))
    endif
endfor

if dein#load_state(expand('$BUNDLE_DIR'))
    call dein#begin(expand('$BUNDLE_DIR'))

    call dein#load_toml('$EDITOR_ROOT' . g:sep . 'plugins.toml')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
    call dein#remote_plugins()
endif

if !empty(dein#check_clean())
    call map(dein#check_clean(), "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif

if dein#tap('leader-guide')
    call leaderGuide#register_prefix_descriptions('<Space>', 'g:leader_map')
    nnoremap <silent> <Leader> :<c-u>LeaderGuide '<Space>'<CR>
    vnoremap <silent> <Leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
endif

filetype plugin indent on
syntax on
