-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- plugins = require('plugins/core')

require('lazy').setup({
  spec = {
    { import = "plugins.avante" },
    { import = "plugins.completion" },
    { import = "plugins.editor" },
    { import = "plugins.finder" },
    { import = "plugins.flutter" },
    { import = "plugins.git" },
    { import = "plugins.lsp" },
    { import = "plugins.oil" },
    { import = "plugins.overseer" },
    { import = "plugins.skk" },
    { import = "plugins.snippet" },
    { import = "plugins.startuptime" },
    { import = "plugins.tool" },
    { import = "plugins.treesitter"},
    { import = "plugins.ui" },
    { import = "plugins.whichkey" },
  },
})
