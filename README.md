我的 vim 配置文档

<img src="https://raw.githubusercontent.com/shishirui/vim-config/master/screenshot.png" height="500">

### 特性
1. 支持 php 语法高亮、折叠。折叠和收起的切换快捷键是 `zx`
1. 支持 javascript 语法高亮、折叠。折叠和收起的切换快捷键是 `zx`
1. 支持代码自动缩进对齐。选定要对齐的代码后，按 `=` 即可，即使对 javascript 的闭包语法也能良好的支持。
1. 支持彩色多功能 tabbar 和 statusbar
1. 支持在编辑器左侧显示 git 或 svn 的 diff 状态
1. 快速注释 `cc`，取消注释 `cx`
1. 打开日志 `ca`
1. 打开目录树，按键盘最上面的 `F7` 键
1. 检查 php 语法，按键盘最上面的 `F5` 键
1. 列出函数、常量、类的定义，按键盘最上面 `F8` 键
1. 快速定位到第一个 tab，按 `11`，快速定位到第二个 tab，按 `22`，以此类推...
1. 支持搜索结果全部高亮
1. 扩大或缩小选择范围。按 `+` 扩大选择范围，按 `-` 缩小选择范围
1. 在方法或者类名的定义上面按 ctrl+p 可以快速生成注释（针对 php）

### 配置

打开 `.vimrc` 文件可以进行进一步配置

### 插件

有一些比较老的插件是直接安装的。最近的一些新插件，都使用 [vim-plug](https://github.com/junegunn/vim-plug) 安装，可以在`.vimrc`文件的最下面找到相关配置项。如果您想添加其他插件，也推荐使用 [vim-plug](https://github.com/junegunn/vim-plug) 安装。
