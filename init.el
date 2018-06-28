;; My emacs configuration
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; ensure that use-package is installed
(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))


(require 'custom-setup)
(require 'custom-functions)
(require 'custom-ui)
(require 'custom-vc)
(require 'custom-editor)
(require 'custom-workspace)
(require 'custom-python)

