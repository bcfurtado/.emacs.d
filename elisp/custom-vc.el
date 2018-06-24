(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("M-p" . git-rebase-move-line-up)
         ("M-n" . git-rebase-move-line-down))
  )

(provide 'custom-vc)
