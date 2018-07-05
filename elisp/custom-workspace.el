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
  :config
  (editorconfig-mode t))

(provide 'custom-workspace)
