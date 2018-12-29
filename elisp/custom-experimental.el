(use-package lua-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode)))

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(provide 'custom-experimental)
