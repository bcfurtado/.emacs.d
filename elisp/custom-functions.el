;; shorthand for interactive lambdas
(defmacro λ (&rest body)
  `(lambda ()
     (interactive)
     ,@body))

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

(defun bc/python--jump-to-test ()
  "Open python test case"
  (interactive)
  (let ((test-file (concat default-directory "tests/" "test_" (buffer-name))))
    (when (file-readable-p test-file)
      (find-file test-file))))

(defun bc/insert-jira-task-id ()
  (interactive)
  (insert
    (string-trim
      (shell-command-to-string "git rev-parse --abbrev-ref HEAD | cut -c 1-9"))))

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

(defun bc/create-github-pull-request()
  "This function parse magit-process buffer and retrives the \
pull-request url so it can be open on the browser"
  (interactive)
  (with-current-buffer (magit-process-buffer t)
    (goto-char (point-max)) ;; Same as (end-of-buffer)
    (let ((start-pos (search-backward-regexp "https://github.com/.*/pull/new/.*$" nil t 1)))
      (when start-pos
        (browse-url (string-trim (buffer-substring-no-properties start-pos (goto-char (match-end 0)))))
        ))))

(defun bc/follow-compilation (&rest args)
  (when (get-buffer "*compilation*")
    (switch-to-buffer-other-window "*compilation*")))

(advice-add
 'compile
 :after 'bc/follow-compilation)

(defun open-init-el ()
  (interactive)
  (find-file-other-window (expand-file-name "init.el" user-emacs-directory)))

;; from emacs 26.3
(eval-after-load "rect"
  '(defun rectangle--default-line-number-format (start end start-at)
     (concat "%"
       (int-to-string (length (int-to-string (+ (count-lines start end)
                                               start-at))))
       "d")))


;; https://emacs.stackexchange.com/questions/11061/how-to-transpose-two-arguments-of-a-function-in-python
(defun scottfrazer/transpose-sexps ()
  "If point is after certain chars transpose chunks around that.
Otherwise transpose sexps."
  (interactive "*")
  (if (not (looking-back "[,]\\s-*" (point-at-bol)))
      (progn (transpose-sexps 1) (forward-sexp -1))
    (let ((beg (point)) end rhs lhs)
      (while (and (not (eobp))
                  (not (looking-at "\\s-*\\([,]\\|\\s)\\)")))
        (forward-sexp 1))
      (setq rhs (buffer-substring beg (point)))
      (delete-region beg (point))
      (re-search-backward "[,]\\s-*" nil t)
      (setq beg (point))
      (while (and (not (bobp))
                  (not (looking-back "\\([,]\\|\\s(\\)\\s-*" (point-at-bol))))
        (forward-sexp -1))
      (setq lhs (buffer-substring beg (point)))
      (delete-region beg (point))
      (insert rhs)
      (re-search-forward "[,]\\s-*" nil t)
      (save-excursion
        (insert lhs)))))

(provide 'custom-functions)
;;; custom-functions.el ends here
