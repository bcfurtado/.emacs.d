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

(defun open-my-todo-file()
  (let ((my-todo-file "~/org-files/todo.org"))
    (when (file-readable-p my-todo-file)
      (find-file my-todo-file)
      (read-only-mode))))

(defun ensure-region-active (func &rest args)
  (when (region-active-p)
    (apply func args)))

(defun bc/javascript--add-debugger ()
  "Add debugger statement and move line down"
  (interactive)
  (insert "debugger;"))

(defun insert-current-week-date ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y) - Week $(date +%V)")))

(defun insert-current-day-date ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d) - $(date +%A)")))

(defun bc/javascript--remove-all-debugger ()
  "Add debugger statement and move line down"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (flush-lines "debugger;$")))

(provide 'custom-functions)
