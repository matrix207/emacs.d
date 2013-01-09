(put 'upcase-region 'disabled nil)

;;(set-background-color "black") ;; 使用黑色背景
;;(set-foreground-color "green") ;; 使用白色前景
 
;;(set-face-foreground 'region "red")  ;; 区域前景颜色设为红色
;;(set-face-background 'region "blue") ;; 区域背景色设为蓝色

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)  
(color-theme-hober) 

;;(color-theme-initialize)
;;(color-theme-oswald)

(add-to-list 'load-path "~/.emacs.d/evil")
    (require 'evil)
    (evil-mode 1)

