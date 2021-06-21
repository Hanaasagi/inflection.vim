if exists('g:inflection#loaded')
    finish
else
    let g:inflection#loaded = 1
endif

let g:inf_py = "py3 "
exec g:inf_py "import vim, sys, os, re, os.path"
exec g:inf_py "cwd = vim.eval('expand(\"<sfile>:p:h\")')"
exec g:inf_py "sys.path.insert(0, cwd)"
exec g:inf_py "sys.path.insert(0, os.path.join(cwd, 'vendor'))"
exec g:inf_py "from lib import inflect_current_word"


function! s:ask_format_name()
    let s:shortcuts = {
                \ 'U': 'uppercase',
                \ 'L': 'lowercase',
                \ '_': 'underscore',
                \ 'c': 'camelize',
                \ 'C': 'Camelize',
                \ '-': 'dasherize',
                \ 'P': 'pluralize',
                \ 'S': 'singularize',
                \ }

    echom 'Select Inflection (' . join(keys(s:shortcuts)) . '):'
    let l:opt = nr2char(getchar())

    if !has_key(s:shortcuts, l:opt)
        echom 'Invalid option' | return
    endif

    return s:shortcuts[l:opt]
endfunction


function! inflection#inflect_current_word() abort
    exec g:inf_py printf("inflect_current_word('''%s''')",  s:ask_format_name())
endfunction


function! inflection#inflect_current_word_in_insert_mode() abort
    exec g:inf_py printf("inflect_current_word('''%s''', True)",  s:ask_format_name())
    :startinsert
    if charclass(getline(".")[col(".") - 1]) == 2
        call cursor( line('.'), col('.') + 1)
    endif
endfunction

function! inflection#inflect_visaul_block() abort
    let [l:line_start, l:column_start] = getpos("'<")[1:2]
    let [l:line_end, l:column_end] = getpos("'>")[1:2]
    let l:cur_line = l:line_start
    let l:to_format = s:ask_format_name()

    while l:cur_line <= l:line_end
        call cursor(l:cur_line, l:column_start)
        let l:cur_line += 1
        exec g:inf_py printf("inflect_current_word('''%s''')",  l:to_format)
    endwhile
endfunction
