;; Thanks to: http://emacs-fu.blogspot.com/2010/02/dealing-with-many-buffers-ibuffer.html

(require 'ibuffer)
(setq ibuffer-saved-filter-groups
  (quote (("default"
            ("Org" ;; all org-related buffers
              (mode . org-mode))
            ("Mail"
              (or  ;; mail-related buffers
               (mode . message-mode)
               (mode . mail-mode)
               ;; etc.; all your mail related modes
               ))
            ("Cloudant Website"
             (filename . "src/cloudant/website/"))
            ("Wilson"
             (filename . "src/cloudant/wilson/"))
            ("Fabric"
             (filename . "src/cloudant/dbcore/deps/fabric"))
            ("chttpd"
             (filename . "src/cloudant/dbcore/deps/chttpd"))
            ("mem3"
             (filename . "src/cloudant/dbcore/deps/mem3"))
            ("rexi"
             (filename . "src/cloudant/dbcore/deps/rexi"))
            ("DbCore"
             (filename . "src/cloudant/dbcore"))
            ("Cloudant"
             (filename . "src/cloudant/"))
            ("Fauxton"
             (filename . "src/couchdb/src/fauxton"))
            ("CouchDB"
             (filename . "src/couchdb/"))
            ("Nodeverse"
             (filename . "src/nodeverse/"))
            ("Emacs"
             (filename . "src/dotfiles/emacs.d"))
            ("Programming" ;; prog stuff not already in MyProjectX
              (or
                (mode . c-mode)
                (mode . perl-mode)
                (mode . python-mode)
                (mode . emacs-lisp-mode)
                ;; etc
                ))
            ("ERC"   (mode . erc-mode))))))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))
