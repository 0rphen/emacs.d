;; -*- lexical-binding: t; -*-

(require 'web-mode)

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

(defun my/vue-eglot-contact (&rest _)
  "Eglot contact for the Vue language server.
A function so `npm root -g' only runs when eglot starts, not at init."
  `("vue-language-server" "--stdio"
    :initializationOptions (:typescript (:tsdk ,(my/vue-typescript-tsdk)))))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(vue-web-mode . my/vue-eglot-contact)))

(add-hook 'vue-web-mode-hook #'eglot-ensure)

(provide 'vue-config)
