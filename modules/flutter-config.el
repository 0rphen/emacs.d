;; -*- lexical-binding: t; -*-
;; Dart stays on eglot (see modules/eglot-config.el, which already hooks
;; dart-mode to eglot-ensure and eglot ships a built-in Dart server entry).
;; This module only adds the major mode + Flutter SDK tooling.

(use-package dart-mode
  :ensure t
  :mode ("\\.dart\\'" . dart-mode))

(use-package flutter
  :ensure t
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-c f r" . flutter-run-or-hot-reload)
              ("C-c f a" . flutter-run)
              ("C-c f t" . flutter-test-all)))

(provide 'flutter-config)
