(defvar rc/package-contents-refreshed nil)
(defvar rc/required-packages nil)

(defun rc/package-refresh-contents-once ()
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-one-package (package)
  (push package rc/required-packages)
  (when (not (package-installed-p package))
    (rc/package-refresh-contents-once)
    (package-install package)))

(defun rc/require (&rest packages)
  (dolist (package packages)
    (rc/require-one-package package)))

(defun rc/require-theme (theme)
  (let ((theme-package (->> theme
                            (symbol-name)
                            (funcall (-flip #'concat) "-theme")
                            (intern))))
    (rc/require theme-package)
    (load-theme theme t)))

(rc/require 'dash)
(require 'dash)

(rc/require 'dash-functional)
(require 'dash-functional)

(defun rc/package-reqs (package)
  (let ((package-desc
         (->> package-alist
              (alist-get package)
              (car))))
    (when package-desc
      (package-desc-reqs package-desc))))

(defun rc/package-dependencies (package)
  (->> package
       (rc/package-reqs)
       (-map #'car)
       (cons package)))

(defun rc/package-expand-dependencies (packages)
  (->> packages
       (-map #'rc/package-dependencies)
       (-flatten)
       (remove-duplicates)))

(defun rc/unused-packages ()
  (let ((all-package (rc/package-expand-dependencies rc/required-packages)))
    (->> package-alist
         (-map #'car)
         (-filter (-lambda (package)
                    (not (-contains? all-package package)))))))

(defun rc/remove-unused-packages ()
  (interactive)
  (message "Unused packages: %s" (rc/unused-packages)))

