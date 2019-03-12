(setq helm-ff-transformer-show-only-basename nil)
(require 'helm-config)
(require 'helm-mode)

(global-set-key (kbd "<C-return>") 'helm-git-grep)

;; Helm finding files, overrides default
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-find-files-map "\t" 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "<C-backspace>") 'helm-find-files-up-one-level)


(global-set-key (kbd "C-x C-b") 'helm-mini)

(global-unset-key (kbd "C-x C-p"))
(global-set-key (kbd "C-x C-p") 'helm-browse-project)
