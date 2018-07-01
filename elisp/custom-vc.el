(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-c v b" . magit-blame)))

(use-package git-timemachine
  :ensure t
  :bind ("C-c v t" . git-timemachine))

(provide 'custom-vc)
