(rc/require 'yasnippet)

;; (require 'dropdown-list)
(require 'yasnippet)

(setq yas/triggers-in-field nil)

;; http://stackoverflow.com/questions/6888189/drop-down-menu-for-emasc
;; (setq yas/prompt-functions '(yas/dropdown-prompt))
(setq yas-snippet-dirs '("~/.emacs.d/snippets/"))

(yas-global-mode 1)
