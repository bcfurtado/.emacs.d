(defun bc/current-project-folder ()
  (locate-dominating-file (buffer-file-name) ".git"))

(defun bc/current-file-name-in-the-project ()
  (file-relative-name (buffer-file-name) (bc/current-project-folder)))

(defun bc/get-module-name ()
  (let* ((path-file (bc/current-file-name-in-the-project))
         (module-name (substring path-file 0 (string-match ".py" path-file))))
    (replace-regexp-in-string "/" "." module-name)))

(defun bc/test-django-function ()
  (interactive)
  (require 'which-func)
  (let* ((module (bc/get-module-name))
         (func (which-function))
         (command (concat "python manage.py test " module "." func " --no-input")))
    (save-excursion
      (setq compilation-read-command t)
      (setq project-root-folder (find-file-noselect (bc/current-project-folder)))
      (set-buffer project-root-folder)
      (setq compile-command command)
      (call-interactively 'compile)
      (kill-buffer project-root-folder))))

(provide 'django-test)
;;; django-test.el ends here
