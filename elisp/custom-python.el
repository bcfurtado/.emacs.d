(setq create-lockfiles nil)

(use-package py-isort
  :ensure t)

(require 'django-test-runner)

(use-package yapfify
  :ensure t)

(use-package pyimport
  :ensure t)

(defun bc/py-organize-imports()
  (interactive)
  (pyimport-remove-unused)
  (py-isort-buffer))

(use-package python
  :init
  (require 'python)
  :after (django-test-runner)
  :bind (:map python-mode-map
          ("C-<f9>" . mw/python--add-pudb-breakpoint)
          ("C-M-<f9>" . mw/python--remove-breakpoints)
          ("<f10>" . django-test-runner)
          ("C-M-f" . sp-forward-sexp)
          ("C-M-b" . sp-backward-sexp)
          ("C-c C-t f" . yapfify-region)
          ("C-c C-t F" . yapfify-buffer)
          ("C-c C-t s" . bc/py-organize-imports)
          ("C-C C-t i" . pyimport-insert-missing)
          ("C-M-t" . scottfrazer/transpose-sexps))
  :config
  (add-hook 'python-mode-hook #'auto-virtualenv-set-virtualenv))

(use-package pyvenv
  :ensure t)

(use-package auto-virtualenv
  :ensure t)

(provide 'custom-python)
