;; -*- lexical-binding: t -*-

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action 'projectile-find-dir))

(use-package rg
  :ensure t
  :config
  (rg-enable-default-bindings (kbd "C-c s o"))
  (define-key projectile-mode-map (kbd "C-c p s r") 'rg-project))

(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode t))

(defun bc/go-to-next-error (&rest args)
  (interactive "P")
  (setq flycheck-navigation-minimum-level 'error)
  (apply 'flycheck-next-error args))

(defun bc/go-to-next-warning (&rest args)
  (interactive "P")
  (setq flycheck-navigation-minimum-level nil)
  (apply 'flycheck-next-error args))

(defun bc/go-to-previous-error (&rest args)
  (interactive "P")
  (setq flycheck-navigation-minimum-level 'error)
  (apply 'flycheck-previous-error args))

(defun bc/go-to-previous-warning (&rest args)
  (interactive "P")
  (setq flycheck-navigation-minimum-level nil)
  (apply 'flycheck-previous-error args))


(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :bind (:map flycheck-command-map
          ("n" . bc/go-to-next-error)
          ("p" . bc/go-to-previous-error)
          ("N" . bc/go-to-next-warning)
          ("P" . bc/go-to-previous-warning))

  :config
  (require 'flycheck)
  (add-hook 'prog-mode-hook 'flycheck-mode))

(use-package company
  :ensure t
  :config
  (company-mode))

(use-package lsp-mode
  ;; :commands lsp
  :ensure t
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  (java-mode . #'lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-enable-file-watchers nil)
  (setq read-process-output-max (* 1024 1024 3))  ; 3 mb
  (setq lsp-completion-provider :capf)
  (setq lsp-idle-delay 0.500)
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-enable nil)

  (with-eval-after-load 'lsp-intelephense
    (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))

  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-ui
  :ensure t
  :after (lsp-mode)
  :bind (:map lsp-ui-mode-map
          ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
          ([remap xref-find-references] . lsp-ui-peek-find-references))
  :init (setq lsp-ui-doc-delay 1.5
          lsp-ui-doc-position 'bottom
	        lsp-ui-doc-max-width 100
          ))

(use-package restclient
  :disabled t
  :ensure t)

(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-force-searcher 'rg)
  :init (dumb-jump-mode))

(provide 'custom-workspace)
