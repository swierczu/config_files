;; ---------------------------------------------------------------------------
;; Global key definition
;; ---------------------------------------------------------------------------

(global-set-key (kbd "C-<tab>") 'other-frame)
(global-set-key (kbd "C-<prior>") 'custom-select-previous-window)
(global-set-key (kbd "C-<next>") 'custom-select-next-window)
(global-set-key (kbd "C-Z") nil) ;; disable ctrl + z background mode
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-q") 'goto-last-change)
(global-set-key (kbd "C-.") 'custom-next-gtag)
(global-set-key (kbd "<f3>") 'gtags-find-tag)
(global-set-key (kbd "C-M-h") 'gtags-find-rtag)
(global-set-key (kbd "M-<left>") 'gtags-pop-stack)
(global-set-key (kbd "C-`") 'ff-find-other-file)
(global-set-key (kbd "s-o") 'jl-jump-backward)
(global-set-key (kbd "s-i") 'jl-jump-forward)
(global-set-key "%" 'custom-match-paren)
;; autocompltion - remap default M-/ if auto-complete is available
(when (fboundp 'auto-complete)
  (global-set-key (kbd "M-/") 'auto-complete))
;; flash current line
(when (fboundp 'hl-line-flash)
  (global-set-key (kbd "C-c l") 'hl-line-flash))

(provide 'module-keys)
