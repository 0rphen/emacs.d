;; -*- lexical-binding: t; -*-
(use-package centaur-tabs
  :ensure t
  :demand
  :init
  (setq centaur-tabs-height 32
        centaur-tabs-style "wave"
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-set-modified-marker t
        centaur-tabs-enable-key-bindings t
        centaur-tabs-modified-marker "*"
        centaur-tabs-label-fixed-length 10
        centaur-tabs-set-icons t)
  :bind (("C-x t s" . centaur-tabs-mode)
         ("C-<prior>" . centaur-tabs-backward)
         ("C-<next>" . centaur-tabs-forward))
  :config (centaur-tabs-mode t))

(provide 'centaur-config)
