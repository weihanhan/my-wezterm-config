-- Shell 配置
local wezterm = require 'wezterm'
local cmd = { label = 'CMD', args = { 'cmd' } }
local ps={ label = 'PowerShell', args = { 'powershell' } }
local gitBash = { label = 'Git Bash', args = { 'D:/DevTools/Git/bin/bash.exe', '-i', '-l' }}
local gitZsh = { label = 'Git zsh', args = { 'D:/DevTools/Git/bin/bash.exe', '-i', '-l', '-c', 'zsh' }}
local launch_menu = {cmd, ps, gitBash, gitZsh}
local module = {}
function module.apply(config)
    -- 默认终端
    config.default_prog = gitZsh.args
    -- shell 菜单列表
    config.launch_menu = launch_menu
end
return module
