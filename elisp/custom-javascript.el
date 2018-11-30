(use-package js
  :bind (:map js-mode-map
          ("M-." . 'lsp-ui-peek-find-definitions)
          ("M-?" . 'lsp-ui-peek-find-references)))

;; The JavaScript LSP is required in order to use
;; lsp-javascript-typescript mode. In order to install, type:
;; npm i -g javascript-typescript-langserver
(use-package lsp-javascript-typescript
  :ensure t
  :config
  (add-hook 'js-mode-hook 'lsp-javascript-typescript-enable))


(use-package vue-mode
  :ensure t
  :config
  (setq mmm-submode-decoration-level 0))

(use-package lsp-vue
  :ensure t
  :config
  (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable))

(provide 'custom-javascript)
