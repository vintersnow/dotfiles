local wezterm = require 'wezterm'
local act = wezterm.action

local ssh_domains = require 'ssh_domains'

wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

return {
  default_prog = { '/opt/homebrew/bin/zsh', '-l' },

  color_scheme = 'MaterialDesignColors',

  font = wezterm.font('UDEV Gothic 35NF', { weight = 'Regular' }),
  freetype_load_target = "HorizontalLcd",
  font_size = 13.0,
  -- font_size = 18.0,
  -- dpi = 144.0,

  -- key binding
  leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    -- window
    { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = '\\', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },
    { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain', },
    { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = false }, },

    -- tab
    { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1), },
    { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1), },

    -- select / copy mode
    { key = 'f', mods = 'LEADER', action = act.Search { Regex = '' }, },
    { key = '[', mods = 'LEADER', action = act.ActivateCopyMode, },
  },

  -- key_tables = {
  --   search_mode = {
  --     { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
  --     { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
  --     { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
  --     { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
  --     { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
  --     { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
  --     { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
  --     { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
  --     { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
  --     { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
  --   },
  -- },
  --
  key_tables = {
    copy_mode = {
      { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      -- { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      { key = 'u', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
      { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      -- { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      { key = 'd', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
      { key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
      { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
      { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
      -- { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
      -- { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
      -- { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      -- { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      -- { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      -- { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      -- { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      -- { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    },

  },

  ssh_domains = ssh_domains,
}

