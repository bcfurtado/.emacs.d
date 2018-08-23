(use-package drag-stuff
  :ensure t
  :bind* (("M-p" . drag-stuff-up)
          ("M-n" . drag-stuff-down)))

(use-package bind-key
  :ensure t
  :config
  (bind-key "M-j" (λ (join-line -1))))

(use-package expand-region
  :ensure t
  :demand t
  :bind (("C-M-SPC" . er/expand-region)
         ("C-M-=" . er/expand-region)
         ("C-M--" . er/contract-region)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :bind ("M-s" . sp-splice-sexp)
  :init
  (smartparens-global-mode t)
  (smartparens-strict-mode t)
  (show-smartparens-global-mode t)
  (require 'smartparens-config))

(use-package highlight-symbol
  :ensure t
  :diminish highlight-symbol-mode
  :bind (("M-]" . highlight-symbol-next)
         ("M-[" . highlight-symbol-prev))
  :init
  (add-hook 'prog-mode-hook (λ (highlight-symbol-mode t))))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode t))

(use-package counsel
  :ensure t
  :bind (("C-s" . swiper)
         ("C-x C-f" . counsel-find-file)
         ("M-x" . counsel-M-x)
         ("M-i" . counsel-imenu)
         ("C-c s a" . counsel-ag)
         ("C-c s g" . counsel-git-grep)
         ("C-c s r" . counsel-rg)))

(use-package zoom
  :ensure t
  :diminish zoom-mode
  :config (zoom-mode t))

(use-package crux
  :ensure t
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-c d" . crux-duplicate-current-line-or-region)
         ("C-c M-d" . crux-duplicate-and-comment-current-line-or-region)
         ("C-c R" . crux-rename-file-and-buffer)
         ("C-c D" . crux-delete-file-and-buffer)))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (add-hook 'prog-mode-hook 'linum-mode))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode t)
  (which-key-setup-side-window-right))

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(use-package subword
  :diminish subword-mode
  :init
  (global-subword-mode t))

(use-package super-save
  :ensure t
  :diminish super-save-mode
  :config
  (setq super-save-auto-save-when-idle t
        super-save-idle-duration 5
        super-save-triggers (append super-save-triggers '("magit-status")))
  (super-save-mode +1))

(use-package avy
  :ensure t
  :bind ("C-c SPC" . 'avy-goto-char-timer)
  :config
  (setq avy-all-windows nil)
  (setq avy-background t)
  (setq avy-keys
      (nconc (number-sequence ?a ?z)
             (number-sequence ?A ?Z)
             (number-sequence ?1 ?9)
             '(?0))))

(use-package ace-window
  :ensure t
  :diminish ace-window-mode
  :bind
  ("M-o" . ace-window)
  :config
  (set-face-attribute 'aw-leading-char-face nil
                      :foreground "deep sky blue"
                      :weight 'bold
                      :height 2.0)
  (set-face-attribute 'aw-mode-line-face nil
                      :inherit 'mode-line-buffer-id
                      :foreground "lawn green")
  (setq aw-scope 'frame)
  (setq aw-dispatch-always t)
  (setq aw-keys '(?q ?w ?e ?r ?a ?s ?d ?f))
  (setq aw-dispatch-alist '((?c aw-swap-window "Ace - Swap Window")
                            (?n aw-flip-window)))
  (ace-window-display-mode t))

;; No tabs
(setq tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; Save the last cursor position.
(save-place-mode 1)

;; No whitespaces
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'custom-editor)
