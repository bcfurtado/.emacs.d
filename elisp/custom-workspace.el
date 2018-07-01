(use-package projectile
  :ensure t
  :init
  (projectile-global-mode t)
  (setq projectile-completion-system 'ivy))


(provide 'custom-workspace)
