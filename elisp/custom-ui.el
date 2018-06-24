;;; Disable toolbar & menubar & scroll-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Themes
(use-package flatland-black-theme
  :ensure t)

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (setq doom-themes-enable-bold t
;;         doom-themes-enable-italic t)
;;   :init
;;   (load-theme 'doom-one t)
;;   (doom-themes-visual-bell-config)
;;   (doom-themes-org-config))

;; (use-package monokai-theme
;;   :ensure t
;;   :init
;;   (load-theme 'monokai t))

(provide 'custom-ui)
