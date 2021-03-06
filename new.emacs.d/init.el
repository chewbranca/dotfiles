(require 'cl)


;; heavily based on https://github.com/technomancy/dotfiles/blob/master/.emacs.d/init.el


(setq custom-file (expand-file-name "~/.emacs.d/custom.el")
      ido-use-virtual-buffers t
      ;; ido-handle-duplicate-virtual-buffers 2
      org-default-notes-file "~/src/dotfiles/.notes.org"
      org-remember-default-headline 'bottom
      org-completion-use-ido t
      load-prefer-newer t
      visible-bell t
      inhibit-startup-message t
      uniquify-buffer-name-style 'post-forward
      browse-url-browser-function 'browse-url-firefox)


;; 3rd-party packages
(dolist (l (directory-files (concat user-emacs-directory "lib") nil "^[^\.]"))
  (add-to-list 'load-path (concat user-emacs-directory "lib/" l))
  (autoload (intern l) (concat l ".el")))

;; personal stuff
(mapc 'load (directory-files (concat user-emacs-directory "russell")
                             t "^[^#].*el$"))

;; For some reason, update-directory-autoloads *always* writes its
;; paths as relative to user-emacs-directory, so we have to add
;; this. If we add user-emacs-directory by itself to load-path, Emacs
;; warns us that we shouldn't do that, so we trick it.
(add-to-list 'load-path (concat user-emacs-directory "/russell/../"))
(load (concat user-emacs-directory "my-autoload.el") t)
(load custom-file t)

(setq custom-theme-load-path
      (directory-files (concat user-emacs-directory "themes") t "^[^\.]"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'cyberpunk t)

(require 'find-file-in-project)
(add-to-list 'ffip-patterns "*.erl")
(add-to-list 'ffip-patterns "*.ex")
(add-to-list 'ffip-patterns "*.exs")
(add-to-list 'ffip-patterns "*.c")
(add-to-list 'ffip-patterns "*.cpp")
(add-to-list 'ffip-patterns "*.h")
(add-to-list 'ffip-patterns "*.fnl")
(add-to-list 'ffip-patterns "*.lua")
(add-to-list 'ffip-patterns "*.md")
(add-to-list 'ffip-patterns "*.lisp")
(add-to-list 'ffip-patterns "*.clj")
(add-to-list 'ffip-patterns "*.cljs")
(add-to-list 'ffip-patterns "*.cljc")
(add-to-list 'ffip-patterns "*.edn")
(add-to-list 'ffip-patterns "*.log")
(add-to-list 'ffip-patterns "*.sh")
(add-to-list 'ffip-patterns "*.sql")
(add-to-list 'ffip-patterns "*.txt")
(add-to-list 'ffip-patterns "*.yml")
(add-to-list 'ffip-patterns "*.xml")
(add-to-list 'ffip-patterns "*.json")
(add-to-list 'ffip-patterns "Dockerfile")

;; FIXME: shouldn't be necessary
(require 'better-defaults)

(when (require 'smex nil t)
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex))

(defalias 'yes-or-no-p 'y-or-n-p)

(column-number-mode t)

(winner-mode)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(eval-after-load 'markdown-mode
  (progn (add-hook 'markdown-mode-hook 'flyspell-mode)
         (add-hook 'markdown-mode-hook 'auto-fill-mode)))

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)

(ido-mode 1)
(ido-everywhere 1)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(eshell)
(set-face-foreground 'eshell-prompt "turquoise")
