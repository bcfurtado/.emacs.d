(defun find-node-modules-folder ()
  "Return the node_module path of the project."
  (locate-dominating-file
    (or (buffer-file-name) default-directory)
    "node_modules"))

(defun find-eslint-executable (path)
  "Return the eslint executable path."
  (expand-file-name "node_modules/.bin/eslint" path))

(defun configure-eslint-flycheck-checker ()
  "Use the locally installed eslint."
  (require 'flycheck)
  (flycheck-mode)
  (let* ((folder (find-node-modules-folder))
          (eslint (and folder (find-eslint-executable folder))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun my-js-mode-hook ()
  "Javascript hook."
  (configure-eslint-flycheck-checker))

(use-package add-node-modules-path
  :ensure t)

(use-package js
  :bind (:map js-mode-map
          ("C-<f9>" . bc/javascript--add-debugger)
          ("C-M-<f9>" . bc/javascript--remove-all-debugger)
          ("M-." . 'lsp-ui-peek-find-definitions)
          ("M-?" . 'lsp-ui-peek-find-references))
  :config
  (add-hook 'js-mode-hook #'my-js-mode-hook))

(use-package js2-mode
  :ensure t)

(use-package js2-refactor
  :ensure t
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (setq js2-skip-preprocessor-directives t)
  (js2r-add-keybindings-with-prefix "C-c C-m"))


(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :config
  (setq mmm-submode-decoration-level 0))

(use-package web-mode
  :ensure t)

(defun my-mmm-mode-hook ()
  (editorconfig-apply)
  (linum-mode +1))

(add-hook 'mmm-mode-hook 'my-mmm-mode-hook)

(provide 'custom-javascript)
