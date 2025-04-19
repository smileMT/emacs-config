;;; init-editor.el --- Editor behavior settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 自动补全括号
(electric-pair-mode t)

;; 选中文本后输入文本会替换文本（更符合习惯了的其它编辑器的逻辑）
(delete-selection-mode t)

;; 历史记录
(setq history-length 100)
(savehist-mode 1)
(recentf-mode 1)  ;; 记住最近编辑的文件

;; 语法检查工具 flycheck
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

;; 行首行尾移动优化
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

;; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook #'hs-minor-mode) ;;正常可以通过 C-c @ C-h 折叠代码块、用 C-c @ C-s 来展开代码块。 


(provide 'init-editor)
;;; init-editor.el ends here
