;; Instant Access to init.el
(global-set-key (kbd "<f8>") (λ (find-file-other-window (expand-file-name "init.el" user-emacs-directory))))
(global-set-key (kbd "<f7>") 'bc/test-django-function)
(global-set-key (kbd "C-c c") 'copy-file-name-to-clipboard)

(provide 'custom-keybinds)
