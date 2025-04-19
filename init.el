;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(let ((minver "27.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "28.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; 设定源码加载路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/tools" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/text" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/misc" user-emacs-directory))

;;使所有帮助类型的 buffer（包括 C-h m 显示的模式帮助）在右侧显示，且窗口宽度为当前帮助的 30%。
(add-to-list 'display-buffer-alist
             '("\\*Help\\*"
               (display-buffer-reuse-window display-buffer-in-side-window)
               (side . right)
               (window-width . 0.5)))

;; 加载自定义变量文件
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; 基础设置
(require 'init-core)       ;; 核心设置
(require 'init-packages)   ;; 包管理设置
(require 'init-ui)         ;; 界面相关设置
(require 'init-editor)     ;; 编辑器行为设置
(require 'init-completion) ;; 补全相关设置

;; 开发工具
(require 'init-lsp)        ;; LSP相关设置

;; 编程语言
(require 'init-python)     ;; Python开发环境
;; 根据需要添加其他语言模块
;; (require 'init-web)
;; (require 'init-cpp)

;; 文本处理
(require 'init-org)        ;; Org mode设置
(require 'init-markdown)   ;; Markdown设置

;; 工具
(require 'init-git)        ;; 版本控制
(require 'init-projectile) ;; 项目管理

;; 杂项
(require 'init-utils)      ;; 实用函数和工具

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here

