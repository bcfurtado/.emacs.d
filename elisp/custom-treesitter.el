;;; custom-treesitter.el --- Tree-sitter grammars and mode remapping  -*- lexical-binding: t; -*-

;;; Commentary:
;; Configures tree-sitter grammar sources and remaps classic major modes to
;; their tree-sitter variants for improved syntax highlighting and navigation.
;;
;; To install all grammars run: M-x bc/treesit-install-all-grammars

;;; Code:

(setq treesit-language-source-alist
  '((python     . ("https://github.com/tree-sitter/tree-sitter-python"))
    (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
    (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
    (tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
    (json       . ("https://github.com/tree-sitter/tree-sitter-json"))
    (css        . ("https://github.com/tree-sitter/tree-sitter-css"))
    (bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
    (java       . ("https://github.com/tree-sitter/tree-sitter-java"))
    (php        . ("https://github.com/tree-sitter/tree-sitter-php" "master" "php/src"))))

(defun bc/treesit-install-all-grammars ()
  "Install all configured tree-sitter language grammars."
  (interactive)
  (mapc #'treesit-install-language-grammar
        (mapcar #'car treesit-language-source-alist)))

(defun bc/treesit-install-missing-grammars ()
  "Install tree-sitter grammars that are not yet available."
  (mapc (lambda (lang)
          (unless (treesit-language-available-p lang)
            (treesit-install-language-grammar lang)))
        (mapcar #'car treesit-language-source-alist)))

(when (treesit-available-p)
  (bc/treesit-install-missing-grammars)

  (setq major-mode-remap-alist
    '((python-mode . python-ts-mode)
      (json-mode   . json-ts-mode)
      (css-mode    . css-ts-mode)
      (bash-mode   . bash-ts-mode)
      (java-mode   . java-ts-mode)
      (php-mode    . php-ts-mode))))

(use-package php-ts-mode
  :ensure t
  :when (treesit-available-p)
  :mode "\\.php\\'")

(provide 'custom-treesitter)
;;; custom-treesitter.el ends here
