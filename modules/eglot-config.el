;; -*- lexical-binding: t; -*-

(use-package eglot
  :ensure nil                          ; built into Emacs 29+
  :hook ((python-mode        . eglot-ensure)
         (dart-mode          . eglot-ensure)
         (typescript-ts-mode . eglot-ensure)
         (c-mode             . eglot-ensure)
         (c++-mode           . eglot-ensure))
  :config
  (define-key eglot-mode-map (kbd "C-c C-a") #'eglot-code-actions))


(provide 'eglot-config)
