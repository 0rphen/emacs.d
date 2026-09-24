;; -*- lexical-binding: t; -*-
(require 'meow-setup)

(use-package meow-tree-sitter
  :after meow)

(use-package meow
  :config
  (meow-setup)
  (meow-global-mode 1)
  (meow-tree-sitter-register-defaults))

(provide 'meow-config)
