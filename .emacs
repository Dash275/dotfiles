(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "~/opt/android")
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(c-set-offset (quote defun-close) t)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(enh-ruby-extra-keywords (quote ("public" "private")))
 '(global-font-lock-mode 1)
 '(global-linum-mode 1)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#073642" . 0) ("#546E00" . 20) ("#00736F" . 30) ("#00629D" . 50) ("#7B6000" . 60) ("#8B2C02" . 70) ("#93115C" . 85) ("#073642" . 100))))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(magit-diff-use-overlays nil)
 '(markdown-command "~/Markdown_1.0.1/markdown.pl")
 '(markdown-command-needs-filename t)
 '(markdown-enable-math t)
 '(org-agenda-files (quote ("~/Dropbox/org_files" "~/Dropbox/org" "~/org_files" "~/org")))
 '(org-support-shift-select t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(syslog-debug-face (quote ((t :background unspecified :foreground "#2aa198" :weight bold))))
 '(syslog-error-face (quote ((t :background unspecified :foreground "#dc322f" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#859900"))))
 '(syslog-info-face (quote ((t :background unspecified :foreground "#268bd2" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#b58900"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#d33682"))))
 '(syslog-warn-face (quote ((t :background unspecified :foreground "#cb4b16" :weight bold))))
 '(tab-always-indent 1)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(w32-send-sys-command 61488)
 '(weechat-color-list (quote (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))

;;; Variables and dependencies

