(setq inhibit-startup-screen t)  ; Inhibts the startup screen of emacs

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


;; Other GUI configuration for emacs
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
;; Number rows in emacs
(global-linum-mode 1)
(setq linum-format " %d ")


;; Enable IDO mode everywhere
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
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/")
	     t)
(add-to-list 'package-archives
	     '("melpa-stable", "https://stable.melpa.org/packages/")
	     t)

(package-initialize)

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
'(package-selected-packages (quote (smex auto-complete gruvbox-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'gruvbox)

;; Map M-X to smex
(global-set-key (kbd "M-x") 'smex)



