;; -*- lexical-binding: t; -*-

(defvar my/org-agenda-file (expand-file-name "~/org/agenda.org")
  "Org file for tasks and events captured with `org-capture'.
Override in init-local.el (e.g. (setq my/org-agenda-file \"~/Documentos/agenda.org\"))
and add it to `org-agenda-files' there.")
;; Se crea en `after-init-hook' para respetar el override de init-local.el,
;; que se carga después de este módulo (org-agenda pregunta si quitar de la
;; lista un archivo que no existe).
(add-hook 'after-init-hook
          (lambda ()
            (unless (file-exists-p my/org-agenda-file)
              (make-directory (file-name-directory my/org-agenda-file) t)
              (write-region "" nil my/org-agenda-file))))

(use-package org-capture
  :ensure nil
  :bind ("C-c x" . org-capture)
  :custom
  ;; Target as a symbol, so it's resolved at capture time (after init-local.el).
  (org-capture-templates
   '(("t" "Tarea" entry (file my/org-agenda-file)
      "* TODO %?\n  SCHEDULED: %^t\n")
     ("e" "Evento" entry (file my/org-agenda-file)
      "* %?\n  %^T\n"))))

(provide 'org-capture-config)
