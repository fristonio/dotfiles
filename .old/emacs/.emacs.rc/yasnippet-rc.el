(rc/require 'yasnippet)

(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/snippets/"))

(setq yas/prompt-functions '(yas/dropdown-prompt))

(yas-global-mode 1)


