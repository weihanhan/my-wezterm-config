-- 快捷键绑定
local wezterm = require 'wezterm'
local module = {}
function module.apply(config)
    config.keys = {
        { key = 'm',  mods = 'CTRL', action = wezterm.action.ShowLauncher },
        { key = 'm', mods = 'CTRL|ALT', action = wezterm.action.ShowTabNavigator },
    }
end
return module
