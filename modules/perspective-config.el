;; -*- lexical-binding: t; -*-

(use-package perspective
  :ensure t
  :bind (("C-c e s" . persp-switch)
         ("C-x C-b" . persp-list-buffers)
         ("C-c e k" . persp-kill)
         ("C-c e n" . persp-next)
         ("C-c e p" . persp-prev))
  :init
  (setq persp-mode-prefix-key (kbd "C-c e"))
  (setq persp-state-default-file "~/.emacs.d/persp-state")
  :custom (persp-mode-prefix-key (kbd "C-c M-p"))
  :config
  (persp-mode))

(provide 'perspective-config)
