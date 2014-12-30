(require 'cl)



(setq ido-use-virtual-buffers t
      custom-file "~/.emacs.d/custom.el"
      ido-handle-duplicate-virtual-buffers 2)

(load custom-file t)

(add-to-list 'load-path "~/.emacs.d/plugins/extra")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(require 'package)

;; (add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(better-defaults paredit
                                      ;; clojure-mode clojure-test-mode nrepl
                                      markdown-mode erc-hl-nicks ipython magit
                                      yaml-mode ghc haskell-mode window-number
                                      ghci-completion yasnippet smex
                                      diminish flymake go-mode
                                      ;; highline buffer-move rect-mark
                                      ;; color themes
                                      exec-path-from-shell
                                      color-theme-twilight
                                      color-theme-solarized
                                      geiser
                                      erlang
                                      ido-hacks
                                      twilight-theme undo-tree git-gutter
                                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; make sure $PATH is set when starting GUI
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; (mapc 'load (directory-files (concat user-emacs-directory user-login-name)
;;                              t "^[^#].*el$"))
(mapc 'load (directory-files (concat user-emacs-directory "russell")
                             t "^[^#].*el$"))

(setq smex-save-file (concat user-emacs-directory "smex-items"))
(smex-initialize)

(eshell)
