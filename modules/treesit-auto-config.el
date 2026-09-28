;; -*- lexical-binding: t; -*-
(use-package treesit-auto
  :config
  ;; Only track grammars actually installed: with the default 60+ langs,
  ;; every file visit rebuilds the remap alist and probes each missing
  ;; grammar (~170ms/file), which made the dashboard agenda take ~30s.
  (setq treesit-auto-langs
        (seq-filter #'treesit-language-available-p treesit-auto-langs))
  (global-treesit-auto-mode))
(use-package treesit-ispell)

(provide 'treesit-auto-config)
