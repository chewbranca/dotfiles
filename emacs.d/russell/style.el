;;(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized/")
;;(require 'solarized-definitions)
;; (require 'solarized-dark-theme)
;; (require 'solarized-light-theme)
(add-to-list 'load-path "~/.emacs.d/themes/")
;;(require 'sunburst-theme)
;; (require 'tomorrow-night-bright-theme)

;; (load-theme 'sanityinc-tomorrow-bright)
;; (load-theme 'twilight)
(require 'tomorrow-night-bright-theme)
;; (load-theme 'sunburst)

;; Magit colorings
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "black")
     (set-face-background 'diff-refine-change "grey10")
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))
