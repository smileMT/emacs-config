# 结构化的Emacs配置

这个仓库包含一个模块化、易于维护的Emacs配置。配置按功能区域划分为多个文件，使用`provide`和`require`机制组织代码，便于管理和扩展。

## 特性

- **模块化结构**：按功能区域拆分配置
- **性能优化**：调整了GC阈值和进程读取缓冲区大小
- **现代界面**：使用`doom-modeline`和`modus-vivendi`主题
- **智能补全**：使用`company`实现代码补全
- **快速搜索**：集成`ivy`、`counsel`和`swiper`
- **语法检查**：通过`flycheck`实现
- **LSP支持**：集成`lsp-mode`提供语言服务器协议支持
- **编辑增强**：自动括号补全、选中替换文本等实用功能

## 目录结构

```
~/.emacs.d/
├── init.el                # 主配置文件
├── custom-vars.el         # 自定义变量
├── lisp/
    ├── init-core.el       # 核心设置
    ├── init-ui.el         # 界面相关设置
    ├── init-editor.el     # 编辑器行为设置
    ├── init-packages.el   # 包管理设置
    ├── init-completion.el # 补全相关设置
    ├── init-lsp.el        # LSP相关设置
    └── init-org.el        # Org mode设置
```

## 安装要求

- Emacs 27.1 或更高版本 (推荐 28.1+)

## 安装方法

### 快速安装

1. 备份现有配置（如果有）

   ```bash
   mv ~/.emacs.d ~/.emacs.d.bak
   ```

2. 克隆仓库

   ```bash
   git clone https://github.com/smileMT/emacs-config.git ~/.emacs.d
   ```

3. 启动Emacs，配置会自动安装所需包

### 手动安装

如果你想保留现有配置并逐步采用本配置：

1. 克隆仓库到临时位置

   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git /tmp/emacs-config
   ```

2. 复制感兴趣的模块到你的配置目录

   ```bash
   mkdir -p ~/.emacs.d/lisp
   cp /tmp/emacs-config/lisp/init-*.el ~/.emacs.d/lisp/
   ```

3. 在你的`init.el`中添加需要的模块

   ```elisp
   (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
   (require 'init-packages)  ; 必须首先加载
   (require 'init-ui)
   ; ... 其他模块 ...
   ```

## 配置模块说明

### init-core.el

包含基本性能优化和核心设置：

- GC阈值调整
- 进程读取优化
- 自动刷新缓冲区
- 禁用备份文件
- 保存光标位置

### init-ui.el

界面相关设置：

- 禁用启动消息
- 简化UI元素
- Modus Vivendi深色主题
- Doom模式栏

### init-editor.el

编辑器行为设置：

- 自动补全括号
- 选中文本后输入替换
- 代码折叠
- 语法检查(flycheck)

### init-packages.el

包管理设置：

- 配置包源(MELPA, Org, ELPA)
- 初始化use-package

### init-completion.el

补全系统设置：

- Ivy、Counsel、Swiper集成
- Company代码补全

### init-lsp.el

语言服务器协议支持：

- LSP模式配置
- C语言LSP支持

### init-org.el

Org模式设置（可扩展）

## 自定义配置

1. 所有自动生成的自定义变量会保存在`custom-vars.el`中
2. 要添加新功能，推荐在`lisp/`目录中创建新模块，并在`init.el`中引用

## 快捷键总结

| 快捷键    | 功能描述               |
| --------- | ---------------------- |
| `M-x`     | 执行命令 (counsel增强) |
| `C-x C-f` | 查找文件 (counsel增强) |
| `C-c f`   | 最近文件               |
| `C-c g`   | Git文件                |
| `C-s`     | 搜索 (swiper增强)      |
| `C-r`     | 向后搜索               |
| `C-c l`   | LSP命令前缀            |

## 扩展和自定义

要添加你自己的配置：

1. 在适当的模块文件中添加设置
2. 或创建新模块 (例如 `init-python.el`) 并在`init.el`中引用

```elisp
;; 在init.el中添加
(require 'init-python)
```

## 问题排查

如果遇到启动问题：

1. 取消注释`init.el`中的`(setq debug-on-error t)`启用错误回溯
2. 使用`emacs --debug-init`启动Emacs
3. 检查`*Messages*`缓冲区查看详细信息

## 参考来源

1. [Emacs高手修炼手册系列](https://www.bilibili.com/video/BV13g4y167Zn/?vd_source=cab5b045fc16b3a30f329a4f0daafd98)
2. [专业emacs入门](https://zhuanlan.zhihu.com/p/385214753)
3.  [Steve Purcell 的配置](https://github.com/purcell/emacs.d)

## 贡献

欢迎通过Pull Request或Issue提交改进和问题报告！