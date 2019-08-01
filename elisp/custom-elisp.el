;;; package --- Summary

;;; Code:
(use-package emacs-lisp
  :config
  (require 'emacs-lisp-mode)
  :bind (:map emacs-lisp-mode-map
          ("C-j" . eval-print-last-sexp)))

(use-package suggest
  :ensure t)

;;; Commentary:

(provide 'custom-elisp)

;;; custom-elisp.el ends here
