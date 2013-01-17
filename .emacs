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
