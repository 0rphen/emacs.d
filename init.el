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

(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))
(use-package all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))
(use-package all-the-icons-dired)

(require 'doom-config)

(add-to-list 'exec-path (expand-file-name "~/.local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "~/.local/bin")))
(add-to-list 'load-path (expand-file-name "modules/meow/" user-emacs-directory))

(require 'treemacs-config)
;; NOTE: the plain-text diary is NOT org syntax, so it must never be added to
;; `org-agenda-files' (org would try to org-element-parse it and fail with
;; "Cache must be active"). Point `diary-file' at it and pull it in via
;; `org-agenda-include-diary'; real .org agenda files go in `org-agenda-files'
;; via init-local.el.
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

(use-package use-package-chords :config (key-chord-mode 1))

(use-package web-mode
  :mode ("\\.html\\'" . web-mode)
  :bind("C-c C-w" . web-mode-element-wrap))

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
(use-package persp-projectile :defer t)
(use-package which-key :defer t :config (which-key-mode))
(use-package blamer :bind("C-c f b" . blamer-mode))
(use-package solaire-mode :config (solaire-global-mode +1))
(use-package fira-code-mode
  :custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x"))
  :hook (prog-mode . fira-code-mode)
  :config (fira-code-mode-set-font))
(use-package treesit-auto
  :config
  (global-treesit-auto-mode))
(use-package treesit-ispell)

;; Machine-specific overrides (not tracked in git). See init-local.el.example.
(let ((local-init (expand-file-name "init-local.el" user-emacs-directory)))
  (when (file-exists-p local-init)
    (load local-init)))
