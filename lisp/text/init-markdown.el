;;; init-markdown.el --- Markdown mode settings -*- lexical-binding: t -*-
;;; Commentary:
;; This file contains Markdown specific settings

;;; Code:

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

(provide 'init-markdown)
;;; init-markdown.el ends here
