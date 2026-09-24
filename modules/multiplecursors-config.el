;; -*- lexical-binding: t; -*-

(use-package multiple-cursors
  :ensure t :defer t
  :bind (("C-<" . mc/mark-previous-like-this)
         ("C->" . mc/mark-next-like-this)
         ("C-M-m" . mc/mark-more-like-this-extended)
         ("C-*" . mc/mark-all-like-this)))

(provide 'multiplecursors-config)
