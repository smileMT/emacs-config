;;; init-python.el --- Python development settings -*- lexical-binding: t -*-
;;; Commentary:
;; This file contains Python specific settings, including LSP, virtual envs and Jupyter

;;; Code:

;; ========== Python 基础模式 ==========
(use-package python
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))


;; ========== 虚拟环境管理 ==========
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))


;; ========== LSP 支持（Pyright） ==========
(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook (python-mode . lsp)
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-enable-symbol-highlighting t)
  (setq lsp-idle-delay 0.5))

(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))


;; ========== Jupyter Notebook 支持（EIN） ==========
(use-package ein
  :ensure t
  :commands (ein:login ein:notebooklist-open ein:notebook-open)
  :config
  (setq ein:jupyter-default-notebook-directory "~/notebooks")
  ;; 可选：自动登录（需配置 token）
  ;; (setq ein:use-auto-complete t)
  (require 'ein-notebook)
  (require 'ein-subpackages))

(provide 'init-python)
;;; init-python.el ends here
