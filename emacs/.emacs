(setq inhibit-startup-screen t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t)  ; Inhibts the startup screen of emacs

;; set coding system so emacs doesn't choke on melpa file listings
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)

(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

(setq buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


;; Disable menubar and toolbar in emacs
(menu-bar-mode 0)
(tool-bar-mode 0)

(setq visible-bell t)

;; Other GUI configuration for emacs
(scroll-bar-mode 0) ; Remove ugly scroll-bar in emacs
(column-number-mode 1) ; Show column number
(show-paren-mode 1)
;; Number rows in emacs
(global-linum-mode 1)
(setq linum-format " %d ")

;; Backup for emacs
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
;; (setq make-backup-files nil)

;; Enable IDO mode everywhere
;; Seriously every where
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(winner-mode t)

;; Add melpa to package archives
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     t)


;; (setq package-enable-at-startup nil)
(package-initialize)

;; Bootstrap plugin loader
(load "~/.emacs.rc/rc.el")

;; Set the font to be used in emacs
(set-default-font "Hack-11")

(rc/require-theme 'gruvbox)

;; (require 'doom-themes)
;; (load-theme 'doom-one t)

;; (rc/require 'base16-theme)
;; (load-theme 'base16-atelier-dune t)

;; Map M-X to smex
(rc/require 'smex 'ido-completing-read+)
(global-set-key (kbd "M-x") 'smex)
(global-unset-key "\C-z")
(global-set-key "\C-z" 'advertised-undo)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(rc/require 'hlinum)
(hlinum-activate)

;; Window manipulation key remapping
;; Vertiacal split, kill horizontal-split and window-change respectivily
(define-key key-translation-map (kbd "C-x C-v") (kbd "C-x 3-"))
(define-key key-translation-map (kbd "C-x C-k") (kbd "C-x 0-"))
(define-key key-translation-map (kbd "C-x C-h") (kbd "C-x 2-"))

(define-key key-translation-map (kbd "<C-tab>") (kbd "C-x o-"))

;; Packages that don't require configurations
;; Emacs modes
(rc/require 'go-mode
	    'yaml-mode
	    'cmake-mode
	    'clojure-mode
	    'rust-mode
	    'markdown-mode
	    'helm-ls-git
	    'htmlize
	    'nix-mode
	    'dockerfile-mode
	    'toml-mode
	    'elm-mode
	    'nginx-mode
	    'kotlin-mode
	    'php-mode
	    ;; Other modes
	    'ack
	    'org-pomodoro
	    'powerline
	    'auto-complete)

;; (rc/require 'moe-theme)
;; (require 'moe-theme)
;; (setq moe-theme-highlight-buffer-id t)
;; (setq moe-light-pure-white-background-in-terminal t)

;; (load-theme 'moe-dark t)
;; (moe-dark)
;; (moe-theme-set-color 'cyan)

;; (require 'git-gutter-fringe+)
;; (global-git-gutter+-mode)

;; (set-face-foreground 'git-gutter-fr+-modified "#b58900")
;; (set-face-foreground 'git-gutter-fr+-added    "#859900")
;; (set-face-foreground 'git-gutter-fr+-deleted  "#dc322f")

;; (set-face-background 'git-gutter-fr+-modified "none")
;; (set-face-background 'git-gutter-fr+-added    "none")
;; (set-face-background 'git-gutter-fr+-deleted  "none")

;; (setq-default left-fringe-width  24)
;; (setq-default right-fringe-width 24)

(powerline-default-theme)
;; auto-complete default configuration
(ac-config-default)

;; A hook to change the linum mode for certain modes
(add-hook 'after-change-major-mode-hook
            '(lambda ()
               (linum-mode (if (or (equal major-mode 'text-mode) (equal major-mode 'term-mode) (equal major-mode 'help-mode)) 0 1))))

(rc/require 'multi-term)
(setq multi-term-program "/bin/bash")

(global-set-key (kbd "C-x C-m") 'multi-term)

;; Add a bunch of other modes using their rc files in ~/.emacs.rc
(load "~/.emacs.rc/keybindings-rc.el")
(load "~/.emacs.rc/cppmode-rc.el")
(load "~/.emacs.rc/paredit-rc.el")
(load "~/.emacs.rc/autopair-rc.el")
(load "~/.emacs.rc/elisp-rc.el")
(load "~/.emacs.rc/haskell-rc.el")
(load "~/.emacs.rc/whitespace-rc.el")
(load "~/.emacs.rc/magit-rc.el")
(load "~/.emacs.rc/multiple-cursors-rc.el")
(load "~/.emacs.rc/ggtags-rc.el")
(load "~/.emacs.rc/dired-rc.el")
(load "~/.emacs.rc/yasnippet-rc.el")
(load "~/.emacs.rc/rainbow-rc.el")
(load "~/.emacs.rc/js-rc.el")
(load "~/.emacs.rc/neotree-rc.el")
(load "~/.emacs.rc/company-rc.el")
(load "~/.emacs.rc/editorconfig-rc.el")
(load "~/.emacs.rc/racer-rc.el")
(load "~/.emacs.rc/helm-rc.el")


(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

(rc/require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-items '((recents  . 8)
			(bookmarks . 5)
			(projects . 5)
			(registers . 5)))

(setq dashboard-banner-logo-title "Fristonio")
(setq dashboard-startup-banner 1)

(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

