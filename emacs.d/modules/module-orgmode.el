(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-directory "~/Dropbox/orgmode/")
(setq org-agenda-files (list "~/Dropbox/orgmode/proximetry.org"
                             "~/Dropbox/orgmode/teleca.org"
                             "~/Dropbox/orgmode/mobinet.org"
                             "~/Dropbox/orgmode/uczelnia.org"
                             "~/Dropbox/orgmode/inne.org" ) )

(setq org-mobile-directory "~/Dropbox/MobileOrg/")
(setq org-mobile-inbox-for-pull "~/Dropbox/orgmode/from-mobile.org")

(provide 'module-orgmode)