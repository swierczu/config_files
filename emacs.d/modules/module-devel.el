
;; ---------------------------------------------------------------------------
;; C / C++
;; ---------------------------------------------------------------------------

;; use cscope
(require 'xcscope)

;; gtags
(require 'gtags)
(gtags-mode t)

;; C-mode:
(setq c-default-style "ellemtel")
;(setq c-default-style "linux")
(setq-default c-basic-offset 4)
(setq-default comment-column 80)

;; GDB
(setq gdb-many-windows t)


;; ---------------------------------------------------------------------------
;; Python
;; ---------------------------------------------------------------------------

(require 'ac-python)
;; eldoc mode
(add-hook 'python-mode-hook 'turn-on-eldoc-mode)

;; pdb
(setq gud-pdb-command-name "python -m pdb")


;; ---------------------------------------------------------------------------
;; Lisp
;; ---------------------------------------------------------------------------

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


;; ---------------------------------------------------------------------------
;; Git
;; ---------------------------------------------------------------------------

;; magit
(require 'magit)



(require 'module-snippets)

(provide 'module-devel)

