;; -*- lexical-binding: t; -*-

(use-package ag
  :ensure t
  :bind (("C-c a g" . ag)
         ("C-c a p" . ag-project)
         ("C-c a r" . ag-regexp)))

(provide 'ag-config)
