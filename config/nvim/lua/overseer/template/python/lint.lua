---@type overseer.TemplateDefinition
return {
  name = "Ruff Format",
  builder = function()
    ---@type overseer.TaskDefinition
    return {
      cmd = { "ruff" },
      args = { "check", "--fix", "." },
      components = {
        { "on_output_quickfix", open_on_exit = "failure" },
        "default",
      },
    }
  end,
}
