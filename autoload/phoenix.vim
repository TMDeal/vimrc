function! s:find_root() abort
    let root = projectroot#guess()
    let mix = root . "/mix.exs"
    let web = glob(root . "/lib/*_web")

    if filereadable(mix) && isdirectory(web)
        return root
    end

    return ''
endfunction

function! phoenix#Setup() abort
    if !exists('b:phoenix_root')
        let dir = s:find_root()
        if dir !=# ''
            let b:phoenix_root = dir
        endif
    endif
endfunction

function! s:makeProjections() abort
    let name = substitute(projectroot#guess(), '^.*/', '', '')
    let projections={
                \ "lib/" . name . "/*.ex": {
                \   "type": "context"
                \ },
                \
                \ "lib/" . name . "_web/controllers/*_controller.ex": {
                \   "type": "controller",
                \   "alternate": "test/" . name . "_web/controllers/{}_controller_test.exs"
                \ },
                \ "test/". name . "_web/controllers/*_controller_test.exs": {
                \   "alternate": "lib/" . name . "_web/controllers/{}_controller.ex"
                \ },
                \
                \ "lib/" . name . "_web/views/*_view.ex": {
                \   "type": "view",
                \   "alternate": "test/" . name . "_web/views/{}_view_test.exs"
                \ },
                \ "test/" . name . "_web/views/{}_view_test.exs": {
                \   "alternate": "lib/" . name . "_web/views/*_view.ex"
                \ },
                \
                \ "lib/" . name . "_web/channels/*_channel.ex": {
                \   "type": "channel",
                \   "alternate": "test/" . name . "_web/channels/{}_channel_test.exs"
                \ },
                \ "test/" . name . "_web/channels/{}_channel_test.exs": {
                \   "alternate": "lib/" . name . "_web/channels/*_channel.ex"
                \ },
                \
                \ "lib/" . name . "_web/templates/*.html.eex": {
                \   "type": "template"
                \ },
                \
                \ "lib/" . name . "_web/router.ex": {
                \   "type": "router"
                \ },
                \
                \ "assets/js/*": {
                \   "type": "javascript"
                \ },
                \ "assets/css/*": {
                \   "type": "stylesheet"
                \ },
                \
                \ "config/*.exs": {
                \   "type": "config"
                \ },
                \
                \ "priv/repo/seeds.exs": {
                \   "type": "seed"
                \ },
                \
                \ "priv/repo/migrations/*.exs": {
                \   "type": "migration"
                \ }
                \}

    return projections
endfunction

function! phoenix#Projectionist() abort
    let projections = s:makeProjections()
    if exists('b:phoenix_root')
        call projectionist#append(b:phoenix_root, projections)
    endif
endfunction
