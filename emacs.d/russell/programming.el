;; Octave
;; Give me octave, not objective c
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))
;; /Octave

;; Erlang
(add-to-list 'auto-mode-alist '("\\.\\(erl\\|hrl\\|app\\)$" . erlang-mode))

(add-to-list 'load-path "~/.emacs.d/plugins/extra/erlang")
(require 'erlang)
(add-to-list 'load-path "~/.emacs.d/plugins/edts")
(require 'edts-start)

;; do this better
;; (add-to-list 'load-path "/usr/local/Cellar/erlang/R15B01/lib/erlang/lib/tools-2.6.7/emacs/")

;; /Erlang

;; Markdown
(add-to-list 'auto-mode-alist '("\\.md)$" . markdown-mode))
;; /Markdown

;; Python
;;
;; ipython settings
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-to-list 'load-path "~/.emacs.d/plugins/python-mode/")
;; this will show method signatures while typing
(setq py-set-complete-keymap-p t)
(require 'python-mode)

;;Unless other libraries depend on python.el, unloading 'python is
;;recommended,as it seems to destroy python-mode user defined
;;abbreviations:
(when (featurep 'python) (unload-feature 'python t))

;; nose settings
;;(require 'nose)
;; (setq nose-global-command
;;"~/.virtualenvs/wilson-venv/bin/nosetests")

;; /Python

;; Clojure

(add-hook 'nrepl-connected-hook
          (defun pnh-clojure-mode-eldoc-hook ()
            (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)))

(setq clojure-swank-command "lein jack-in %s"
      inferior-lisp-command "lein repl"
      whitespace-style '(face trailing lines-tail tabs))

(add-hook 'clojure-mode-hook 'paredit-mode)

;; /Clojure

;; Elisp

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(define-key emacs-lisp-mode-map (kbd "C-c v") 'eval-buffer)

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)

;; /Elisp
