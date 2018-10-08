<img src="https://raw.githubusercontent.com/shishirui/vim-config/master/screenshot.png" height="500">

我的 vim 配置文档

### 特性

1. 支持 php 语法高亮、折叠。折叠和收起的切换命令是 `zx`
1. 支持 javascript 语法高亮、折叠。折叠和收起的切换命令是 `zx`
1. 支持代码自动缩进对齐。选定要对齐的代码后，按 `=` 即可，即使对 javascript 的闭包语法也能很好的支持
1. 支持彩色多功能 tabbar 和 statusbar
1. 支持在编辑器左侧显示 git 或 svn 的 diff 状态
1. 快速注释 `cc`，取消注释 `cx`
1. 打开日历 `ca`
1. 检查 php 语法，按键盘最上面的 `F5` 键
1. 显示或隐藏左侧的代码行数字，按键盘最上面的 `F6` 键
1. 打开目录树，按键盘最上面的 `F7` 键
1. 列出函数、常量、类的定义，按键盘最上面 `F8` 键
1. 粘贴代码自动缩进。按键盘最上面 `F10` 键来开启或关闭。开启后，粘贴的代码将自动对齐，关闭后将保持原样。默认为开启。
1. 删除选中文字的空格、空行，按键盘最上面 `F11` 键
1. 快速定位到第一个 tab，按 `11`，快速定位到第二个 tab，按 `22`，以此类推...
1. 支持搜索结果全部高亮
1. 扩大或缩小选择范围。按 `+` 扩大选择范围，按 `-` 缩小选择范围
1. 在方法或者类名的定义上面按 ctrl+p 可以快速生成注释（针对 php）
1. 搜索文件并在新 tab 中打开，输入 `fzf` 打开搜索文件列表，用回车键确认文件
1. 在新 tab 中打开当前光标处的文件，输入 `gf`
1. 在选定一段代码后，输入 `>>` 向右缩进，输入 `<<` 向左缩进
1. 将当前文件的编码设置为 utf-8，输入 `fe` 命令
1. 支持语法错误提示。注意：此功能需要系统中安装了对应语言的语法检查器，并且添加到了 $PATH 中。例如 phpcs、eslint 等
  
### 需求

该配置需要 vim 8 或以上版本支持，并且系统中安装了 ctags。

### 安装

    git clone https://github.com/shishirui/vim-config.git
    cp -r vim-config/.vim vim-config/.vimrc ~

运行 vim，并输入 `:PlugInstall` 安装插件。等待所有插件安装完成后，重启 vim 即可。
    

### 配置

打开 `.vimrc` 文件可以进行进一步配置。

### 插件

有一些比较老的插件是直接安装的。最近的一些新插件，都使用 [vim-plug](https://github.com/junegunn/vim-plug) 安装，可以在 `.vimrc` 文件的最下面找到相关配置项。如果您想添加其他插件，也推荐使用 [vim-plug](https://github.com/junegunn/vim-plug) 安装。

#### 添加新插件

打开 `.vimrc` 文件，在靠下的位置中，在 `call plug#begin` 和 `call plug#end()` 之间添加插件位于 Github 的地址，然后执行 `:PlugInstall` 即可。
