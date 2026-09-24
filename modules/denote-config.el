;; -*- lexical-binding: t; -*-

(defvar my/denote-directory (expand-file-name "~/denote")
  "Directory where denote notes live.
Override in init-local.el (e.g. (setq my/denote-directory \"~/Documentos/notes\"))
before this module loads.")
(make-directory my/denote-directory t)

(use-package denote
  :ensure t
  :custom (denote-directory my/denote-directory)
  :bind (("C-c d n" . denote)
         ("C-c d o" . denote-open-or-create)
         ("C-c d l" . denote-link)
         ("C-c d r" . denote-rename-file)))

(provide 'denote-config)
