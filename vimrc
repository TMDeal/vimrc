if !has('nvim')
    set nocompatible
endif

nnoremap <SPACE> <NOP>
let g:mapleader="\<SPACE>"
let g:maplocalleader="\<SPACE>"

if !exists('g:leader_map')
    call leader#Init()
endif

if has('win32') || has('win64')
    let $SEP='\\'
else
    let $SEP='/'
endif

if has('nvim')
    if has('win32') || has('win64')
        let $EDITOR_ROOT=expand('$LOCALAPPDATA'.$SEP.'nvim')
    else
        let $EDITOR_ROOT=expand('$HOME'.$SEP.'.config'.$SEP.'nvim')
    endif
else
    let $EDITOR_ROOT=expand('$HOME'.$SEP.'.vim')
endif

let $BUNDLE_DIR=expand('$EDITOR_ROOT'.$SEP.'bundle')
let $DEIN_DIR=expand('$BUNDLE_DIR'.$SEP.'repos'.$SEP.'github.com'.$SEP.'Shougo'.$SEP.'dein.vim')
let $CACHE_DIR=expand('$EDITOR_ROOT'.$SEP.'.cache')

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

if !isdirectory(expand('$EDITOR_ROOT/bundle/repos/github.com/Shougo/dein.vim'))
    !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s -- $BUNDLE_DIR
endif

for s:dir in ['tags', 'backup', 'undo', 'swap']
    if !isdirectory(expand('$CACHE_DIR'.$SEP.s:dir))
        call mkdir(expand('$CACHE_DIR'.$SEP.s:dir), 'p')
    endif
endfor

if dein#load_state($BUNDLE_DIR)
    call dein#begin($BUNDLE_DIR)

    call dein#load_toml('$EDITOR_ROOT'.$SEP.'plugins.toml')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
    call dein#remote_plugins()
endif

if !empty(dein#check_clean())
    call map(dein#check_clean(), "delete(v:val, 'rf')")
endif

if dein#tap('leader-guide')
    call leaderGuide#register_prefix_descriptions('<Space>', 'g:leader_map')
    nnoremap <silent> <Leader> :<c-u>LeaderGuide '<Space>'<CR>
    vnoremap <silent> <Leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
endif

filetype plugin indent on
syntax on
