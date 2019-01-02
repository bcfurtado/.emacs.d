(use-package projectile
  :load-path "vendor/projectile"
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
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
  :diminish flycheck-mode
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode))

(use-package company
  :ensure t
  :config
  (company-mode))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :config
  (require 'lsp-clients)
  (add-hook 'prog-mode-hook 'lsp)
  (setq lsp-prefer-flymake nil))


(use-package company-lsp
  :commands company-lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil))

(use-package restclient
  :ensure t)

(provide 'custom-workspace)
