;; -*-  lexical-binding: t; -*-
(use-package claude-code-ide
  :ensure nil
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :config
  (global-set-key (kbd "C-c i a") #'claude-code-ide-menu)
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools
(setq claude-code-ide-cli-path
      (or (executable-find "claude")
          (expand-file-name "~/.local/bin/claude")))

(provide 'claude-code-ide-config)
