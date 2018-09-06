(use-package jade-mode
  :ensure t
  :mode ".*\\.jade")


(defun my-css-mode-setup ()
  (when (eq major-mode 'css-mode)
    ;; Only enable in strictly css-mode, not scss-mode (css-mode-hook
    ;; fires for scss-mode because scss-mode is derived from css-mode)
    (lsp-css-enable)))

(use-package lsp-css
  :ensure t
  :config
  (add-hook 'css-mode-hook #'my-css-mode-setup)
  (add-hook 'less-mode-hook #'lsp-less-enable)
  (add-hook 'sass-mode-hook #'lsp-scss-enable)
  (add-hook 'scss-mode-hook #'lsp-scss-enable))

(provide 'custom-web)
