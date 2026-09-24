;; -*- lexical-binding: t; -*-

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  :config
  (load-theme 'doom-dracula t)
  ;; (load-theme 'tron-legacy t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  (setq doom-themes-treemacs-theme "doom-atom"))

(provide 'doom-config)
