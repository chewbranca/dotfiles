;; yasnippt
(require 'yasnippet)
(yas-global-mode 1)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/snippets")
;; (yas/global-mode 1)

;; window-number
;; Enable window-number.el
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
numbers with the C-x C-j prefix.  Another mode,
`window-number-meta-mode' enables the use of the M- prefix."
  t)

(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
windows, use `window-number-mode' to display the window numbers in
the mode-line."
  t)

(window-number-mode 1)
(global-set-key "\C-c\C-j" 'window-number-select)

;; ido-hacks
;; used for M-x completion and other things
(require 'ido-hacks)
(ido-hacks-mode)
