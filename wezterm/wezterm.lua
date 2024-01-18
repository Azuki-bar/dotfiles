local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then 
    config = wezterm.config_builder()
end

config.enable_wayland = false
config.use_ime = true
config.enable_tab_bar = false
config.xim_im_name = 'uim'

config.window_background_opacity = 0.95
config.font = wezterm.font('PlemolJP Console NF Text')
config.font_size = 13

config.color_scheme = 'iceberg-dark'
return config

