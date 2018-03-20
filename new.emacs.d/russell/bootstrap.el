;; thanks to https://github.com/technomancy/dotfiles/blob/master/.emacs.d/phil/bootstrap.el
(defun pnh-reinit-libs ()
  (interactive)
  (let ((generated-autoload-file (concat user-emacs-directory "my-autoload.el")))
    (dolist (d (directory-files (concat user-emacs-directory "lib") t "^[^\.]"))
      (dolist (f (directory-files d t "\\.el$"))
        (byte-compile-file f))
      (update-directory-autoloads d))))

