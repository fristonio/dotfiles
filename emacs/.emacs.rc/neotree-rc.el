;; Nerd tree alternative in emacs
(rc/require 'neotree)

(setq-default neo-smart-open t)

(global-set-key (kbd "C-`") 'neotree-toggle)
(global-set-key (kbd "C-c n d") 'neotree-dir)

