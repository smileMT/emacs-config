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

;; 加载自定义变量文件
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; 加载各个模块
(require 'init-core)       ;; 核心设置
(require 'init-packages)   ;; 包管理设置
(require 'init-ui)         ;; 界面相关设置
(require 'init-editor)     ;; 编辑器行为设置
(require 'init-completion) ;; 补全相关设置
(require 'init-lsp)        ;; LSP相关设置
(require 'init-org)        ;; Org mode设置

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here

