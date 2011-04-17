(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; fuzzy finding no ido
(global-linum-mode t)
(tool-bar-mode nil)
(menu-bar-mode nil)
(scroll-bar-mode nil)
(setq make-backup-files nil)
(setq require-final-newline t)
(setq icomplete-mode t)
(show-paren-mode t)
(setq x-select-enable-clipboard t)
(setq split-width-threshold nil)
(setq inhibit-startup-screen t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; I'm using an alias for guile so it is wrapped by nlwrap.
;; This causes problems when it's running as the scheme-program
;; in emacs, so here we use the original command, skipping
;; the alias.
(setq scheme-program-name "\guile")

(custom-set-faces
 '(default ((t (:foreground "ivory" :background "black" :family "Inconsolata" :height 140))))
 '(cursor ((t (:background "lavender" :foreground "black"))))
 '(show-paren-match ((t (:background "dark cyan"))))
 '(isearch ((t (:background "light green" :foreground "black"))))
 '(linum ((t (:foreground "LightBlue3"))))
 '(font-lock-constant-face ((t (:foreground "MistyRose3"))))
 '(font-lock-string-face ((t (:foreground "LightBlue3"))))
 '(font-lock-builtin-face ((t (:foreground "Goldenrod"))))
 ;'(font-lock-builtin-face ((t (:foreground "ivory"))))
 '(font-lock-keyword-face ((t (:foreground "khaki1"))))
 '(font-lock-preprocessor-face ((t (:foreground "ffa0a0"))))
 '(font-lock-comment-face ((t (:foreground "#62c600"))))
 '(font-lock-type-face ((t (:foreground "navajo white"))))
 '(font-lock-function-name-face ((t (:foreground "LightBlue4" :weight bold))))
)
