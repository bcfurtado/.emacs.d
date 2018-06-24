(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode 1)
  :bind* (("M-p" . drag-stuff-up)
          ("M-n" . drag-stuff-down)))


(provide 'custom-editor)