(require 'package)
(package-initialize)
(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

;;; void style_n_behavior(defaults)
;;; {
(require 'uniquify)
(require 'pretty-lambdada)
(require 'android-mode)
(setq uniquify-buffer-name-style 'forward) ;folder/file in event of duplicates
(setq-default c-default-style "bsd"
  c-basic-offset 2) ;2 space, braces on own line one below code
(electric-indent-mode t) ;auto-depth-indent
(electric-pair-mode t) ;auto-close parens and braces
(setq-default indent-tabs-mode nil) ;tabs are spaces
(setq-default tab-width 4) ;tabs are 4 wide
(setq backup-inhibited t) ;no #files# everywhere
(setq auto-save-default nil) ;no ~files everywhere
(setq make-backup-files nil) ;and I mean it
(setq auto-complete-mode t) ;tab auto-completes commands
(setq x-select-enable-clipboard t) ;use system clipboard
(if window-system ;84x25 window please, but may have to start emacs with arg:
    (set-frame-size (selected-frame) 84 25)) ;-geometry 84x25
(setq frame-title-format '(buffer-file-name "%f")) ;Set window title to this.
(global-hi-lock-mode 1) ;highlight mode everywhere
(menu-bar-mode 0) ;no menu bar
(setq scroll-step 1) ;scroll by lines, not pages
(setq default-major-mode 'text-mode) ;new buffer = text
;;; }

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "monoOne" :foundry "unknown" :slant normal :weight normal :height 128 :width normal))))
 '(enh-ruby-op-face ((t (:foreground "color-34"))) t)
 '(enh-ruby-regexp-delimiter-face ((t (:foreground "color-160"))) t)
 '(enh-ruby-string-delimiter-face ((t (:foreground "color-34"))) t)
 '(linum ((t (:background "#232323" :foreground "gray26"))))
 '(minibuffer-prompt ((t (:foreground "#FF6600"))))
 '(mode-line ((t (:background "#181818" :foreground "#CC7833" :box (:line-width -1 :color "#181818")))))
 '(mode-line-buffer-id ((t (:background "#181818" :foreground "#FFC66D"))))
 '(mode-line-emphasis ((t nil)))
 '(mode-line-highlight ((t (:background "#181818" :box (:line-width -1 :color "#181818" :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#181818" :foreground "grey40" :weight light)))))

;;; Functions

;; Hook functions (style)
(defun pear/php-mode-init () 
;; Pear coding standards : http://pear.php.net/manual/en/standards.indenting.php
  (setq case-fold-search t
    indent-tabs-mode nil
    fill-column 78
    c-basic-offset 4)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-close 0)
  (c-set-style "k&r")
  (c-set-offset 'brace-list-close 0)
  (c-set-offset 'defun-close 0))
(defun no_indents ()
  (set (make-local-variable 'electric-indent-mode) nil))
(defun lisp_offsets ()
  ((set (make-local-variable 'lisp-indent-offset) 2)
   (set (make-local-variable 'lisp-indent-function) 2)
   (setq-local 'tab-width 2)))
(defun 4_indent () (setq tab-width 4))

;; Interactive fuctions
(defun zsh () (interactive) (ansi-term "/bin/zsh"))
(defun bash () (interactive) (ansi-term "/bin/bash"))
(defun path () (interactive) (message (buffer-file-name)))
(defun whitesmith-mode () (interactive)
  (c-set-style "whitesmith")
  (c-set-offset 'brace-list-close 0)
  (c-set-offset 'defun-close 0))
(defun long_lines () (interactive)
  (highlight-lines-matching-regexp ".\\{81\\}" 'hi-green-b))

;;; Modes and hooks

;; PHP: Pear standards
(add-hook 'php-mode-hook 'long_lines)
(add-hook 'php-mode-hook 'pear/php-mode-init)

;; Org: No electric indents, close todo's with time and notes
(add-hook 'org-mode-hook 'no_indents)
(add-hook 'org-mode-hook '4_indent)
(add-hook 'org-mode-hook 'pretty-lambda-mode)
(setq org-log-done 'time)
(setq org-log-done 'note)
(define-key global-map "\C-ca" 'org-agenda)

;; Python
(add-hook 'python-mode-hook 'long_lines)
(add-hook 'python-mode-hook 'no_indents)
(add-hook 'python-mode-hook '4_indent)
(add-hook 'python-mode-hook 'pretty-lambda-mode)

;; R
(load-file "~/.emacs.d/emacs-for-python/epy-init.el") ;ESS $PATH
(add-to-list 'load-path "~/.emacs.d/ess/lisp") (load "ess-site") ;load ESS
(add-hook 'ess-mode-hook 'long_lines)
(add-hook 'ess-mode-hook 'pretty-lambda-mode)

;; C/C++
(add-hook 'c-mode-hook 'long_lines)
(add-hook 'c-mode-hook 'pretty-lambda-mode)
(add-hook 'c++-mode-hook 'long_lines)
(add-hook 'c++-mode-hook 'pretty-lambda-mode)

;; D
(load-file "~/.emacs.d/modes/d-mode.el") ;d-mode $PATH
(autoload 'd-mode "d-mode" "Major mode for editing D code." t) ;d-mode init
(add-to-list 'auto-mode-alist '("\\.d[i]?\\'" . d-mode)) ;d-mode in d files
(add-hook 'd-mode-hook 'long_lines)
(add-hook 'd-mode-hook 'pretty-lambda-mode)

;; Lisps: No electric indents, 2 space indent
(add-hook 'lisp-mode-hook 'long_lines)
(add-hook 'lisp-mode-hook 'no_indents)
(add-hook 'lisp-mode-hook 'lisp_offsets)
(add-hook 'lisp-mode-hook 'pretty-lambda-mode)
(add-hook 'emacs-lisp-mode-hook 'no_indents)
(add-hook 'emacs-lisp-mode 'lisp_offsets)
(add-hook 'emacs-lisp-mode-hook 'pretty-lambda-mode)

;; HTML: Use web-mode, not html-mode
(add-hook 'html-mode-hook 'long_lines)
(add-hook 'html-mode-hook 'web-mode)
(add-hook 'html-mode-hook 'pretty-lambda-mode)

;;; Hotkeys and chords

(global-set-key (kbd "C-c C-l") 'goto-line)
(global-set-key (kbd "C-M-/") 'hippie-expand)
(global-set-key (kbd "M-/") 'auto-complete)
(global-set-key [f5] 'whitesmith-mode)
(global-set-key [f8] 'long_lines)
(global-set-key [f9] 'auto-complete-mode)
(global-set-key [f10] 'global-linum-mode)
(global-set-key [f12] 'menu-bar-mode)

;;; Theme
;;; (So if emacs blinds you when you start up, it has a broken ~/.emacs)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(require 'color-theme)
(load-file "~/.emacs.d/themes/color-theme-railscasts.el")
(defun my_color_theme () (color-theme-railscasts))
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
       (run-with-timer 1 nil 'my_color_theme)))

;; Also, if emacs themes, but doesn't open an argumented file,
;; Some lisp in .emacs was wrong. x_x
;; Hours wasted putting parens all over the place: 3
