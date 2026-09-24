;; -*- lexical-binding: t; -*-

(use-package treemacs-all-the-icons
  :ensure t
  :after treemacs
  :config (treemacs-load-theme "all-the-icons"))

(use-package treemacs-projectile
  :ensure t
  :after treemacs projectile
  :defer t)

(use-package treemacs
  :ensure t
  :bind
  (("C-<f8>" . treemacs-select-window)
   ([f8] . treemacs)
   ("C-c t s" . treemacs-switch-workspace)
   ("<f9>" . treemacs-add-and-display-current-project-exclusively))
  :custom
  (treemacs-is-never-other-window t)
  :config
  (treemacs-follow-mode t))

(use-package treemacs-tab-bar
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))

(provide 'treemacs-config)
