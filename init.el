;; -*- lexical-binding: t; -*-
;; init.el --- personal config

(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap: on a fresh clone there is no package index yet, and several
;; `use-package' blocks below rely on :ensure to install themselves.
(unless package-archive-contents
  (package-refresh-contents))
(require 'use-package)
(setq use-package-always-ensure t)

(eval-and-compile
  (add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory)))
(require 'all-the-icons-config)

(require 'doom-config)

(add-to-list 'exec-path (expand-file-name "~/.local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.local/bin")))
(eval-and-compile
  (add-to-list 'load-path (expand-file-name "modules/meow/" user-emacs-directory)))

(require 'treemacs-config)
;; NOTE: the plain-text diary is NOT org syntax, so it must never be added to
;; `org-agenda-files' (org would try to org-element-parse it and fail with
;; "Cache must be active"). Point `diary-file' at it and pull it in via
;; `org-agenda-include-diary'; real .org agenda files go in `org-agenda-files'
;; via init-local.el.
;; `defvar' here just tells the byte-compiler these belong to diary-lib/
;; org-agenda (not yet loaded at this point); it doesn't force-load them.
(defvar diary-file)
(defvar org-agenda-include-diary)
(let ((diary-path (expand-file-name "diary" user-emacs-directory)))
  (when (file-exists-p diary-path)
    (setq diary-file diary-path)))
(use-package org
  :config
  (setq org-agenda-include-diary t))
(require 'org-agenda)

;; custom.el holds the shared, committed customizations (themes, ledger
;; reports, etc). Interactive `M-x customize' writes go to custom-local.el
;; instead, so machine-specific noise never touches the repo.
(load (expand-file-name "custom.el" user-emacs-directory) 'noerror)
(setq custom-file (expand-file-name "custom-local.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'settings-config)

(require 'keychords-config)
(require 'web-mode-config)
(require 'emmet-config)
(require 'nerd-icons-config)

(require 'dashboard-config)
(require 'centaur-config)
(require 'projectile-config)
(require 'perspective-config)
(require 'vertico-config)
(require 'orderless-config)
(require 'marginalia-config)
(require 'consult-config)
(require 'embark-config)
(require 'cape-config)
(require 'ace-config)
(require 'corfu-config)
(require 'eglot-config)
(require 'vue-config)
(require 'movetext-config)
(require 'loremipsum-config)
(require 'miniframe-config)
(require 'meow-config)
(require 'colorful-mode-config)
(require 'multiplecursors-config)
(require 'avy-config)
(require 'org-roam-config)
(require 'smerge-config)
(require 'hl-config)
(require 'claude-code-ide-config)
(require 'persp-projectile-config)
(require 'which-key-config)
(require 'blamer-config)
(require 'solaire-config)
(require 'fira-code-config)
(require 'treesit-auto-config)
(require 'ag-config)
(require 'flycheck-config)
(require 'ledger-config)
(require 'denote-config)
(require 'vterm-config)
(require 'yasnippet-config)
(require 'yaml-config)
(require 'flutter-config)

;; Machine-specific overrides (not tracked in git). See init-local.el.example.
(let ((local-init (expand-file-name "init-local.el" user-emacs-directory)))
  (when (file-exists-p local-init)
    (load local-init)))

;;; init.el ends here
