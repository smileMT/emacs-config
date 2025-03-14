;;; init-core.el --- Core settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; 定义常量
(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;; 性能优化
(setq gc-cons-threshold (* 128 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq process-adaptive-read-buffering nil)

;; 编辑器行为
(global-auto-revert-mode t)    ;; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(setq make-backup-files nil)   ;; 禁止生成备份文件

;; 历史记录
;; (setq history-length 25)
;; (savehist-mode 1)
;; (recentf-mode 1)  ;; 记住最近编辑的文件

;; 记住并恢复上次光标位置
(save-place-mode 1)

(provide 'init-core)
;;; init-core.el ends here
