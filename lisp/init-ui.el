;;; init-ui.el --- UI settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 基本UI设置
(setq inhibit-startup-message t 
      visible-bell t)

;; 关闭不需要的UI元素
(menu-bar-mode -1)
;; (global-display-line-numbers-mode 1) ;; 在每个缓冲区中显示行号

;; 加载Modus Vivendi深色主题
(load-theme 'modus-vivendi t)

;; Doom模式栏
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'init-ui)
;;; init-ui.el ends here
