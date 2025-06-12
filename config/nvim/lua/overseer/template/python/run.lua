---@type overseer.TemplateDefinition
return {
  name = "Run python with uv",
  builder = function()
    local file = vim.fn.expand("%")
    ---@type overseer.TaskDefinition
    return {
      cmd = { "uv" },
      args = { "run", file },
      components = {
        { "on_output_quickfix", open_on_exit = "failure" },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "python" },
  },
}
