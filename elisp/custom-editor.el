(use-package drag-stuff
  :ensure t
  :bind (("M-p" . drag-stuff-up)
         ("M-n" . drag-stuff-down)))

(use-package bind-key
  :ensure t
  :config
  (bind-key "C-c d" 'duplicate-current-line-or-region)
  (bind-key "M-j" (λ (join-line -1)))
  )

(use-package expand-region
  :ensure t
  :demand t
  :bind (("C-M-SPC" . er/expand-region)
         ("C-M-=" . er/expand-region)
         ("C-M--" . er/contract-region)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :bind ("M-s" . sp-splice-sexp)
  :init
  (smartparens-global-mode 1)
  (smartparens-strict-mode 1)
  (require 'smartparens-config))

(use-package counsel
  :ensure t
  :bind (("C-s" . swiper)
         ("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x)
         ("M-i" . counsel-imenu)
         ("C-c s a" . counsel-ag)
         ("C-c s g" . counsel-git-grep))
  :config
  (ivy-mode t))


(provide 'custom-editor)
