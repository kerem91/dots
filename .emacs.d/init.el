(setq gc-cons-threshold 134217728)	; Got value from DOOM-Emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(create-lockfiles nil)
 '(cursor-type 'box)
 '(custom-safe-themes
   '("93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" default))
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(inhibit-startup-echo-area-message t)
 '(inhibit-startup-screen t)
 '(line-number-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(temporary-file-directory "/tmp/emacs/")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "red")))))

(global-auto-revert-mode +1)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))
(setq backup-directory-alist `((".*" . ,(concat temporary-file-directory "backup"))))
(setq auto-save-file-name-transforms `((".*" ,(concat temporary-file-directory "auto-save") t)))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(straight-use-package 'diminish)

(use-package selectrum
  :config
  (selectrum-mode +1))

(use-package selectrum-prescient
  :config
  (selectrum-prescient-mode +1)
  (prescient-persist-mode +1))

(use-package company
  :diminish company-mode
  :bind (("M-/" . company-complete)
	 :map company-active-map
	 ("C-n" . company-select-next-or-abort)
	 ("C-p" . company-select-previous-or-abort))
  :config
  (global-company-mode +1))

(use-package company-prescient
  :config
  (company-prescient-mode +1))

(use-package which-key
  :config
  (which-key-mode))

(use-package all-the-icons)

(use-package doom-themes
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

(use-package elisp-slime-nav
  :hook (emacs-lisp-mode . elisp-slime-nav-mode))

(straight-use-package 'magit)



(use-package projectile
  :bind-keymap
  ("s-p" . projectile-command-map)
  :config
  (projectile-mode +1))


(use-package treemacs
  :config
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'extended)
  (treemacs-follow-mode -1)
  (add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1))))

(use-package treemacs-projectile
  :after (treemacs projectile))


(use-package treemacs-magit
  :after (treemacs magit))

(use-package typescript-mode)


(use-package lsp-mode
  :bind-keymap ("s-l" . lsp-command-map)
  :hook ((typescript-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)



(use-package which-key
    :config
    (which-key-mode))
