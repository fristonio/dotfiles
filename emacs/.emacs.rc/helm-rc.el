(setq helm-ff-transformer-show-only-basename nil)

(global-unset-key (kbd "C-x C-p"))
(global-set-key (kbd "C-x C-p") 'helm-browse-project)

(global-set-key (kbd "C-c h t") 'helm-cmd-t)
(global-set-key (kbd "C-x C-g") 'helm-git-grep)
(global-set-key (kbd "C-c h g l") 'helm-ls-git-ls)
;; Helm finding files, overrides default
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h a") 'helm-org-agenda-files-headings)
(global-set-key (kbd "C-c h r") 'helm-recentf)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c h i") 'helm-imenu)
