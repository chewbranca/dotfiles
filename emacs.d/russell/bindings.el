;; (global-set-key (kbd "C-x C-b") 'ibuffer) ;; set by better-defaults

(global-set-key (kbd "C-c C-j") 'nrepl-jack-in)

(global-set-key (kbd "C-c f") 'find-file-in-project)
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

(add-hook 'prog-mode-hook
          (defun my-kill-word-key ()
            (local-set-key (kbd "C-M-h") 'backward-kill-word)))

(global-set-key (kbd "C-M-h") 'backward-kill-word)

(global-set-key (kbd "C-x C-i") 'imenu)

(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2)))

(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x C-m") 'shell)

(global-set-key (kbd "C-c q") 'join-line)
(global-set-key (kbd "C-c g") 'magit-status)

(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(progn
     (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-(") 'paredit-backward-slurp-sexp)))

;; Functions

(global-set-key (kbd "C-x C-P")
                (defun paren-match ()
                  "Tries to jump to the matching parenthesis to the one currently
under the point. Useful if the matching paren is out of sight. "
                  (interactive)
                  (cond ((looking-at "[{\[\(]") (forward-sexp 1) (backward-char))
                        ((looking-at "[]})]") (forward-char) (backward-sexp 1))
                        (t (message "Point not at a parenthesis.")))))


;; Buffer movement
;; (global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-S-down>")   'buf-move-down)
;; (global-set-key (kbd "<C-S-left>")   'buf-move-left)
;; (global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; Rect mode
;; (require 'rect-mark)
;; (global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
;; (global-set-key (kbd "C-x r C-x")   'rm-exchange-point-and-mark)
;; (global-set-key (kbd "C-x r C-w")   'rm-kill-region)
;; (global-set-key (kbd "C-x r M-w")   'rm-kill-ring-save)
;; (global-set-key (kbd "C-x r <down-mouse-1>") 'rm-mouse-drag-region)
