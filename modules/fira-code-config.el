;; -*- lexical-binding: t; -*-
(use-package fira-code-mode
  :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x"))
  :hook (prog-mode . fira-code-mode)
  :config (fira-code-mode-set-font))

(provide 'fira-code-config)
