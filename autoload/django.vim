function! s:makeProjections() abort
    let name = substitute(projectroot#guess(), '^.*/', '', '')
    echo name
    let projections = {
                \ name . "/settings.py": {
                \   "type": "settings"
                \ },
                \
                \ "*/urls.py": {
                \   "type": "urls"
                \ },
                \
                \ "*/views.py": {
                \   "type": "views",
                \   "alternate": "{dirname}/tests/test_views.py"
                \ },
                \
                \ "*/tests.py": {
                \   "type": "tests"
                \ },
                \
                \ "*/admin.py": {
                \   "type": "admin"
                \ },
                \
                \ "*/forms.py": {
                \   "type": "forms",
                \   "alternate": "{dirname}/tests/test_forms.py"
                \ },
                \
                \ "*/models.py": {
                \   "type": "models",
                \   "alternate": "{dirname}/tests/test_models.py"
                \ },
                \
                \ "*.html": {
                \   "type": "templates"
                \ }
                \ }

    return projections
endfunction

function! django#Projectionist() abort
    let projections = s:makeProjections()
    if exists('b:is_django')
        call projectionist#append(projectroot#guess(), projections)
    endif
endfunction

