" autocomplete
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" compile
let g:vimtex_quickfix_open_on_warning = 0

let g:vimtex_compiler_latexmk = {
      \ 'background': 1,
      \ 'build_dir': '',
      \ 'continuous': 1,
      \ 'options': [],
      \}

" let g:vimtex_view_general_viewer
"      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
"let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_general_viewer = '/usr/bin/mupdf'

let g:vimtex_fold_enabled = 1
