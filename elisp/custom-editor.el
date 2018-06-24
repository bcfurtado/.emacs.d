(use-package drag-stuff
  :ensure t
  :bind (("M-p" . drag-stuff-up)
         ("M-n" . drag-stuff-down)))

(use-package bind-key
  :ensure t
  :config
  (bind-key "M-j" (λ (join-line -1)))
  )




(provide 'custom-editor)
