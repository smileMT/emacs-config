;; startup
(setq inhibit-startup-message t 
      visible-bell t) 

;; Turn off some unneeded UI elements
(menu-bar-mode -1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)

;; Load the Modus Vivendi dark theme
(load-theme 'modus-vivendi t)

;;remenbering recent edited files
(recentf-mode 1)

;; Save what you enter into minibuffers prompts
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the last cursor locatopn of opened files
(save-place-mode 1)

;; Move customization variables to a seperate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;display command log
(use-package command-log-mode)

;;ivy package
(use-package ivy
  :diminish
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))  


(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config(setq swiper-action-recenter t
	       swiper-include-line-number-in-search t))

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;自动补全
(use-package company
  :diminish
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-show-quick-access t))

;; LSP-setting
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (c-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)


(use-package org)


