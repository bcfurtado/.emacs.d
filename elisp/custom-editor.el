(use-package drag-stuff
  :ensure t
  :bind* (("C-M-p" . drag-stuff-up)
          ("C-M-n" . drag-stuff-down)))

(use-package bind-key
  :ensure t
  :config
  (bind-key "M-j" (λ (join-line -1)))
  (bind-key "M-J" (λ (join-line -1) (just-one-space 0))))

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

(use-package helpful
  :ensure t
  :bind (("C-h k" . helpful-key)
          ("C-c C-d" . helpful-at-point)
          ("C-h F" . helpful-function)
          ("C-h C" . helpful-command)))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode t)
  (setq ivy-use-selectable-prompt t))

(use-package ivy-rich
  :ensure t
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) 'ivy-format-function-line)
  (setq counsel-describe-function-function 'helpful-callable)
  (setq counsel-describe-variable-function 'helpful-variable)
  :bind (("C-h f" . counsel-describe-function)
          ("C-h v" . counsel-describe-variable)))

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
         ("C-c d" . bc/crux-duplicate-current-line-or-region)
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
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-relative-timestamps t
        undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff t
        undo-tree-auto-save-history t
        undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))
        undo-tree-enable-undo-in-region nil))

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
    super-save-remote-files nil
    auto-save-default nil)
  (add-to-list 'super-save-triggers 'ace-window)
  (add-to-list 'super-save-triggers 'magit-status)
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

(use-package hippie-exp
  :bind (("C-." . hippie-expand)))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-M->") 'mc/mark-next-symbol-like-this)
  (global-set-key (kbd "C-M-<") 'mc/mark-previous-symbol-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))


;; Save the last cursor position.
(save-place-mode 1)

;; Don't save temporary files everywhere
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; Show column number
(setq column-number-mode t)

;; Enable winner mode
(winner-mode t)

;; Enable disabled commands
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(advice-add 'downcase-region :around 'ensure-region-active)
(advice-add 'upcase-region :around 'ensure-region-active)

;; Prefer vertical splits over horizontal ones
(setq split-width-threshold 1)

;; Do not automatically update buffers when the file change on disk
(global-auto-revert-mode 0)
(diminish 'auto-revert-mode)

(provide 'custom-editor)
