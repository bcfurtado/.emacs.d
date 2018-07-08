;; Instant Access to init.el
(global-set-key (kbd "<f8>") (λ (find-file-other-window (expand-file-name "init.el" user-emacs-directory))))
(global-set-key (kbd "<f7>") 'bc/test-django-function)
(global-set-key (kbd "C-c c") 'copy-file-name-to-clipboard)

;; Naming
(global-set-key (kbd "C-c m -") (λ (replace-region-by 's-dashed-words)))
(global-set-key (kbd "C-c m _") (λ (replace-region-by 's-snake-case)))
(global-set-key (kbd "C-c m c") (λ (replace-region-by 's-lower-camel-case)))
(global-set-key (kbd "C-c m C") (λ (replace-region-by 's-upper-camel-case)))

(provide 'custom-keybinds)
