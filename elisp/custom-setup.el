(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))

(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (setq default-input-method "MacOSX")
  )

(when *is-a-linux*
  (setq x-super-keysym 'meta))		; Set Super key as Meta

(delete-selection-mode t)		; Replace selected text after paste
(setq ring-bell-function 'ignore)	; No bell please


(provide 'custom-setup)
