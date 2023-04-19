local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>-", ":<C-u>sp<CR>", opts)
keymap("n", "<leader>/", ":<C-u>vs<CR>", opts)
keymap("n", "<leader>\\", ":<C-u>vs<CR>", opts)

keymap("n", "<leader>p", "\"+p<CR>", opts)
keymap("n", "<leader>y", "\"+yy", opts)
keymap("v", "<leader>y", "\"+y", opts)

keymap("n", "<C-[>", "<C-t>", opts)

keymap("n", "<leader>t-", ":split<Space>term://.//zsh<CR>", opts)
keymap("n", "<leader>t\\", ":vsplit<Space>term://.//zsh<CR>", opts)

-- move right in insert mode
keymap("i", "<C-l>", "<C-g>U<Right>", opts)

keymap("n", "<leader>r", "<Plug>(quickrun)", opts)

-- SKK
keymap('i', '<C-j>', '<Plug>(skkeleton-enable)', opts)
keymap('c', '<C-j>', '<Plug>(skkeleton-enable)', opts)

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local group_id = augroup("filetype_keymap", {
    clear = false
})


local function on_ft(ft, cb)
    autocmd('FileType', {
        group = group_id,
        pattern = ft,
        callback = cb,
    })
end
on_ft({'qf', 'help'}, function()
  buf_keymap(0, "n", "q", ":q<CR>", opts)
end)
