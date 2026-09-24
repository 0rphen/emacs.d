;; -*- lexical-binding: t; -*-

(use-package consult
  :ensure t
  :bind (
         ("C-s"   . consult-line)
         ("C-c m" . consult-imenu)
         ("C-c r" . consult-ripgrep)
         ("C-x b" . consult-buffer)
         ("M-y"   . consult-yank-pop)
         ("C-c g" . consult-grep)
         ("C-c >" . consult-outline)))

(provide 'consult-config)
