"---------------------------------------------------------------------------
" denite.nvim
autocmd FileType denite call s:denite_cfg()

function! s:denite_cfg() abort
  " Actions
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'

  " Change mappings.
  call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
  call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

  if executable('ag')
    call denite#custom#var('file/rec', 'command',
    \ ['ag', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])
  elseif executable('rg')
    call denite#custom#var('file/rec', 'command',
    \ ['rg', '--files'])

    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--hidden'])
  endif


endfunction
