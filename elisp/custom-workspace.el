(use-package projectile
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
  (require 'flycheck)
  (add-hook 'prog-mode-hook 'flycheck-mode))

(use-package company
  :ensure t
  :config
  (company-mode))

(use-package company-lsp
  :disable t
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :config
  (require 'lsp-clients)
  (add-hook 'prog-mode-hook 'lsp)
  (setq lsp-prefer-flymake :none))


(use-package company-lsp
  :disable t
  :commands company-lsp)

(use-package lsp-ui
  :disable t
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil))

(use-package restclient
  :disabled t
  :ensure t)

(provide 'custom-workspace)
