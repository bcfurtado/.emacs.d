;;; init.el --- My emacs configuration

;;; Commentary:

;;; Code:

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'custom-pm-setup)

;; avoid customized settings on the init.el file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(require 'custom-setup)
(require 'custom-functions)
(require 'custom-keybinds)
(require 'custom-dired)
(require 'custom-vc)
(require 'custom-editor)
(require 'custom-misc)
(require 'custom-workspace)
(require 'custom-web)
(require 'custom-python)
(require 'custom-elisp)
(require 'custom-javascript)
(require 'custom-org-mode)
(require 'custom-experimental)
(require 'custom-ui)

;; after start up
(open-my-todo-file)

(setq max-specpdl-size 5)  ; default is 1000, reduce the backtrace level
(setq debug-on-error t)  ; now you should get a backtrace
(setq gc-cons-threshold (* gc-cons-threshold 100))  ; 80 mb
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(setq compilation-scroll-output t)
