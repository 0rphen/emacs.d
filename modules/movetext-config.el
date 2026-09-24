;; -*- lexical-binding: t; -*-

(use-package move-text
  :ensure t
  :bind(("M-p" . move-text-up)
        ("M-n" . move-text-down)))

(provide 'movetext-config)
