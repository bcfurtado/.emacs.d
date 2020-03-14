(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
          ("C-c v b" . magit-blame-addition)
          ("C-c v l" . magit-log-buffer-file)
          ("C-c v o" . bc/create-or-open-existing-bitbucket-pull-request)
          ("C-c v c" . magit-file-checkout))
  :config
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1))

(use-package magithub
  :ensure t
  :disabled
  :after magit
  :config
  (magithub-feature-autoinject t)
  (setq magithub-clone-default-directory "~/Projects"))

(defun disconnect-lsp-after-git-timemachine (&rest args)
  (lsp-disconnect))

(use-package git-timemachine
  :ensure t
  :bind ("C-c v t" . 'git-timemachine)
  :init
  (add-hook 'git-timemachine-mode-hook 'diff-hl-magit-post-refresh)
  (advice-add 'git-timemachine--show-minibuffer-details :before 'disconnect-lsp-after-git-timemachine))

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
