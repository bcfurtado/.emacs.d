;;; Disable toolbar & menubar & scroll-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Themes
;; (use-package flatland-black-theme
;;   :ensure t)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :init
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(use-package monokai-theme
  :ensure t
  :disabled t
  :init
  (load-theme 'monokai t))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;;; Define default font size for the frames
(defun set-default-font-zize (frame)
  (set-face-attribute 'default frame :height 150))

(set-default-font-zize (selected-frame))
(add-hook 'after-make-frame-functions 'set-default-font-zize)

;;; Open new frames always maximized
(defun set-frame-maximized (&optional frame)
  (set-frame-parameter frame 'fullscreen 'maximized))

(add-hook 'window-setup-hook 'set-frame-maximized)
(add-hook 'after-make-frame-functions 'set-frame-maximized)

;; Stop cursor blinking
(blink-cursor-mode -1)

;; Hide startup screen
(setq inhibit-startup-screen t)

;; Highlight current line
(global-hl-line-mode 0)

;; This package allow us hide or abbreviate the mode line displays of
;; minor-modes.
(use-package diminish
  :ensure t)

;; Display full file path at the title bar when available
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; Enable a better look and feel when on mac os by adding natural
;; title bar
(when *is-a-mac*
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

(provide 'custom-ui)
