(use-package engine-mode
  :ensure t
  :bind ("C-c s s" . engine/search-google)
  :bind ("C-c s o" . engine/search-stakoverflow)
  :bind ("C-c s t" . engine/search-translate)
  :config
  (defengine google "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")
  (defengine stakoverflow "https://stackoverflow.com/search?q=%s")
  (defengine translate "https://translate.google.com.br/#en/pt/%s"))

(provide 'custom-misc)
