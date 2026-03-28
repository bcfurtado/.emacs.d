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

;; Show trailing whitespaces
(setq show-trailing-whitespace t)

;; Make tabs visible and distinguishable
(use-package whitespace
  :ensure t
  :config
  ;; Tabs appear as 4 spaces
  (setq-default tab-width 4)
  ;; Show tabs with a longer marker
  (setq whitespace-style '(face tabs tab-mark))
  ;; Custom tab marker: ▶▶▶▶
  (setq whitespace-display-mappings '((tab-mark 9 [9655 9655 9655 9655] [92 9])))
  ;; Enable whitespace-mode globally
  (global-whitespace-mode 1))


;; Display full file path at the title bar when available
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; Enable a better look and feel when on mac os by adding natural
;; title bar
(when *is-a-mac*
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

(use-package default-text-scale
  :ensure t
  :bind (("C-x C-=" . 'default-text-scale-increase)
          ("C-x C-+" . 'default-text-scale-increase)
          ("C-x C--" . 'default-text-scale-decrease)
          ("C-x C-0" . 'default-text-scale-reset))
  :config
  (define-key default-text-scale-mode-map (kbd "C-M-=") nil)
  (define-key default-text-scale-mode-map (kbd "C-M--") nil)
  (define-key default-text-scale-mode-map (kbd "C-M-0") nil)
  :init
  (add-hook 'after-init-hook 'default-text-scale-mode))


(provide 'custom-ui)
