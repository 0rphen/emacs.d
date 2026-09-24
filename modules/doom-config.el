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
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  ;; treemacs' icon theme is owned by modules/treemacs-config.el
  ;; (treemacs-all-the-icons); don't call doom-themes-treemacs-config here,
  ;; it would fight over the same treemacs-load-theme call.
  (doom-themes-org-config))

(provide 'doom-config)
