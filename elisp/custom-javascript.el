(use-package js
  :bind (:map js-mode-map
          ("C-<f9>" . bc/javascript--add-debugger)
          ("M-." . 'lsp-ui-peek-find-definitions)
          ("M-?" . 'lsp-ui-peek-find-references)))

(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :config
  (setq mmm-submode-decoration-level 0))

(provide 'custom-javascript)
