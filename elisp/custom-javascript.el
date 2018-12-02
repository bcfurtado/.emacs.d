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

(defun my-company-transformer (candidates)
  (let ((completion-ignore-case t))
    (all-completions (company-grab-symbol) candidates)))

(defun my-js-hook nil
  (make-local-variable 'company-transformers)
  (push 'my-company-transformer company-transformers))

(add-hook 'js-mode-hook 'my-js-hook)

(defun my-vue-hook nil
  (linum-mode 1)
  (editorconfig-apply))


(use-package vue-mode
  :ensure t
  :mode "\\.vue\\'"
  :config
  (setq mmm-submode-decoration-level 0)
  (add-hook 'vue-mode-hook 'my-vue-hook)
  (add-hook 'vue-html-mode-hook 'my-vue-hook))

;; (use-package lsp-vue
;;   :ensure t
;;   :after (vue-mode lsp-mode)
;;   :hook ((vue-mode . lsp-vue-enable) (vue-mode . flycheck-mode))
;;   :config
;;   (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable))

(provide 'custom-javascript)
