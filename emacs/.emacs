;;; ############################################################################
;;! @file       .emacs
;;! @brief      GNU emacs configuration
;;! @author     0xD62EE11516877AA8
;;! @date       2016-09-17
;;! @copyright  GPLv3+

;; *****************************************************************************
;; Local load-path(s)
;; (add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/plugins")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; *****************************************************************************
;; Environment
(setq inhibit-startup-message t)
(add-to-list 'default-frame-alist '(height . 54))
(add-to-list 'default-frame-alist '(width  . 81))
(setq frame-title-format (concat  "%b @ " (system-name)))
(tool-bar-mode -1)
(setq visible-bell t)
(column-number-mode 1)
(line-number-mode 1)
(show-paren-mode 1)
(setq scroll-step 1)
(set-face-attribute 'default nil :height 100)  ;; font size
(setq org-src-fontify-natively t)  ;; org-mode code-block syntax
(setq-default major-mode 'text-mode)
(cua-mode t)

;; *****************************************************************************
;; Packages
(if (null window-system) ()
    (require 'color-theme) (color-theme-initialize)
    (require 'color-theme-tango) (color-theme-tango))
(require 'autopair) (autopair-global-mode) 
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'latex-mode-hook (lambda ()(flyspell-mode 1))) 
(add-hook 'tex-mode-hook   (lambda ()(flyspell-mode 1))) 
(setq auto-mode-alist (cons '("\\.tex" . latex-mode) auto-mode-alist))
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(autoload 'markdown-mode "markdown-mode.el" t)
(setq auto-mode-alist 
      (cons '("\\.md" . markdown-mode) 
	    auto-mode-alist))
(setq load-path 
      (cons (expand-file-name "~/.emacs.d/plugins/cmake-mode") 
	    load-path))
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "$HOME/.emacs.d/ac-dict")
;; (ac-config-default)
;; (require 'jabber)

;; *****************************************************************************
;; Functions
;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Contact information string
(defun contact-string () 
  "Contact information string" 
  (getenv "KEY"))
;; Contact
(defun insert-contact-string ()
  "Insert contact information."
  (interactive)
  (insert (contact-string)))

;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; Date/Time
(defun insert-date-string ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))
(defun insert-time-string ()
  "Insert a nicely formated time string."
  (interactive)
  (insert (format-time-string "%H:%M:%S")))
(defun insert-date-time-string ()
  "Insert a nicely formated date-time string."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

;; +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; File header/Footer

(defun set-is-hash-comment ()
  "Check if 'comment-start is a hash-symbol, \"#\"."
  (if (string-prefix-p "#" (format "%s" comment-start))
      (setq is-hash-comment 'true)
    (setq is-hash-comment 'nil)
    )
  )

(defun set-doxy-comment-start ()
  "Set a doxygen-friendly comment tag and value."
  (setq doxy-cmt-srt (concat comment-start "! @"))
  (if is-hash-comment (setq doxy-cmt-srt "##! @"))
  (if (eq major-mode 'c-mode) (setq doxy-cmt-srt "/*! @"))
  (if (eq major-mode 'c++-mode) (setq doxy-cmt-srt "//! @"))
  (if (or (eq major-mode 'lisp-mode) 
	  (eq major-mode 'emacs-lisp-mode)) 
      (setq doxy-cmt-srt ";;! @"))
  (if (or (eq major-mode 'html-mode) 
	  (eq major-mode 'markdown-mode)) 
      (setq doxy-cmt-srt "<!-- @"))
  (if (or (eq major-mode 'tex-mode)
          (eq major-mode 'latex-mode))
      (setq doxy-cmt-srt "%% @"))
  )

(defun insert-doxy-comment (tag value)
  "Insert a doxygen-friendly comment tag and value."
  (insert (concat doxy-cmt-srt tag value comment-end "\n"))
  )


(defun insert-file-meta ()
  "Insert a nicely formated meta-data header about this file."
  (set-doxy-comment-start)
  (insert-doxy-comment "file       " (file-name-nondirectory buffer-file-name))
  (insert-doxy-comment "brief      " "")
  (insert-doxy-comment "author     " (contact-string))
  (insert-doxy-comment "date       " (format-time-string "%Y-%m-%d"))
  (insert-doxy-comment "copyright  " "GPLv3+")
  )

(defun insert-file-eye-catcher ()
  "Insert an 80-character eye-catcher line for the file header."
  (if is-hash-comment 
      (insert (concat "### " 
		      "####################################" 
		      "####################################"
		      "####")))
  (if (eq major-mode 'c++-mode) 
      (insert (concat "//  " 
		      "####################################" 
		      "####################################"
		      "####")))
  (if (eq major-mode 'c-mode) 
      (insert (concat "/*  " 
		      "####################################" 
		      "####################################"
		      "  */")))
  (if (or (eq major-mode 'lisp-mode) 
	  (eq major-mode 'emacs-lisp-mode)) 
      (insert (concat ";;; " 
		      "####################################" 
		      "####################################"
		      "####")))
  (if (or (eq major-mode 'html-mode) 
  	  (eq major-mode 'markdown-mode)) 
      (insert (concat "<!--" 
		      "####################################" 
		      "####################################"
		      "#-->")))
  (if (or (eq major-mode 'tex-mode)
          (eq major-mode 'latex-mode))
      (insert (concat "%% "
                      "####################################"
                      "####################################"
                      "#####")))
  (insert "\n")
)

(defun insert-file-start ()
  "Insert a script-file starter."
  (if (eq major-mode 'sh-mode)     
      (insert "#!  /usr/bin/env bash\n"))
  (if (eq major-mode 'python-mode) 
      (insert "#!  /usr/bin/env python\n"))
  )

(defun insert-file-header ()
  "Insert a nicely formated informational header about this file."
  (interactive)
  (insert-file-start)
  (set-is-hash-comment)
  (insert-file-eye-catcher)
  (insert-file-meta)
  )

(defun insert-file-end ()
  "Insert a file ender."
  (insert "\n")
  (if is-hash-comment (insert "### "))
  (if (eq major-mode 'c++-mode) (insert "//  "))
  (if (eq major-mode 'c-mode) (insert "/*  "))
  (if (or (eq major-mode 'lisp-mode) 
	  (eq major-mode 'emacs-lisp-mode)) (insert ";;; "))
  (if (or (eq major-mode 'html-mode) 
  	  (eq major-mode 'markdown-mode)) (insert "<!--"))
  (if (or (eq major-mode 'tex-mode)
          (eq major-mode 'latex-mode)) (insert "%% "))
  (insert (concat "end " (file-name-nondirectory buffer-file-name)
		  comment-end "\n"))
  )

(defun insert-file-footer ()
  "Insert a nicely formated informational footer about this file."
  (interactive)
  (set-is-hash-comment)
  (insert-file-end)
  (insert-file-eye-catcher)
  )

(defun insert-file-header-footer ()
  "Insert header+footer."
  (interactive)
  (insert-file-header)
  (insert "\n")
  (insert-file-footer)
)

;; *****************************************************************************
;; Keyboard shortcuts 
(global-set-key       "\M-g"  'goto-line)
(global-set-key (kbd "C-c d") 'insert-date-string)
(global-set-key (kbd "C-c t") 'insert-time-string)
(global-set-key (kbd "C-c D") 'insert-date-time-string)
(global-set-key (kbd "C-c C") 'insert-contact-string)
(global-set-key (kbd "C-c H") 'insert-file-header)
(global-set-key (kbd "C-c F") 'insert-file-footer)
(global-set-key (kbd "C-c N") 'insert-file-header-footer)

;;; end .emacs 
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
