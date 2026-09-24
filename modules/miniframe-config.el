;; -*- lexical-binding: t; -*-

(use-package mini-frame
  :ensure t
  :custom
  (mini-frame-show-parameters
   '((top . 0) (width . 0.5)
     (left . 0.5) (height . 15)
     (internal-border-width . 2)))
  :init (mini-frame-mode)
  :config
  (mini-frame-mode t))

(provide 'miniframe-config)
