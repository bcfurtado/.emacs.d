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

(defun replace-region-by (fn)
  (let* ((beg (region-beginning))
         (end (region-end))
         (contents (buffer-substring beg end)))
    (delete-region beg end)
    (insert (funcall fn contents))))

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

(defun bc/insert-jira-task-id ()
  (interactive)
  (insert
    (string-trim
      (shell-command-to-string "git rev-parse --abbrev-ref HEAD | cut -c 1-8"))))

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

(defun open-my-todo-file()
  (let ((my-todo-file "~/org-files/todo.org"))
    (when (file-readable-p my-todo-file)
      (find-file my-todo-file)
      (read-only-mode))))

(defun ensure-region-active (func &rest args)
  (when (region-active-p)
    (apply func args)))

(provide 'custom-functions)
