;; utils
;;;;;;;;
(defun add-to-path-if-exists (file-name)
  (if (file-readable-p file-name)
      (add-to-list 'load-path file-name)))


;; modes for diferent filetypes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (add-to-path-if-exists "~/.emacs.d/ledger/")
    (load "ledger"))

(load "auctex.el" nil t t)


;; ido
;;;;;;
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; fuzzy finding no ido
(setq icomplete-mode t)


;; Inferior programs
;;;;;;;;;;;;;;;;;;;;

;; I'm using an alias for guile so it is wrapped by nlwrap.
;; This causes problems when it's running as the scheme-program
;; in emacs, so here we use the original command, skipping
;; the alias.
(setq scheme-program-name "\guile")


;; Misc
;;;;;;;

(setq make-backup-files nil)
(setq require-final-newline t)
(setq x-select-enable-clipboard t)
(setq inhibit-startup-screen t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; UI customization
;;;;;;;;;;;;;;;;;;;;

(global-linum-mode t)
(show-paren-mode t)
(setq split-width-threshold nil)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq default-frame-alist '((width . 100) (height . 35)))

;; font settings
(custom-set-faces
 '(default ((t (:foreground "ivory" :background "black" :family "Inconsolata" :height 120))))
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
