;; -*- lexical-binding: t; -*-
;; nerd-icons covers dired/ibuffer/grep; all-the-icons stays on completion
;; and treemacs/dashboard (see modules/all-the-icons-config.el) to avoid
;; mixing both icon sets on the same UI surface.

(use-package nerd-icons-dired
  :ensure t
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :ensure t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package nerd-icons-grep
  :ensure t
  :config
  (nerd-icons-grep-mode 1))

(provide 'nerd-icons-config)
