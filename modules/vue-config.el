;; -*- lexical-binding: t; -*-

(require 'web-mode)
(require 'eglot)

(define-derived-mode vue-web-mode web-mode "Vue"
  "Major mode for Vue single-file components, derived from `web-mode'.")

(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-web-mode))
(add-to-list 'web-mode-content-types-alist '("vue" . "\\.vue\\'"))

(defun my/vue-typescript-tsdk ()
  "Locate the global TypeScript `lib' dir for the Vue language server."
  (or (getenv "VUE_TSDK")
      (let ((npm-root (ignore-errors
                         (string-trim (shell-command-to-string "npm root -g")))))
        (when (and npm-root (file-directory-p npm-root))
          (expand-file-name "typescript/lib" npm-root)))
      "/usr/lib/node_modules/typescript/lib"))

(add-to-list 'eglot-server-programs
             `(vue-web-mode . ("vue-language-server" "--stdio"
                               :initializationOptions
                               (:typescript
                                (:tsdk ,(my/vue-typescript-tsdk))))))

(add-hook 'vue-web-mode-hook #'eglot-ensure)

(provide 'vue-config)
