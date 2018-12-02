(use-package projectile
  :load-path "vendor/projectile"
  :ensure t
  :init
  (projectile-global-mode t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action 'projectile-find-dir))

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

(use-package company
  :ensure t
  :config
  (company-mode))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-mode
  :ensure t
  :config
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))

(use-package lsp-ui
    :ensure t
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package restclient
  :ensure t)

(provide 'custom-workspace)
