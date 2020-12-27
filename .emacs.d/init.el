(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(create-lockfiles nil)
 '(cursor-type 'box)
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages '(company magit diminish use-package))
 '(scroll-bar-mode nil)
 '(temporary-file-directory "/tmp/emacs/")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "red")))))

(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))
(setq backup-directory-alist `((".*" . ,(concat temporary-file-directory "backup"))))
(setq auto-save-file-name-transforms `((".*" ,(concat temporary-file-directory "auto-save") t)))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(eval-when-compile
  (dolist (package '(use-package diminish bind-key))
    (unless (package-installed-p package)
      (package-install package))
    (require package)))

(use-package magit
  :ensure t)

(use-package company
  :ensure t
  :diminish company-mode
  :bind ("M-/" . company-complete)
  :config
  (global-company-mode))
