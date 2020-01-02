(use-package lua-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode)))

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

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

(provide 'custom-experimental)
