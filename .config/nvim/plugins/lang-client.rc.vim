set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['python',  '-m', 'pyls', '--log-file', '/tmp/pyls.log'],
    \ 'cpp': ['cquery', '--language-server', '--log-file=/tmp/cq.log'],
    \ 'javascript.jsx': ['/usr/bin/javascript-typescript-stdio']
    \ }

    " \ 'go': ['go-langserver'],
    " \ 'javascript.jsx': ['node', '/home/vinter/Projects/stuff/langserver/javascript-typescript-langserver/lib/language-server-stdio.js'],

let g:LanguageClient_settingsPath = '/home/vinter/.config/nvim/settings.json'
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_loggingFile = '/tmp/langclient.log'
let g:LanguageClient_diagnosticsEnable = 0 " using ALE


" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <C-K>h :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> <C-K>d :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <C-K>s :call LanguageClient#textDocument_signatureHelp()<CR>
nnoremap <silent> <C-K>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_formatting()<CR>

" Denite
nnoremap <silent> <C-K>l :Denite documentSymbol<CR>
nnoremap <silent> <C-K>d :Denite references<CR>
