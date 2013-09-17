(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(add-to-list 'load-path "~/.emacs.d/plugins/extra/slime/")  ; your SLIME directory
(add-to-list 'load-path "~/.emacs.d/plugins/extra/slime/contrib")
(require 'slime)
(slime-setup)


