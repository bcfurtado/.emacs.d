(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))

(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (setq default-input-method "MacOSX"))

(use-package exec-path-from-shell
  :ensure t
  :defer 5
  :if *is-a-mac*
  :config
  (exec-path-from-shell-initialize))

(when *is-a-linux*
  (setq x-super-keysym 'meta))		; Set Super key as Meta

(delete-selection-mode t)		; Replace selected text after paste
(setq ring-bell-function 'ignore)	; No bell please
(defalias 'yes-or-no-p 'y-or-n-p)	; Use y or n to anwser confirmations


(provide 'custom-setup)
