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
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

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


(setq package-enable-at-startup nil)
(package-initialize)

;; Bootstrap plugin loader
(load "~/.emacs.rc/rc.el")

;; Set the font to be used in emacs
(set-default-font "Hack-10.3")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" default)))
 '(package-selected-packages
   (quote
    (racer editorconfig company neotree ido-completing-read+ smex auto-complete gruvbox-theme)))
 '(whitespace-style
   (quote
    (face tabs spaces trailing space-before-tab newline indentation empty space-after-tab space-mark tab-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'gruvbox)

;; Map M-X to smex
(rc/require 'smex 'ido-completing-read+)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Window manipulation key remapping
;; Vertiacal split, kill horizontal-split and window-change respectivily
(define-key key-translation-map (kbd "C-x C-v") (kbd "C-x 3-"))
(define-key key-translation-map (kbd "C-x C-k") (kbd "C-x 0-"))
(define-key key-translation-map (kbd "C-x C-b") (kbd "C-x 2-"))
(define-key key-translation-map (kbd "C-x C-m") (kbd "C-x o-"))

;; Packages that don't require configurations
;; Emacs modes
(rc/require 'go-mode
	    'yaml-mode
	    'cmake-mode
	    'clojure-mode
	    'rust-mode
	    'markdown-mode
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
	    )

(powerline-default-theme)

;; Add a bunch of other modes using their rc files in ~/.emacs.rc
(load "~/.emacs.rc/cppmode-rc.el")
(load "~/.emacs.rc/paredit-rc.el")
(load "~/.emacs.rc/elisp-rc.el")
(load "~/.emacs.rc/haskell-rc.el")
(load "~/.emacs.rc/whitespace-rc.el")
(load "~/.emacs.rc/magit-rc.el")
(load "~/.emacs.rc/multiple-cursors-rc.el")
(load "~/.emacs.rc/ggtags-rc.el")
(load "~/.emacs.rc/dired-rc.el")
(load "~/.emacs.rc/helm-rc.el")
(load "~/.emacs.rc/yasnippet-rc.el")
(load "~/.emacs.rc/rainbow-rc.el")
(load "~/.emacs.rc/js-rc.el")
(load "~/.emacs.rc/neotree-rc.el")
(load "~/.emacs.rc/company-rc.el")
(load "~/.emacs.rc/editorconfig-rc.el")
(load "~/.emacs.rc/racer-rc.el")

;; A hook to change the linum mode for certain modes
(add-hook 'after-change-major-mode-hook
            '(lambda ()
               (linum-mode (if (or (equal major-mode 'text-mode) (equal major-mode 'term-mode) (equal major-mode 'help-mode)) 0 1))))
