;; -*- lexical-binding: t; -*-
(use-package web-mode
  :mode ("\\.html\\'" . web-mode)
  :bind("C-c C-w" . web-mode-element-wrap))

(defun my/web-mode-eglot-contact (_interactive)
  "Use ngserver in Angular projects (angular.json), else the HTML server."
  (let ((root (locate-dominating-file default-directory "angular.json")))
    (if root
        (let ((probes (string-join
                       (list (expand-file-name "node_modules" root)
                             (let ((g (ignore-errors
                                        (string-trim (shell-command-to-string "npm root -g")))))
                               (if (and g (file-directory-p g)) g "")))
                       ",")))
          (list "ngserver" "--stdio"
                "--tsProbeLocations" probes
                "--ngProbeLocations" probes))
      '("vscode-html-language-server" "--stdio"))))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((web-mode :language-id "html") . my/web-mode-eglot-contact)))

(provide 'web-mode-config)
