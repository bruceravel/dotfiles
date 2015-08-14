(if (= emacs-major-version 24)
    (setq stack-trace-on-error t)) ;; this is bad for emacs 23, but needed
                                   ;; to get ECB to load in emacs 24
                                   ;; see http://stackoverflow.com/questions/8833235/install-ecb-with-emacs-starter-kit-in-emacs-24

;; To deal with "ECB can only be used with" some old version of CEDET see
;; http://stackoverflow.com/a/16085284
;; bottom line: edit ecb-cedet-wrapper.el & alter ecb-cedet-required-version-max
(defalias 'perl-mode 'cperl-mode)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;(add-to-list 'load-path "~/.emacs.d/packages/highlight-indents/")
;(require 'highlight-indentation)

;;;;;;;;; keys ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
(global-set-key "\C-x/" 'point-to-register)
(global-set-key "\C-xj" 'register-to-point)
(global-set-key [f12] 'magit-status)

(add-to-list 'load-path "~/dotfiles/emacs/")
(require 'tbemail)
(add-to-list 'load-path "~/git/gnuplot-mode/")


;;;;;;;;; Major modes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'tt-mode             "tt-mode"          "Major mode for Template Toolkit files" t)
(autoload 'gnuplot-mode        "gnuplot"          "gnuplot major mode"                    t)
(autoload 'gnuplot-make-buffer "gnuplot"          "open a buffer in gnuplot-mode"         t)
(autoload 'markdown-mode       "markdown-mode.el" "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.demeter_conf$" . config-mode))
(add-to-list 'auto-mode-alist '("\\.tt$"           . tt-mode))
(add-to-list 'auto-mode-alist '("\\.org$"          . org-mode))
(add-to-list 'auto-mode-alist '("\\.md$"           . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.gp$"           . gnuplot-mode))

(add-hook 'tt-mode-hook 'linum-mode)
(add-hook 'tt-mode-hook 'auto-fill-mode)

(add-hook 'fortran-mode-hook 'linum-mode)

(require 'generic-x)
(add-to-list 'auto-mode-alist '("\\..*ignore$" . hosts-generic-mode))

;;;;;;;;; ecb and cedet ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load-file "~/dotfiles/emacs/load-ecb.el")
(add-to-list 'load-path "/home/bruce/dotfiles/emacs/ecb")
(require 'ecb)

;; search all open buffers that share the same mode as the active buffer.
;; see http://www.masteringemacs.org/articles/2011/07/20/searching-buffers-occur-mode/
(eval-when-compile
  (require 'cl))
 
(defun get-buffers-matching-mode (mode)
  "Returns a list of buffers where their major-mode is equal to MODE"
  (let ((buffer-mode-matches '()))
   (dolist (buf (buffer-list))
     (with-current-buffer buf
       (if (eq mode major-mode)
           (add-to-list 'buffer-mode-matches buf))))
   buffer-mode-matches))
 
(defun multi-occur-in-this-mode ()
  "Show all lines matching REGEXP in buffers with this major mode."
  (interactive)
  (multi-occur
   (get-buffers-matching-mode major-mode)
   (car (occur-read-primary-args))))
 
;; global key for `multi-occur-in-this-mode' - you should change this.
(global-set-key (kbd "M-s b") 'multi-occur-in-this-mode)


;; path-to-anything is the path which has the 'anything' we just cloned
;(add-to-list 'load-path "~/git/anything-config")
;(require 'anything-config)

;; see http://emacs-fu.blogspot.com/2011/09/finding-just-about-anything.html
;; (global-set-key (kbd "C-x b")
;;   (lambda() (interactive)
;;     (anything
;;      :prompt "Switch to: "
;;      :candidate-number-limit 10                 ;; up to 10 of each 
;;      :sources
;;      '( anything-c-source-buffers               ;; buffers 
;;         anything-c-source-recentf               ;; recent files 
;;         anything-c-source-bookmarks             ;; bookmarks
;;         anything-c-source-files-in-current-dir+ ;; current dir
;;         anything-c-source-locate))))            ;; use 'locate'



;;;;;;;;; skeletons ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; skeletons for my favorite Beamer construct in AucTex
(define-skeleton beamer-columns-skeleton
  "Insert two columns in a Beamer file"
  nil
  > "\\begin{columns}[T]" \n
  -1 " \\begin{column}{0.5\\linewidth}" \n _ \n
  -3 " \\end{column}" \n
  -1 " \\begin{column}{0.5\\linewidth}" \n \n
  -3 " \\end{column}" \n
  -2 "\\end{columns}")

(add-hook 'LaTeX-mode-hook 
	  (lambda ()
	    (auto-fill-mode t)
	    (reftex-mode t)
	    (define-key LaTeX-mode-map [(control c) (control \3)] 
	      'beamer-columns-skeleton)))


;;;;;;;;; ack integration ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (load-file "/home/bruce/dotfiles/emacs/ack-and-a-half.el")
;; (autoload 'ack-and-a-half-same "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half-find-file-same "ack-and-a-half" nil t)
;; (autoload 'ack-and-a-half-find-file "ack-and-a-half" nil t)
;; Create shorter aliases
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

(require 'mustache-mode)

;;;;;;;;; color theme ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; see http://blog.nozav.org/post/2010/07/12/Updated-tangotango-emacs-color-theme

;;;;;; Emacs 24: 
;;   also may need to examine ~/.emacs to be sure that the background
;;   color has not been somehow else set
(add-to-list 'custom-theme-load-path "~/dotfiles/emacs")
(load-theme 'tangotango t)



;;;;;; Emacs 23


;(require 'color-theme)
;(setq color-theme-load-all-themes nil)


;; (require 'color-theme-tangotango)
;; ; (require 'color-theme-bharadwaj)

;; ;; select theme - first list element is for windowing system, second is for console/terminal
;; ;; Source : http://www.emacswiki.org/emacs/ColorTheme#toc9
;; (setq color-theme-choices 
;;       '(color-theme-tangotango color-theme-tangotango))
;; ;      '(color-theme-bharadwaj color-theme-bharadwaj))

;; ;; default-start
;; (funcall (lambda (cols)
;;     	   (let ((color-theme-is-global nil))
;;     	     (eval 
;;     	      (append '(if (window-system))
;;     		      (mapcar (lambda (x) (cons x nil)) 
;;     			      cols)))))
;;     	 color-theme-choices)

;; ;; test for each additional frame or console
;; (require 'cl)
;; (fset 'test-win-sys 
;;       (funcall (lambda (cols)
;;     		 (lexical-let ((cols cols))
;;     		   (lambda (frame)
;;     		     (let ((color-theme-is-global nil))
;; 		       ;; must be current for local ctheme
;; 		       (select-frame frame)
;; 		       ;; test winsystem
;; 		       (eval 
;; 			(append '(if (window-system frame)) 
;; 				(mapcar (lambda (x) (cons x nil)) 
;; 					cols)))))))
;;     	       color-theme-choices ))
;; ;; hook on after-make-frame-functions
;; (add-hook 'after-make-frame-functions 'test-win-sys)

;; (color-theme-tangotango)
;; ;(color-theme-bharadwaj)

(load-library "powerline.el")
