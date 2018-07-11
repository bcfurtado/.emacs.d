(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-c v b" . magit-blame)))

(use-package magithub
  :ensure t
  :after magit
  :config
  (magithub-feature-autoinject t)
  (setq magithub-clone-default-directory "~/Projects"))

(use-package git-timemachine
  :ensure t
  :bind ("C-c v t" . git-timemachine))

(use-package diff-hl
  :ensure t
  :demand t
  :bind (("C-c v p" . diff-hl-previous-hunk)
         ("C-c v n" . diff-hl-next-hunk)
         ("C-c v r" . diff-hl-revert-hunk))
  :config
    (diff-hl-flydiff-mode +1)
    (global-diff-hl-mode +1)
    (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
    (add-hook 'dired-mode-hook 'diff-hl-dired-mode-unless-remote))

(use-package browse-at-remote
  :ensure t
  :bind ("C-c v g" . browse-at-remote))

(use-package ibuffer-vc
  :ensure t
  :config
  (add-hook 'ibuffer-mode-hook 'ibuffer-vc-set-filter-groups-by-vc-root))

(provide 'custom-vc)
