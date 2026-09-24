;; -*- lexical-binding: t; -*-
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window))
  :custom
  (aw-keys '(?a ?o ?e ?u ?i ?d ?t ?n ?s))
  (aw-dispatch-always t)
  :config
  (setq aw-dispatch-alist
        '((?x aw-delete-window "Delete Window")
          (?m aw-move-window "Move Window")
          (?c aw-copy-window "Copy Window")
          (?z aw-swap-window "Swap Windows")
          (?- aw-split-window-vert "Split Vertically")
          (?| aw-split-window-horz "Split Horizontally")
          (?r delete-other-windows "Delete Other Windows")))
  (setq aw-scope 'frame)
  (setq aw-ignore-current t))

(provide 'ace-config)
