;; shorthand for interactive lambdas
(defmacro λ (&rest body)
  `(lambda ()
     (interactive)
     ,@body))

(defun bc/current-file-name-in-the-project ()
  (require 'which-func)
  (substring (buffer-file-name) (match-end (string-match (projectile-project-root) buffer-file-name))))

(defun bc/get-module-name ()
  (let* ((path-file (bc/current-file-name-in-the-project))
         (module-name (substring path-file 0 (string-match ".py" path-file))))
    (replace-regexp-in-string "/" "." module-name)))

(defun bc/test-django-function ()
  (interactive)
  (let* ((module (bc/get-module-name))
         (func (which-function))
         (command (concat "python manage.py test " module "." func " --no-input")))
    (projectile-test-project command)))

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun mw/python--add-pudb-breakpoint ()
  "Add pudb.set_trace() code and move line down"
  (interactive)
  (insert "import pudb; pudb.set_trace()"))

(defun mw/python--remove-breakpoints ()
  "Remove line with a pdb/pudb/ipdb breakpoint"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (flush-lines "import i?pu?db; +i?pu?db.set_trace().*$")))

(defun find-python-project-directory-root (dir)
  (let ((root-files-identifiers (concat "setup.py\\|"
                                        "requirements.txt\\|"
                                        "Pipfile\\|"
                                        "setup.cfg\\|"
                                        "tox.ini\\|"
                                        ".git$\\|"
                                        "__init__.py\\|"
                                        "__main__.py")))
    (directory-files dir nil root-files-identifiers)))


(provide 'custom-functions)
