(use-package lua-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode)))

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))


;; Java support
(use-package treemacs :ensure t)
(use-package yasnippet :ensure t)
(use-package hydra :ensure t)
(use-package lsp-java
  :ensure t
  :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))
(use-package lsp-java-treemacs :after (treemacs))

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

(provide 'custom-experimental)
