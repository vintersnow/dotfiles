---@type overseer.TemplateDefinition
return {
  name = "Ruff Lint",
  builder = function()
    ---@type overseer.TaskDefinition
    return {
      cmd = { "ruff" },
      args = { "format", "." },
      components = {
        { "on_output_quickfix", open_on_exit = "failure" },
        "default",
      },
    }
  end,
}
