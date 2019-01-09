if !has('nvim')
    set nocompatible
endif

nnoremap <SPACE> <NOP>
let g:mapleader="\<SPACE>"
let g:maplocalleader="\<SPACE>"

if !exists('g:leader_map')
    call leader#Init()
endif

if has('nvim')
    let $EDITOR_ROOT=expand('$HOME/.config/nvim')
else
    let $EDITOR_ROOT=expand('$HOME/.vim')
endif

let $BUNDLE_DIR=expand('$EDITOR_ROOT/bundle')
let $CACHE_DIR=expand('$EDIROT_ROOT/.cache')

set runtimepath+=$EDITOR_ROOT/bundle/repos/github.com/Shougo/dein.vim

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
    if !isdirectory(expand($CACHE_DIR . '/' . s:dir))
        call mkdir(expand($CACHE_DIR . '/' . s:dir), 'p')
    endif
endfor

if dein#load_state(expand('$EDITOR_ROOT/bundle'))
    call dein#begin(expand('$EDITOR_ROOT/bundle'))

    call dein#load_toml('$EDITOR_ROOT/plugins.toml')

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
