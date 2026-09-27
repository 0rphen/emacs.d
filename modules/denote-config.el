;; -*- lexical-binding: t; -*-

(defvar my/denote-directory (expand-file-name "~/denote")
  "Directory where denote notes live.
Override in init-local.el (e.g. (setq my/denote-directory \"~/Documentos/notes\")).")
;; Se crea en `after-init-hook' para respetar el override de init-local.el,
;; que se carga después de este módulo.
(add-hook 'after-init-hook (lambda () (make-directory my/denote-directory t)))

(use-package denote
  :ensure t
  :custom (denote-directory my/denote-directory)
  :bind (("C-c d n" . denote)
         ("C-c d o" . denote-open-or-create)
         ("C-c d l" . denote-link)
         ("C-c d r" . denote-rename-file)))

(provide 'denote-config)
