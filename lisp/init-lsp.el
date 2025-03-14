;;; init-lsp.el --- LSP settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; LSP模式设置
(use-package lsp-mode
  :ensure t
  :init
  ;; 设置lsp-command-keymap的前缀（几个选择 - "C-l", "C-c l"）
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; 替换XXX-mode为具体的主模式(例如 python-mode)
         (c-mode . lsp)
         ;; 如果想要which-key集成
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here
