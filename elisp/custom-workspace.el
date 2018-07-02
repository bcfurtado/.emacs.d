(use-package projectile
  :ensure t
  :init
  (projectile-global-mode t)
  (setq projectile-completion-system 'ivy))

(use-package projectile-ripgrep
  :ensure t)

(provide 'custom-workspace)
