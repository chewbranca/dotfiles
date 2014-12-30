(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
;; (require 'mu4e)


;; default
(setq mu4e-maildir (expand-file-name "~/Maildir"))

(setq
 mu4e-drafts-folder "/Drafts"
 mu4e-sent-folder   "/Sent"
 mu4e-trash-folder  "/Trash"
 mu4e-refile-folder "/Archive")


;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
      '(("/INBOX"             . ?i)
        ("/Sent" . ?s)
        ("/Archive" . ?a)
        ("/Trash"     . ?t)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; 5 minute update interval
(setq mu4e-update-interval 300)

;; something about ourselves
(setq
 user-mail-address "chewbranca@linux.vnet.ibm.com"
 user-full-name  "Russell Branca"
 message-signature "--Russell\n"
 ;; message-signature
 ;;  (concat
 ;;    "Foo X. Bar\n"
 ;;    "http://www.example.com\n")
 )




;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu, 'gnutls' in Archlinux.

(require 'smtpmail)

;; (setq message-send-mail-function 'smtpmail-send-it
;;       starttls-use-gnutls t
;;       smtpmail-starttls-credentials
;;       '(("na.relay.ibm.com" 587 nil nil))
;;       ;; smtpmail-auth-credentials
;;       ;; (expand-file-name "~/.authinfo.gpg")
;;       smtpmail-default-smtp-server ""
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       smtpmail-debug-info t)
;; ;; sending mail -- replace USERNAME with your gmail username
;; ;; also, make sure the gnutls command line utils are installed
;; ;; package 'gnutls-bin' in Debian/Ubuntu

;; (require 'smtpmail)
;; (setq message-send-mail-function 'smtpmail-send-it
;;       starttls-use-gnutls t
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials
;;       '(("smtp.gmail.com" 587 "rbranca" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587)

;; alternatively, for emacs-24 you can use:
(setq message-send-mail-function 'smtpmail-send-it
    ;; smtpmail-stream-type 'starttls
    smtpmail-default-smtp-server "na.relay.ibm.com"
    smtpmail-smtp-server "na.relay.ibm.com"
    smtpmail-smtp-service 25)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

;; bookmarks
;; (add-to-list 'mu4e-bookmarks
;;              '(
;;                "list:user.couchdb.apache.org OR list:dev.couchdb.apache.org"
;;                "CouchDB Main"
;;                ?c))

;; html
(setq mu4e-html2text-command "w3m -T text/html")

