;; -*- lexical-binding: t; -*-
(use-package hl-todo
  :ensure t
  :hook ((org-mode . hl-todo-mode)
         (prog-mode . hl-todo-mode))
  :config
  (setq hl-todo-keyword-faces
        '(("HOLD"   . "#d0bf8f")
          ("TODO"   . "#cc9393")
          ("NEXT"   . "#dca3a3")
          ("THEM"   . "#dc8cc3")
          ("PROG"   . "#7cb8bb")
          ("OKAY"   . "#7cb8bb")
          ("DONT"   . "#5f7f5f")
          ("FAIL"   . "#8c5353")
          ("DONE"   . "#afd8af")
          ("NOTE"   . "#d9bf8f")
          ("MAYBE"  . "#d9bf8f")
          ("KLUDGE" . "#d9bf8f")
          ("HACK"   . "#d9bf8f")
          ("TEMP"   . "#d9bf8f")
          ("FIXME"  . "#cc9393")
          ("XXXX"   . "#cc9393")
          ("ignore" . "#aca393")))
  (setq hl-todo-highlight-punctuation ":"))

(provide 'hl-config)
