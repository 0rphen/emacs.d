;; -*- lexical-binding: t; -*-
;; all-the-icons stays on completion + treemacs/dashboard; nerd-icons covers
;; dired/ibuffer/grep (see modules/nerd-icons-config.el) so both sets don't
;; overlap on the same UI surface.
(use-package all-the-icons)

(use-package all-the-icons-completion
  :ensure t
  :after marginalia
  :config
  (all-the-icons-completion-mode)
  (all-the-icons-completion-marginalia-setup))

(provide 'all-the-icons-config)
