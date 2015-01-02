(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
;; (require 'mu4e)


;; default
(setq mu4e-maildir (expand-file-name "~/Maildir"))

(setq
 mu4e-drafts-folder "/Drafts"
 mu4e-sent-folder   "/Sent"
 mu4e-trash-folder  "/Trash"
 ;; mu4e-refile-folder "/Archive"
 )


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

;; show full email addresses
(setq mu4e-view-show-addresses t)

;; bookmarks
;; (add-to-list 'mu4e-bookmarks
;;              '(
;;                "list:user.couchdb.apache.org OR list:dev.couchdb.apache.org"
;;                "CouchDB Main"
;;                ?c))

;; html
(setq mu4e-html2text-command "w3m -T text/html")



(setq mu4e-refile-folder
  (lambda (msg)
    (cond
      ;; messages to the couchdb mailing list go to the /couchdb folder
      ((mu4e-message-contact-field-matches msg :to
        "dev@couchdb.apache.org")
        "/CouchDB")
      ((mu4e-message-contact-field-matches msg :to
        "user@couchdb.apache.org")
        "/CouchDB")
      ((mu4e-message-contact-field-matches msg :to
        "commits@couchdb.apache.org")
        "/CouchDB-Commits")
      ;; messages with GitHub in the subject go to /GitHub
      ((string-match "GitHub"
        (mu4e-message-field msg :subject))
        "/GitHub")
      ;; GitHub notifications goto /GitHub
      ((mu4e-message-contact-field-matches msg :from "notifications@github.com")
        "/GitHub")
      ;; messages with FogBugz in the subject go to /FogBugz
      ((string-match "FogBugz"
        (mu4e-message-field msg :subject))
        "/FogBugz")
      ;; messages sent directly to me go to /private
      ;; also `mu4e-user-mail-address-p' can be used
      ((mu4e-message-contact-field-matches msg :to "chewbranca@linux.vnet.ibm.com")
       "/Private")
      ;; messages sent by me go to the sent folder
      ((mu4e-message-contact-field-matches msg :from "chewbranca@linux.vnet.ibm.com")
        mu4e-sent-folder)
      ;; messages sent by me go to the sent folder
      ;; TODO: this breaks and sends lots of things to sent folder
      ;; ((find-if
      ;;   (lambda (addr)
      ;;     (mu4e-message-contact-field-matches msg :from addr))
      ;;   mu4e-user-mail-address-list)
      ;;  mu4e-sent-folder)
      ;; everything else goes to /archive
      ;; important to have a catch-all at the end!
      (t  "/Archive"))))
