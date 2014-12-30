;;(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized/")
;;(require 'solarized-definitions)
;; (require 'solarized-dark-theme)
;; (require 'solarized-light-theme)
(add-to-list 'load-path "~/.emacs.d/themes/")
;;(require 'sunburst-theme)
;; (require 'tomorrow-night-bright-theme)

;; (load-theme 'sanityinc-tomorrow-bright)
;; (load-theme 'twilight)
;; (require 'tomorrow-night-bright-theme)
;; (load-theme 'sunburst)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized")
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-[light|dark] t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'twilight)

;; Magit colorings
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "black")
     (set-face-background 'diff-refine-change "grey10")
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))


(defun do-solarized-dark ()
  (interactive)
  (load-theme 'solarized-dark t)
  (custom-theme-set-faces
   'solarized-dark
   '(whitespace-space ((t (:background "#7f7f7f" :foreground "#000000"))))
   '(whitespace-line ((t (:background "#000000" :foreground "#cd00cd"))))
   '(whitespace-empty ((t (:background "#000000" :foreground "#ff00ff"))))
   '(whitespace-indentation ((t (:background "#7f7f7f" :foreground "#cd00cd"))))
   '(mode-line ((t (:foreground "#5c5cff" :background "#000000"))))
   '(mode-line-inactive ((t (:foreground "#5c5cff" :background "#000000"))))
   '(region ((t (:background "#000000"))))
   '(vertical-border ((t (:foreground "#00ff00" :background "#7f7f7f"))))
   '(minibuffer-prompt ((t (:foreground "#0000ee"))))))
