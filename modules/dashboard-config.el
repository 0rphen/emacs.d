;; -*- lexical-binding: t; -*-
(use-package dashboard
  :ensure t
  :after org
  :custom
  (dashboard-items '((recents . 5)
                     (projects . 5)
                     (bookmarks . 5)
                     (registers . 5)))
  (dashboard-set-file-icons t)
  (dashboard-set-heading-icons t)
  (dashboard-startup-banner
   (let ((custom-banner (expand-file-name "~/Imágenes/amongUs.png")))
     (if (file-exists-p custom-banner) custom-banner 'logo)))
  (dashboard-image-banner-max-width 200)
  (dashboard-heading-shorcut-format "[%s]")
  (dashboard-show-shortcuts t)
  (dashboard-center-content t)
  (dashboard-vertically-center-content t)
  (dashboard-set-navigator t)
  (dashboard-banner-logo-title "Shhhhh, happy hacking...")
  :config
  (dashboard-setup-startup-hook)
  (add-to-list 'dashboard-items '(agenda) t))

(setq dashboard-agenda-release-buffers nil)
(setq dashboard-startupify-list '(dashboard-insert-banner
                                  dashboard-insert-newline
                                  dashboard-insert-banner-title
                                  dashboard-insert-newline
                                  dashboard-insert-navigator
                                  dashboard-insert-newline
                                  dashboard-insert-init-info
                                  dashboard-insert-items
                                  dashboard-insert-newline
                                  dashboard-insert-footer))
(setq dashboard-item-names '(("Recent Files:"               . "Recently opened files:")
                             ("Agenda for today:"           . "Today's agenda:")
                             ("Agenda for the coming week:" . "Agenda:")))
(setq dashboard-projects-switch-function 'projectile-persp-switch-project)
(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
(setq dashboard-week-agenda t)

(setq dashboard-navigator-buttons
      `(
        ((,(all-the-icons-octicon "home" :height 1.1 :v-adjust 0.0)
          "Init"
          "Open file init"
          (lambda (&rest _) (find-file "~/.emacs.d/init.el")))
         ("📎"
          "Custom"
          "Open File Custom"
          (lambda (&rest _) (find-file "~/.emacs.d/custom.el"))))
        ))
(provide 'dashboard-config)
