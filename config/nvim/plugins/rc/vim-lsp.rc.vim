" if executable('rust-analyzer')
"     au User lsp_setup call lsp#register_server({
"      \ 'name': 'rust-analyzer',
"      \ 'cmd': {server_info->['rust-analyzer']},
"      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
"      \ 'allowlist': ['rust'],
"      \ })
" endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    nmap <buffer> gpd <plug>(lsp-peek-definition)
    nmap <buffer> gpt <plug>(lsp-peek-type-definition)

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

augroup lsp_register
au!
autocmd! User lsp_setup call lsp#register_server({
        \   'name': 'diagnostic-languageserver',
        \   'cmd': { info -> ['diagnostic-languageserver', '--stdio'] },
        \   'whitelist': [
        \     'typescript',
        \     'typescript.tsx',
        \     'typescriptreact',
        \     'javascript',
        \     'javascript.jsx',
        \     'javascriptreact',
        \   ],
        \   'initialization_options': {
        \     'linters': {
        \       'eslint': {
        \         'sourceName': 'eslint',
        \         'command': 'eslint_d',
        \         'args': ['--stdin', '--stdin-filename=%filename', '--no-color'],
        \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
        \         'formatLines': 1,
        \         'formatPattern': [
        \           '^\s*(\d+):(\d+)\s+([^ ]+)\s+(.*?)\s+([^ ]+)$',
        \           {
        \             'line': 1,
        \             'column': 2,
        \             'message': [4, ' [', 5, ']' ],
        \             'security': 3
        \           }
        \         ],
        \         'securities': {
        \            'error': 'error',
        \            'warning': 'warning'
        \         },
        \       },
        \     },
        \     'filetypes': {
        \       'javascript': 'eslint',
        \       'javascript.tsx': 'eslint',
        \       'javascriptreact': 'eslint',
        \       'typescript': 'eslint',
        \       'typescript.tsx': 'eslint',
        \       'typescriptreact': 'eslint',
        \     },
        \     'formatters': {
        \       'eslint': {
        \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
        \         'command': 'eslint_d',
        \         'args': ['--fix', '--fix-to-stdout', '--stdin', '--stdin-filename=%filename'],
        \         'isStdout': v:true,
        \         'isStderr': v:true,
        \       }
        \     },
        \     'formatFiletypes': {
        \       'javascript': 'eslint',
        \       'javascript.tsx': 'eslint',
        \       'javascriptreact': 'eslint',
        \       'typescript': 'eslint',
        \       'typescript.tsx': 'eslint',
        \       'typescriptreact': 'eslint'
        \     }
        \   }
        \ })
augroup END
