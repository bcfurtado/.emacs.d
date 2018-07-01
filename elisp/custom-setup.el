(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))

(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (setq default-input-method "MacOSX")
  )

(when *is-a-linux*
  (setq x-super-keysym 'meta))


;; If you enable Delete Selection mode, a minor mode, then inserting
;; text while the mark is active causes the selected text to be
;; deleted first. This also deactivates the mark. Many graphical
;; applications follow this convention, but Emacs does not.
(delete-selection-mode t)


(provide 'custom-setup)
