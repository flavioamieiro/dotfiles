;; utils
;;;;;;;;
(defun add-to-path-if-exists (file-name)
  (if (file-readable-p file-name)
      (add-to-list 'load-path file-name)))

;; adds MELPA repos
;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar required-packages
  '(better-defaults
    material-theme
    elpy
    flycheck
    expand-region
    magit))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      required-packages)

;; Base changes
;;;;;;;;;;;;;;;
(require 'better-defaults)

;; modes for diferent filetypes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (add-to-path-if-exists "~/.emacs.d/ledger/")
    (load "ledger"))

(load "auctex.el" nil t t)

(pyenv-mode)

(defun ssbb-pyenv-hook ()
  "Automatically activates pyenv version if .python-version file exists."
  (f-traverse-upwards
   (lambda (path)
     (let ((pyenv-version-path (f-expand ".python-version" path)))
       (if (f-exists? pyenv-version-path)
	   (pyenv-mode-set (s-trim (f-read-text pyenv-version-path 'utf-8))))))))

(ssbb-pyenv-hook)

(add-to-list 'exec-path "~/.pyenv/shims")
(elpy-enable)
;(elpy-use-ipython)

(setq elpy-rpc-virtualenv-path 'current)

(add-hook 'git-commit-setup-hook 'git-commit-turn-on-flyspell)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(add-hook 'elpy-mode-hook #'hs-minor-mode)
(require 'rust-mode)
(add-hook 'rust-mode-hook (lambda () (setq indent-tabs-mode nil)))

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

;; Processing
(setq processing-location "~/bin/processing-java")
(setq processing-application-dir "~/Installs/processing/")
(setq processing-sketchbook-dir "~/sketchbook/")


;; Misc
;;;;;;;

(setq inhibit-startup-screen t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "<f5>") 'recompile)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)
(setq org-cycle-separator-lines -1)


;; UI customization
;;;;;;;;;;;;;;;;;;;;

(global-linum-mode t)
(setq split-width-threshold nil)

(setq default-frame-alist '((width . 100) (height . 35)))

(load-theme 'jbeans t)

(setq split-height-threshold nil)
(setq split-width-threshold 160)
(setq magit-blame-echo-style 'headings)
