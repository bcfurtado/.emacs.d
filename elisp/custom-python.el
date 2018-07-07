(setq create-lockfiles nil)

(use-package python
  :init
  (require 'python)
  :bind (:map python-mode-map
              ("C-<f9>" . mw/python--add-pudb-breakpoint)
              ("C-M-<f9>" . mw/python--remove-breakpoints)))

(use-package company
  :ensure t
  :config
  (company-mode))

(use-package pyvenv
  :ensure t)

(use-package auto-virtualenv
  :ensure t)

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-mode
  :ensure t
  :config

  ;; make sure we have lsp-imenu everywhere we have LSP
  (require 'lsp-imenu)
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

  ;; get lsp-python-enable defined
  (defun find-python-project-directory-root (dir)
    (let ((root-files-identifiers (concat "setup.py\\|"
                                          "requirements.txt\\|"
                                          "Pipfile\\|"
                                          "setup.cfg\\|"
                                          "tox.ini\\|"
                                          ".git$\\|"
                                          "__init__.py\\|"
                                          "__main__.py")))
      (directory-files dir nil root-files-identifiers)))

  (lsp-define-stdio-client lsp-python "python"
                           (lsp-make-traverser #'find-python-project-directory-root)
                           '("pyls"))


  ;; lsp extras
  (use-package lsp-ui
    :ensure t
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode))

  ;; NB: only required if you prefer flake8 instead of the default
  ;; send pyls config via lsp-after-initialize-hook -- harmless for
  ;; other servers due to pyls key, but would prefer only sending this
  ;; when pyls gets initialised (:initialize function in
  ;; lsp-define-stdio-client is invoked too early (before server
  ;; start)) -- cpbotha
  (defun lsp-set-cfg ()
    (let ((lsp-cfg `(:pyls (:configurationSources ("flake8")))))
      ;; TODO: check lsp--cur-workspace here to decide per server / project
      (lsp--set-configuration lsp-cfg)))

  (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg))

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
  (lsp-python-enable))

(add-hook 'python-mode-hook #'custom-python-mode-hook)

(provide 'custom-python)
