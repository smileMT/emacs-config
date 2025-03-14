;;; init-packages.el --- Package management settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 初始化包源
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; 在非Linux平台上初始化use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; 指令日志（注释掉了）
;; (use-package command-log-mode)

(provide 'init-packages)
;;; init-packages.el ends here
