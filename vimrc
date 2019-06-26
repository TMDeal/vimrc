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
    if has('win16') || has('win32') || has('win64')
        let $EDITOR_ROOT=expand('$HOME/AppData/Local/nvim')
    else
        let $EDITOR_ROOT=expand('$HOME/.config/nvim')
    endif
else
    let $EDITOR_ROOT=expand('$HOME/.vim')
endif

let $BUNDLE_DIR=expand('$EDITOR_ROOT/bundle')
let $CACHE_DIR=expand('$EDITOR_ROOT/.cache')
let $DEIN_DIR=expand('$BUNDLE_DIR/repos/github.com/Shougo/dein.vim')

if !isdirectory(expand('$DEIN_DIR'))
    if executable('git')
       let command='!git clone https://github.com/Shougo/dein.vim ' . $DEIN_DIR
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
            \'angular.json',
            \'venv'
            \]

for s:dir in ['tags', 'backup', 'undo', 'swap']
    if !isdirectory(expand($CACHE_DIR . '/' .s:dir))
        call mkdir(expand($CACHE_DIR . '/' .s:dir))
    endif
endfor

if dein#load_state(expand('$BUNDLE_DIR'))
    call dein#begin(expand('$BUNDLE_DIR'))

    call dein#load_toml(expand('$EDITOR_ROOT/plugins.toml'))

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
