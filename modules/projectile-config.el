;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (setq projectile-completion-system 'ido
        projectile-enable-caching t
        projectile-globally-ignored-files
        (append '("~")
                projectile-globally-ignored-files))
  (projectile-mode)
  :bind (("C-c p" . projectile-command-map)))

(provide 'projectile-config)
