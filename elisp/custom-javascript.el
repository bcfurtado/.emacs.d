(use-package js
  :bind (:map js-mode-map
          ("C-<f9>" . bc/javascript--add-debugger)
          ("C-M-<f9>" . bc/javascript--remove-all-debugger)
          ("M-." . 'lsp-ui-peek-find-definitions)
          ("M-?" . 'lsp-ui-peek-find-references)))

(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :config
  (setq mmm-submode-decoration-level 0))

(defun my-mmm-mode-hook ()
  (editorconfig-apply)
  (linum-mode +1))

(add-hook 'mmm-mode-hook 'my-mmm-mode-hook)

(provide 'custom-javascript)
