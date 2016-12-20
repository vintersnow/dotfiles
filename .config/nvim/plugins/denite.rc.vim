"---------------------------------------------------------------------------
" denite.nvim
" Change mappings.
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

if executable('ag')
  call denite#custom#var('file_rec', 'command',
  \ ['ag', '--vimgrep', '-g', ''])

	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'final_opts', [])
	call denite#custom#var('grep', 'separator', [])
	call denite#custom#var('grep', 'default_opts',
			\ ['--vimgrep'])
endif
