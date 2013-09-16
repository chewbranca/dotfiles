;;(set-face-foreground 'eshell-prompt "green")
(setq eshell-history-size 1024)
(setq eshell-prompt-regexp "^[^#$]*[#$] ")

(load "em-hist")           ; So the history vars are defined
(if (boundp 'eshell-save-history-on-exit)
    (setq eshell-save-history-on-exit t)) ; Don't ask, just save
;(message "eshell-ask-to-save-history is %s"
                                        ;eshell-ask-to-save-history)
(if (boundp 'eshell-ask-to-save-history)
        (setq eshell-ask-to-save-history 'always)) ; For older(?)
                                 ; version
;(message "eshell-ask-to-save-history is %s"
                                        ;eshell-ask-to-save-history)

(defun eshell/ef (fname-regexp &rest dir) (ef fname-regexp default-directory))


;;; ---- path manipulation

(defun pwd-repl-home (pwd)
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
         (home-len (length home)))
    (if (and
         (>= (length pwd) home-len)
         (equal home (substring pwd 0 home-len)))
        (concat "~" (substring pwd home-len))
      pwd)))

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'")))
          (git-status (shell-command-to-string (concat "cd " pwd " && git status -s"))))
      (concat
       (propertize (concat "["
                           (if (> (length git-output) 0)
                               (substring git-output 0 -1)
                             "(no branch)")
                           "]") 'face `(:foreground "blue"))
       (if (> (length git-status) 0)
           (propertize "(⚒)" 'face `(:foreground "red"))
         "")))))

(setq eshell-prompt-function
      (lambda ()
        (concat
         (propertize ((lambda (p-lst)
                        (if (> (length p-lst) 3)
                            (concat
                             (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                                                        (substring elm 0 1)))
                                        (butlast p-lst 3)
                                        "/")
                             "/"
                             (mapconcat (lambda (elm) elm)
                                        (last p-lst 3)
                                        "/"))
                          (mapconcat (lambda (elm) elm)
                                     p-lst
                                     "/")))
                      (split-string (pwd-repl-home (eshell/pwd)) "/")) 'face `(:foreground "green"))
         (or (curr-dir-git-branch-string (eshell/pwd)))
         ;; (propertize " ➤ " 'face 'default)
         (propertize " $ " 'face `(:foreground "green")))))

(setq eshell-highlight-prompt nil)

(eval-after-load 'esh-opt
  '(progn
     (setq eshell-cmpl-cycle-completions nil)

     (when (not (functionp 'eshell/rgrep))
       (defun eshell/rgrep (&rest args)
         "Use Emacs grep facility instead of calling external grep."
         (eshell-grep "rgrep" args t)))

     (defun eshell/cdg ()
       "Change directory to the project's root."
       (eshell/cd (locate-dominating-file default-directory ".git")))))
