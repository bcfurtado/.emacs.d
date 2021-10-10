(use-package lua-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode)))

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile*" . dockerfile-mode)))

(use-package sqlformat
  :ensure t)

(use-package sql
  :after (sqlformat)
  :bind (:map sql-mode-map
          ("C-c C-f" . sqlformat)))


;; Java support
(use-package treemacs
  :ensure t
  :disabled t)

(use-package yasnippet
  :ensure t
  :disabled t)

(use-package hydra
  :ensure t)

(use-package lsp-java
  :ensure t
  :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t
  :disabled t
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java
  :disabled t
  :after (lsp-java))

(use-package lsp-java-treemacs
  :disabled t
  :after (treemacs))

;; RSS Reader
(use-package elfeed
  :ensure t
  :bind ("<f5>" . 'elfeed)
  :config
  (setf url-queue-timeout 30)
  (setq elfeed-feeds
    '("http://nullprogram.com/feed/"
       "http://planet.emacsen.org/atom.xml"
       "http://bcfurtado.com/feed.xml")))

(use-package ccls
  :ensure t)

(use-package deadgrep
  :ensure t)

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character))

(use-package docker
  :ensure t)

(use-package poetry
  :ensure t)

(use-package go-mode
  :ensure t)


(defun bc/crux-duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated.  However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (pcase-let* ((origin (point))
               (`(,beg . ,end) (crux-get-positions-of-line-or-region))
               (region (buffer-substring-no-properties beg end)))
    (dotimes (_i arg)
      (goto-char end)
      (newline)
      (insert region)
      (setq end (point)))
    (goto-char (+ origin (* (length region) arg) arg))))
(provide 'custom-experimental)
