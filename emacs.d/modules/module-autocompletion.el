(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories 
             (concat local-auto-complete-dir "ac-dict") )
(ac-config-default)
(setq ac-delay 0)
(setq ac-auto-show-menu t)


(provide 'module-autocompletion)