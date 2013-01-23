;;set the directory of the configuration files
(setq EMACS_DIR "~/.emacs.d")

;; 设置背景颜色和字体颜色   
;;(set-foreground-color "green")   
;;(set-background-color "black") 

(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;;load different configuration files
(load-file (concat EMACS_DIR "/abbrev-skeleton.el"))

(load-file (concat EMACS_DIR "/my-auto-tex-cmd.el"))

;;vim emulate
(add-to-list 'load-path "~/.emacs.d/evil")
    (require 'evil)
    (evil-mode 1)

;;emacs package manager
;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;
;(unless (require 'el-get nil 'noerror)
;  (with-current-buffer
;      (url-retrieve-synchronously
;       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;    (goto-char (point-max))
;    (eval-print-last-sexp)))
;
;(el-get 'sync)

;;color theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

;;line number
(require 'linum)
	(global-linum-mode 1)

;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-publish-project-alist
      '(("note-org"
         :base-directory "/root/Documents/note/org"
         :publishing-directory "/root/Documents/note/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\"
		 href=\"./style/emacs.css\"
		 type=\"text/css\"/>")
        ("note-static"
         :base-directory "/root/Documents/note/org"
         :publishing-directory "/root/Documents/note/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "dennis@gmail.com")
		("weekreport-org"
         :base-directory "/root/Documents/weekreport/org"
         :publishing-directory "/root/Documents/weekreport/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\"
		 href=\"./style/emacs.css\"
		 type=\"text/css\"/>")
        ("weekreport-static"
         :base-directory "/root/Documents/weekreport/org"
         :publishing-directory "/root/Documents/weekreport/publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("wp" 
         :components ("weekreport-org" "weekreport-static")
         :author "dennis@gmail.com"
		)))
(global-set-key (kbd "<f8> p") 'org-publish)
;(setq ac-modes
;      (append ac-modes '(org-mode objc-mode jde-mode sql-mode
;                                  change-log-mode text-mode
;                                  makefile-gmake-mode makefile-bsdmake-mo
;                                  autoconf-mode makefile-automake-mode)))

;(setq org-latex-to-pdf-process
;      '("xelatex -interaction nonstopmode %b"
;        "xelatex -interaction nonstopmode %b"))

; graphviz dot
; C-cc 快速编译
; C-cp 预览图像
; M-; 注释或者取消注释
(load-file (concat EMACS_DIR "/graphviz-dot-mode.el"))

(add-hook 'find-file-hook (lambda()
                            (if (string= "dot" (file-name-extension
                                                buffer-file-name))
                                (progn
                                  (message "Enabling Setings for dot-mode")
                                  (setq fill-column 1000)
                                  (base-auto-pair)
                                  (local-set-key (kbd "<C-f6>") 'compile)
                                  )
                              )))

; slime
(setq inferior-lisp-program "/usr/bin/sbcl") ; sbcl or clisp
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime") ; your SLIME directory
(require 'slime)
(slime-setup)
;M-x slime

; key words auto complete
(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
      (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))
