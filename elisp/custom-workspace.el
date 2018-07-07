(use-package projectile
  :load-path "vendor/projectile"
  :ensure t
  :init
  (projectile-global-mode t)
  (setq projectile-completion-system 'ivy))

(use-package projectile-ripgrep
  :ensure t)

(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode t))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode)

(provide 'custom-workspace)
