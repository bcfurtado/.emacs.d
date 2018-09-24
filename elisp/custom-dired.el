(use-package dired
  :config
  (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1))))

(provide 'custom-dired)
