;;; django-test.el --- Quickly execute django tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Bruno Furtado

;; Author: Bruno Furtado <bruno@bcfurtado.com>
;; Keywords: convenience

;;; Commentary:

;; Package to help you to quickly execute django tests using
;; compilation mode

;;; Code:

(require 'which-func)

(defconst django-test-manage-py "manage.py")

(defun django-test-project-folder ()
  "Return Django root project path.
Currently, we are assuming that the root folder is the one that
contains the manage.py."
  (locate-dominating-file (buffer-file-name) django-test-manage-py))

(defun django-test-file-path ()
  "Return the path of the file to be tested relative to the project root directory."
  (file-relative-name (buffer-file-name) (django-test-project-folder)))

(defun django-test-python-module-from-file-path ()
  "Return the current python module based on file path."
  (let* ((path-file (django-test-file-path))
         (module-name (substring path-file 0 (string-match ".py" path-file))))
    (replace-regexp-in-string "/" "." module-name)))

(defun django-test-run-test-at-point ()
  "Run django test at the point.
Invoke this function and you'll be promoted with the exact command to
run only the tests for the specific file.
Keep your cursor under the class name or the function and the command
will be even more specific."
  (interactive)
  (let* ((module (django-test-python-module-from-file-path))
         (func (which-function))
         (command (concat "python manage.py test " module "." func " --no-input")))
    (save-excursion
      (setq compilation-read-command t)
      (setq project-root-folder (find-file-noselect (django-test-project-folder)))
      (set-buffer project-root-folder)
      (setq compile-command command)
      (call-interactively 'compile)
      (kill-buffer project-root-folder))))

(provide 'django-test)
;;; django-test ends here
