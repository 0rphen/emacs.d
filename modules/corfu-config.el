;; -*- lexical-binding: t; -*-

(setq corfu-auto t
      corfu-auto-delay 0.2
      corfu-auto-trigger "."
      corfu-quit-no-match 'separator)

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  (setq corfu-auto t)
  (setq corfu-preselect 'prompt)
  (setq corfu-cycle t))

(provide 'corfu-config)
