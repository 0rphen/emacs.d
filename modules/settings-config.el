;; -*- lexical-binding: t; -*-
;; Ajustes generales escritos a mano (fuente, UI, backups, tree-sitter, keybindings).
;; Separado de custom.el, que Emacs reescribe automáticamente (ver custom-file en init.el).

(use-package apheleia
  :ensure t
  :config (apheleia-global-mode +1))

(set-face-attribute 'default nil
                     :family "Fira Code"
                     :height 95)

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode)
(cua-selection-mode t)
(electric-pair-mode t)
(add-to-list 'initial-frame-alist '(fullscreen . fullscreen))
(add-to-list 'major-mode-remap-alist '(typescript-mode . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-c t n") 'tab-next)
(global-set-key (kbd "C-c t p") 'tab-previous)
(global-set-key (kbd "C-c t c") 'tab-new)
(global-set-key (kbd "C-c t x") 'tab-close)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c C-r") 'revert-buffer)
(global-set-key (kbd "C-x M-t") 'transpose-paragraphs)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq auto-save-file-location (expand-file-name "auto-saves" user-emacs-directory))
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(make-directory auto-save-file-location t)
(setq auto-save-file-name-transforms
      `((".*" ,auto-save-file-location t)))

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(provide 'settings-config)
