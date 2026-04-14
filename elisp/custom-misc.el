(use-package engine-mode
  :ensure t
  :bind ("C-c s s" . engine/search-google)
  :bind ("C-c s t" . engine/search-translate)
  :config
  (defengine google "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")
  (defengine translate "https://translate.google.com.br/#en/pt/%s"))


(use-package package-lint
  :ensure t)

(use-package csv-mode
  :ensure t
  :hook (csv-mode . csv-align-mode))


(provide 'custom-misc)
