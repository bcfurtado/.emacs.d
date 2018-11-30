(setq create-lockfiles nil)

(defun lsp-set-cfg ()
  (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
    (lsp--set-configuration lsp-cfg)))

(use-package python
  :init
  (require 'python)
  :bind (:map python-mode-map
          ("C-<f9>" . mw/python--add-pudb-breakpoint)
          ("C-M-<f9>" . mw/python--remove-breakpoints)
          ("C-M-f" . sp-forward-sexp)
          ("C-M-b" . sp-backward-sexp))
  :config
  (lsp-define-stdio-client lsp-python "python"
                           (lsp-make-traverser 'find-python-project-directory-root)
                           '("pyls"))

  (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg))

(use-package pyvenv
  :ensure t)

(use-package auto-virtualenv
  :ensure t)

(use-package dired-x
  :config
  (setq-default dired-omit-files-p t)
  (setq dired-omit-files
    (concat dired-omit-files "$\\|^__pycache__$\\|^\\.pyc$\\|^\\.DS_Store$"))
  )

(defun custom-python-mode-hook ()
  ;; The order is important here. We need enable the virtualenv first
  ;; and then enabled lsp-python
  (auto-virtualenv-set-virtualenv)
  (lsp-python-enable)
  (flycheck-mode))

(add-hook 'python-mode-hook #'custom-python-mode-hook)

(provide 'custom-python)
