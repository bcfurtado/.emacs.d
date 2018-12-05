;; gfm stands for github flavor mode
(defun my-gfm-mode-hook ()
  (visual-line-mode 1))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  :config
  (add-hook 'gfm-mode-hook 'my-gfm-mode-hook))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(provide 'custom-org-mode)
