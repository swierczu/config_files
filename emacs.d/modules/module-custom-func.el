;; ---------------------------------------------------------------------------
;; Custom fuctions
;; ---------------------------------------------------------------------------

;; Match parenthesis:
(defun custom-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

;; Switching between windows:
(defun custom-select-next-window ()
  "Switch to the next window" 
  (interactive)
  (select-window (next-window)))

(defun custom-select-previous-window ()
  "Switch to the previous window" 
  (interactive)
  (select-window (previous-window)))

;; Goto last edit position:
(defvar goto-last-change-undo nil
  "The `buffer-undo-list' entry of the previous \\[goto-last-change] command.")
(make-variable-buffer-local 'goto-last-change-undo)

(defun goto-last-change (&optional mark-point minimal-line-distance)
  "Set point to the position of the last change.
   Consecutive calls set point to the position of the previous change.
   With a prefix arg (optional arg MARK-POINT non-nil), set mark so \
   \\[exchange-point-and-mark]
   will return point to the current position."
  (interactive "P")
  ;; (unless (buffer-modified-p)
  ;;   (error "Buffer not modified"))
  (when (eq buffer-undo-list t)
    (error "No undo information in this buffer"))
  (when mark-point
    (push-mark))
  (unless minimal-line-distance
    (setq minimal-line-distance 10))
  (let ((position nil)
	(undo-list (if (and (eq this-command last-command)
			    goto-last-change-undo)
		       (cdr (memq goto-last-change-undo buffer-undo-list))
		     buffer-undo-list))
	undo)
    (while 
        (and undo-list
             (or (not position)
                 (eql position (point))
                 (and minimal-line-distance
                      ;; The first invocation always goes to the last change, 
                      ;; subsequent ones skip
                      ;; changes closer to (point) then minimal-line-distance.
                      (memq last-command '(goto-last-change
                                           goto-last-change-with-auto-marks))
                      (< (count-lines (min position (point-max)) (point))
                         minimal-line-distance))))
      (setq undo (car undo-list))
      (cond ((and (consp undo) (integerp (car undo)) (integerp (cdr undo)))
	     ;; (BEG . END)
	     (setq position (cdr undo)))
	    ((and (consp undo) (stringp (car undo))) ; (TEXT . POSITION)
	     (setq position (abs (cdr undo))))
	    ((and (consp undo) (eq (car undo) t))) ; (t HIGH . LOW)
	    ((and (consp undo) (null (car undo)))
	     ;; (nil PROPERTY VALUE BEG . END)
	     (setq position (cdr (last undo))))
	    ((and (consp undo) (markerp (car undo)))) ; (MARKER . DISTANCE)
	    ((integerp undo))		; POSITION
	    ((null undo))		; nil
	    (t (error "Invalid undo entry: %s" undo)))
      (setq undo-list (cdr undo-list)))
    (cond (position
	   (setq goto-last-change-undo undo)
	   (goto-char (min position (point-max))))
	  ((and (eq this-command last-command)
		goto-last-change-undo)
	   (setq goto-last-change-undo nil)
	   (error "No further undo information"))
	  (t
	   (setq goto-last-change-undo nil)
	   (error "Buffer not modified")))))

(defun goto-last-change-with-auto-marks (&optional minimal-line-distance)
  "Calls goto-last-change and sets the mark at only the first invocations
in a sequence of invocations."
  (interactive "P")
  (goto-last-change (not (or (eq last-command 'goto-last-change-with-auto-marks)
                             (eq last-command t)))
                    minimal-line-distance))

;; Cycling gtags result
(defun custom-next-gtag ()
  "Find next matching tag, for GTAGS."
  (interactive)
  (let ((latest-gtags-buffer
         (car (delq nil  (mapcar (lambda (x) (and (string-match "GTAGS SELECT" (buffer-name x)) (buffer-name x)) )
                                 (buffer-list)) ))))
    (cond (latest-gtags-buffer
           (switch-to-buffer latest-gtags-buffer)
           (next-line)
           (gtags-select-it nil))
          ) ))

;; set frame title manually
(defun custom-set-frame-title (title)
  "Set current frame title"
  (interactive "sNew frame title: ")
  (setq frame-title-format title) )


;; rebuild all modules in local-modules-dir
(defun custom-recompile-modules ()
  "Byte-compile all modules"
  (interactive)
  (byte-recompile-directory local-modules-dir 0) )


;; create directory if not present
(defun custom-make-dir (f)
  (if (not (file-exists-p f))
      (progn
        (message "creating directory at %s" f)
        (make-directory f))) )


(provide 'module-custom-func)