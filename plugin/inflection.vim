if exists('g:inflection_loaded') || &compatible
    finish
endif


if !has('python3')
    echohl Error
    echomsg "inflection.vim requires Vim compiled with Python3."
    echohl None
    " stop sourcing this script
    finish
end


let g:inflection_loaded = 1

