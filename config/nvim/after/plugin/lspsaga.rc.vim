if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

EOF

nnoremap <silent> <C-h> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent> [Leader]h <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> [Leader]e <Cmd>Lspsaga show_line_diagnostics<CR>

inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
