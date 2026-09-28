;; -*- lexical-binding: t; -*-

(use-package flycheck
  :ensure t
  :config
  ;; *scratch* has no file, so no elisp checker can run there and flycheck
  ;; would report it on every startup.
  (setq flycheck-global-modes '(not lisp-interaction-mode))
  (global-flycheck-mode))

(provide 'flycheck-config)
