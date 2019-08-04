;; Instant Access to init.el
(global-set-key (kbd "<f9>") 'bc/insert-jira-task-id)
(global-set-key (kbd "<f8>") 'open-init-el)
(global-set-key (kbd "<f1>") 'toggle-truncate-lines)
(global-set-key (kbd "<f2>") 'find-file-at-point)
(global-set-key (kbd "C-c c") 'copy-file-name-to-clipboard)
(global-set-key (kbd "C-c M-o") 'browse-url)

;; Naming
(global-set-key (kbd "C-c m -") (λ (replace-region-by 's-dashed-words)))
(global-set-key (kbd "C-c m _") (λ (replace-region-by 's-snake-case)))
(global-set-key (kbd "C-c m c") (λ (replace-region-by 's-lower-camel-case)))
(global-set-key (kbd "C-c m C") (λ (replace-region-by 's-upper-camel-case)))

(provide 'custom-keybinds)
;;; custom-keybinds.el ends here
