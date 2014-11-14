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

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode 1)

(defalias 'redo 'undo-tree-redo)
;; (global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
;; (global-set-key (kbd "C-S-z") 'redo) ; 【Ctrl+Shift+z】;  Mac style
;; (global-set-key (kbd "C-y") 'redo) ; 【Ctrl+y】; Microsoft Windows style
(global-set-key (kbd "C-M-/") 'redo)

;; git-gutter (https://github.com/syohex/emacs-git-gutter)
(require 'git-gutter)
(global-git-gutter-mode +1)
;; If you enable git-gutter-mode for some modes
;; (add-hook 'ruby-mode-hook 'git-gutter-mode)
(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
;; Stage current hunk
;; (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)
;; Revert current hunk
;; (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)


;; grep ignore
(eval-after-load 'grep
  '(when (boundp 'grep-find-ignored-files)
     (add-to-list 'grep-find-ignored-files "*.beam")))


(setq grep-command "grep -nH -r --exclude-dir='.git' --exclude-dir='.eunit' --exclude='*.beam'")


;; epa
(require 'epa)
(epa-file-enable)
