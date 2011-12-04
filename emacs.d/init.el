
;; ---------------------------------------------------------------------------
;; Paths settings
;; ---------------------------------------------------------------------------

(setq local-modules-dir "~/.emacs.d/modules/")
(setq local-cache-dir "~/.emacs.d/cache/")
(setq local-lisp-dir "~/.emacs.d/lisp/")
(setq local-yasnippet-dir "~/.emacs.d/yasnippet/")
(setq local-auto-complete-dir "~/.emacs.d/auto-complete/")

(add-to-list 'load-path local-modules-dir)
(add-to-list 'load-path local-lisp-dir)
(add-to-list 'load-path local-yasnippet-dir)
(add-to-list 'load-path local-auto-complete-dir)

;; local cache path (for recentf, IDO, etc.)
; create cache dir if one does not exist
(if (not (file-exists-p local-cache-dir))
    (progn
      (message "creating cache directory at %s" local-cache-dir)
      (make-directory local-cache-dir)))

;;(require 'module-keys)


;; ---------------------------------------------------------------------------
;; Packages
;; ---------------------------------------------------------------------------

(require 'font-lock)           ;; syntax on
(require 'color-theme)
(require 'recentf)
(require 'uniquify)
(require 'ido)
(require 'jumplist)
(require 'sr-speedbar)
(require 'multi-term)
(require 'fill-column-indicator)
(require 'tramp)


;; ---------------------------------------------------------------------------
;; Modules from .emacs.d/modules/
;; ---------------------------------------------------------------------------

(require 'module-elpa)
(require 'module-custom-func)
(require 'module-keys)
(require 'module-autocompletion)

;; ---------------------------------------------------------------------------
;; Editor settings
;; ---------------------------------------------------------------------------

;; Font size
(set-face-attribute 'default nil :height 120) 

;; Don't show startup screen
(setq inhibit-startup-screen t)               

;; Scroll line by line
(setq scroll-step 1)  
                        
;; wheel-mouse set to on
(mouse-wheel-mode t)                          

;; More space
(tool-bar-mode 0)

;; Parenthesis highlighted                             
(setq show-paren-delay 0)
(setq show-paren-syle 'mixed)
(show-paren-mode 1)       
                    
;; Highlight current line:
(global-hl-line-mode 1)                       
;;(set-face-background 'hl-line "#555")

;; enable syntax coloring
(global-font-lock-mode t)                     
(setq font-lock-verbose nil)                  ;; no messages

;; highlight query
(setq query-replace-highlight t)

;; highlight incremental search              
(setq search-highlight t)                     

;; search for open-paren till point-min
(setq blink-matching-paren-distance nil)

;; deleting region by typing or del (like Win)      
(delete-selection-mode t)                     

;; show selected region
(setq transient-mark-mode t)

;; show line numbers                  
(global-linum-mode t)

;; show line number in status bar                         
(line-number-mode t)             

;; show column number in status bar             
(column-number-mode t) 

;; move scrollbar to right                       
(set-scroll-bar-mode 'right)

;; replace y-e-s by y
(fset 'yes-or-no-p 'y-or-n-p)

;; backup off                 
(setq make-backup-files nil)                  
(setq auto-save-default nil)

;; menu for recently opened files
(recentf-mode 1)    

;; modern copy,cut,paste
(cua-mode t)            
                      
;; Tab using 4 spaces
(setq-default indent-tabs-mode nil)           
(setq tab-width 4)
(setq standard-indent 4)

;; uniquify: unique buffer names
(setq 
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":"
 ;; regenerate buffer names after killing a buffer
 uniquify-after-kill-buffer-p t 
 ;; ignore buffers with *, *ielm*, *cscope* etc.
 uniquify-ignore-buffers-re "^\\*")

;; speedbar in frame
(setq speedbar-show-unknown-files t)

;; recentf - recent files
(setq 
 ;; save list to ~/.emacs.d/cache/recentf
 recentf-save-file (concat local-cache-dir "recentf")
 recentf-max-saved-items 100
 recentf-max-menu-items 15)
;; enable
(recentf-mode t)

;; TRAMP use ssh
(setq tramp-default-method "ssh")  

;; multi-term
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)
(setq multi-term-program "/usr/bin/zsh")

;; load color theme
(load "naquadah-theme")


;; ---------------------------------------------------------------------------
;; IDO settings
;; ---------------------------------------------------------------------------

;; enable for buffers and files
(ido-mode 'both)
(setq 
 ;; save state to ~/.emacs.d/cache/ido.last
 ido-save-directory-list-file (concat local-cache-dir "ido.last")
 ;; ignore these guys
 ido-ignore-buffers 
 '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
   "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
 ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~/code")
 ido-case-fold  t                 ; be case-insensitive
 ido-enable-last-directory-history t ; remember last used dirs
 ido-max-work-directory-list 30   ; should be enough
 ido-max-work-file-list      50   ; remember many
 ido-use-filename-at-point nil    ; don't use filename at point (annoying)
 ido-use-url-at-point nil         ; don't use url at point (annoying)
 ido-enable-flex-matching nil     ; don't try to be too smart
 ido-max-prospects 8              ; don't spam my minibuffer
 ido-confirm-unique-completion t  ; wait for RET, even with unique completion
 ido-default-buffer-method 'select-window) ; show buffer in frame that I want it to be
; resize minibuf with ido completions to at most 1 line
(add-hook 'ido-minibuffer-setup-hook 
          (function
           (lambda ()
             (make-local-variable 'resize-minibuffer-window-max-height)
             (setq resize-minibuffer-window-max-height 1))))


;; ---------------------------------------------------------------------------
;; Flyspell settings  
;; ---------------------------------------------------------------------------

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(put 'LeTex-mode 'flyspell-mode-predicate 'tex-mode-flyspell-verify)
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-dictionary "english")

