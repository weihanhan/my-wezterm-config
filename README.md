# my-wezterm-config

## 简介

WezTerm 配置。

参考配置：https://github.com/KevinSilvester/wezterm-config

## 用法

将 wezterm 文件夹复制到 `$HOME/.config` 目录下即可，需在 `wezterm/config/appears.lua` 中修改字体以防启动报错。

## 让 WezTerm 窗口初始化时自动居中

如果是单显示器，用以下代码就可以自动计算居中了

- 参考：https://github.com/wez/wezterm/discussions/5501

```lua
wezterm.on("gui-startup", function(cmd)
	local screen = wezterm.gui.screens().active
	local width, height = screen.width * 0.5, screen.height * 0.5
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {
		position = { 
            x = (screen.width - width) / 2, 
            y = (screen.height - height) / 2,
            origin = {Named=screen.name}
        }
	})
	window:gui_window():set_inner_size(width, height)
end)
```

但如果是多显示器，在我的 Windows 系统上，无论在何处点击打开 WezTerm，`wezterm.gui.screens().active` 返回的永远都是同一个显示器对象，这就导致 WezTerm 只能在固定屏幕上打开。

于是做了如下修改，使 WezTerm 能继续在上次驻留的屏幕里打开：

1. 创建一个文件用于存放显示器名称
2. WezTerm 启动时读取文件里的显示器名称，初始化窗口
3. 监听 WezTerm 窗口状态，若驻留的显示器改变则将其名称写入文件

这样就解决问题了，代码在 wezterm.lua 文件里，没写过 lua 脚本代码很脏很难看。

我更希望能在当前点击 WezTerm 的屏幕里打开，如果有人有解决方案希望能告诉我……
