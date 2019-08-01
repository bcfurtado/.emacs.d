(setq create-lockfiles nil)

(use-package py-isort
  :ensure t)

(require 'django-test)

(use-package python
  :init
  (require 'python)
  :bind (:map python-mode-map
          ("C-<f9>" . mw/python--add-pudb-breakpoint)
          ("C-M-<f9>" . mw/python--remove-breakpoints)
          ("<f10>" . django-test-runner)
          ("C-M-f" . sp-forward-sexp)
          ("C-M-b" . sp-backward-sexp)
          ("C-c C-t o" . py-isort-buffer))
  :config
  (add-hook 'python-mode-hook #'auto-virtualenv-set-virtualenv))

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

(provide 'custom-python)
