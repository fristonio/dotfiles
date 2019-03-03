(rc/require 'multiple-cursors)

;; This marks the searched item after hitting C-Enter
(defun isearch-exit-mark-match ()
  "Exit isearch and mark the current match."
  (interactive)
  (isearch-exit)
  (push-mark isearch-other-end)
  (activate-mark))

(define-key isearch-mode-map (kbd "<C-return>") #'isearch-exit-mark-match)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-d")       'mc/mark-next-like-this)
(global-set-key (kbd "C-M-d")       'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
