;; -*- lexical-binding: t; -*-
(use-package web-mode
  :mode ("\\.html\\'" . web-mode)
  :bind("C-c C-w" . web-mode-element-wrap))

(provide 'web-mode-config)
