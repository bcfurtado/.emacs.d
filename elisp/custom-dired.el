(use-package dired
  :config
  (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1))))

(use-package dired-x)

(provide 'custom-dired)
