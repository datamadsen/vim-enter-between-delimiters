" Example of how to use:
"inoremap <CR> <C-R>=vebd#vimEnterBetweenDelimiters()<CR>
"autocmd FileType javascript,css inoremap <CR> <C-R>=vedb#vimEnterBetweenDelimiters()<CR>

" ==============
" Main function:
" ==============

function! vebd#vimEnterBetweenDelimiters()
    let surroundings = strpart(getline('.'), col('.') -2, 2)
    let delimiters = s:getDelimitersForPlugin()
    let movement = "\<CR>\<ESC>\<S-o>"
    
    for delimiter in delimiters
        if surroundings == delimiter
            return movement
        endif
    endfor
    
    return "\<CR>"
endfunction

" =================
" Helper functions:
" =================

function! s:getDelimitersForPlugin()
    if !exists("g:vebdDelimiters")
        return ["{}", "[]", "()"]
    else
        return g:vebdDelimiters
    endif
endfunction

function! s:Set(var, val)
  if !exists(a:var)
    exec 'let ' . a:var . ' = ' . a:val
  end
endfunction

" ====================
" Initialize defaults:
" ====================
call s:Set('g:vebdDelimiters', ["{}", "[]", "()"])
