;;; init-python.el --- Python development settings -*- lexical-binding: t -*-
;;; Commentary:
;; This file contains Python specific settings, including LSP, virtual envs and Jupyter

;;; Code:

;; Python基本设置
(use-package python
  :ensure t
  :config
  )

;; 虚拟环境管理
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

;; LSP服务：pyright
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))
  :config
  ;; 设置 pyright 虚拟环境搜索路径（不是必须的，如果已用 pyvenv-activate）
  ;;(setq lsp-pyright-venv-path "~/venvs/quant-env"))

;; Jupyter 支持
(use-package ein
  :ensure t
  :commands (ein:login ein:notebook-open)
  :init
  (setq ein:jupyter-default-server-command "jupyter"
        ein:completion-backend 'ein:use-company-backend))

(provide 'init-python)
;;; init-python.el ends here
