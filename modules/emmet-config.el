;; -*- lexical-binding: t; -*-

(use-package emmet-mode
  :ensure t
  :hook ((web-mode . emmet-mode)
         (sgml-mode . emmet-mode)
         (css-mode . emmet-mode))
  :custom (emmet-indentation 2))

(provide 'emmet-config)
