;; Paren settings
(show-paren-mode t)                 ; turn paren-mode on
(setq show-paren-style 'expression) ; alternatives are 'parenthesis' and 'mixed'

;; Enable whitespace mode
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(global-whitespace-mode)
;; display only tails of lines longer than 80 columns, tabs and
;; trailing whitespaces
(setq whitespace-line-column 80
      whitespace-style '(face tabs trailing lines-tail space-before-tab
                              space-after-tab))

;; Set path for OSX
(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/bin" exec-path))

;; don't sleep emacs accidentally
(global-set-key [(control z)] nil)

;; don't add newline at end of file
;; (setq require-final-newline nil)

;; visual-line-mode is great for text modes
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(setq epa-armor 't)

(defalias 'yes-or-no-p 'y-or-n-p)

;; ido-ignore-files
(add-to-list 'ido-ignore-files ".beam")

;; Display column number
(column-number-mode t)
