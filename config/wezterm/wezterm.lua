local wezterm = require 'wezterm'
local act = wezterm.action

local ssh_domains = require 'ssh_domains'

wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = '[MODE:' .. name .. ']'
  end
  local workspace = "[WS:" .. window:active_workspace() .. "]"
  -- window:set_right_status(name or '')
  window:set_right_status(workspace .. ', ' .. (name or ''))
end)


local config = wezterm.config_builder()

config.default_prog = { '/opt/homebrew/bin/zsh', '-l' }

-- UI{{{
config.color_scheme = 'iceberg-dark'

-- Font
config.font = wezterm.font('UDEV Gothic 35NF', { weight = 'Regular' })
config.freetype_load_target = "HorizontalLcd"
config.font_size = 13.0
-- TODO: Font Shaping

config.use_ime = true

config.window_background_opacity = 0.85
config.macos_window_background_blur = 10


config.window_decorations = "RESIZE"
-- config.window_frame = {
--   inactive_titlebar_bg = "none",
--   -- active_titlebar_bg = "none",
-- }

config.show_new_tab_button_in_tab_bar = false

config.colors = {
 tab_bar = {
   inactive_tab_edge = "none",
 },
}
-- Tab Color and shape
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  -- Color Hex: https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/alacritty/iceberg-dark.toml
  local background = "#161821"
  local foreground = "#FFFFFF"
  local edge_background = "none"

  if tab.is_active then
    background = "#b4be82"
    foreground = "#FFFFFF"
  end

  local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. " "

  local edge_foreground = background
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)
-- }}}

-- Key Binding{{{

-- Dead keys are not used so it can be used with a single key press.
-- https://wezfurlong.org/wezterm/config/keyboard-concepts.html#dead-keys
config.use_dead_keys = false

config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = 'r', mods = 'CMD|SHIFT', action = wezterm.action.ReloadConfiguration, },

  -- window
  { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = '\\', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = '|', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },
  { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain', },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = false }, },
  { key = 'H', mods = 'LEADER', action = act.AdjustPaneSize { 'Left', 5 }, },
  { key = 'J', mods = 'LEADER', action = act.AdjustPaneSize { 'Down', 5 }, },
  { key = 'K', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'L', mods = 'LEADER', action = act.AdjustPaneSize { 'Right', 5 }, },

  -- tab
  { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1), },
  { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1), },

  -- select / copy mode
  { key = 'f', mods = 'LEADER', action = act.Search { Regex = '' }, },
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode, },

  -- view
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
  { key = 'k', mods = 'CTRL', action = act.ScrollToPrompt(-1) },
  { key = 'j', mods = 'CTRL', action = act.ScrollToPrompt(1) },
}

config.key_tables ={
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
  }
}
-- }}}


config.ssh_domains = ssh_domains

return config
