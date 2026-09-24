;; -*- lexical-binding: t; -*-

(defvar my/org-roam-directory (expand-file-name "~/org-roam")
  "Directory where org-roam notes live.
Override in init-local.el (e.g. (setq my/org-roam-directory \"~/Documentos/roamNotes\"))
before this module loads.")
(make-directory my/org-roam-directory t)

(use-package org-roam
  :ensure t
  :custom ((org-roam-directory my/org-roam-directory)
           (org-roam-complete-everywhere t)
           (org-roam-capture-templates
            '(("d" "default" plain
               "%?"
               :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
               :unnarrowed t)
              ("b" "boardgames" plain
               (file "templates/boardgames.org")
               :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags:\n")
               :unnarrowed t)
              )))
  :bind(("C-c n l" . org-roam-buffer-toggle)
        ("C-c n f" . org-roam-node-find)
        ("C-c n i" . org-roam-node-insert)
        :map org-mode-map
        ("C-M-i" . completion-at-point))
  :config (org-roam-setup))

(use-package org-roam-ui
  :after org-roam
  :hook (org-roam-mode . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(provide 'org-roam-config)
