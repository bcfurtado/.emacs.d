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

;; avoid customized settings on the init.el file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file) (load custom-file))(load custom-file)

(require 'custom-setup)
(require 'custom-functions)
(require 'custom-keybinds)
(require 'custom-ui)
(require 'custom-vc)
(require 'custom-editor)
(require 'custom-misc)
(require 'custom-workspace)
(require 'custom-web)
(require 'custom-python)
(require 'custom-javascript)
(require 'custom-org-mode)

;; after start up
(open-my-todo-file)
