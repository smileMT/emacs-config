;;; init-editor.el --- Editor behavior settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 自动补全括号
(electric-pair-mode t)

;; 选中文本后输入文本会替换文本（更符合习惯了的其它编辑器的逻辑）
(delete-selection-mode t)

;; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; 语法检查工具 flycheck
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

(provide 'init-editor)
;;; init-editor.el ends here
