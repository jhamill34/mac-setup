;;;
;;; @author Joshua Rasmussen
;;; - flycheck // syntax checker
;;; - better auto-complete / snippets
;;; - helm configuration
;;; - language style config
;;;

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/")
	     t)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     t)

(package-initialize)

(load-theme 'monokai t)
(set-face-attribute 'default nil :height 150)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; (evil-mode)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-default 'cursor-type 'box)

(ido-mode)

(column-number-mode)

(show-paren-mode)
(winner-mode t)

(global-hl-line-mode)
(windmove-default-keybindings)

(exec-path-from-shell-initialize)

(ac-config-default)

(require 'nlinum)
(nlinum-mode)

(require 'rainbow-mode)

(require 'alpha)
(global-set-key (kbd "C-M-)") 'transparency-increase)
(global-set-key (kbd "C-M-(") 'transparency-decrease)

(global-set-key (kbd "C-M-v") 'switch-window)

(require 'all-the-icons)
(powerline-center-theme)
(setq powerline-default-separator 'wave)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;; Web development work flow

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (emmet-mode)))

;;; Jekyll work flow
;;; < For now just use term-mode and jekyll serve >

;;; Quick java work flow
;;; This is for when we want to work on a quick L33TCode exercise
;;; If we want to work on a more large scale project we have a gradle mode
;;; What we're lacking for this is the auto complete thought (eclimd ???)
(defun java-run(c)
  "Run the current java file"
  (interactive "sClass name: ")
  (with-output-to-temp-buffer "*java-output*"
    (shell-command
     (concat "java " (file-name-base c))
     "*java-output*"
     "*Messages*")))

(defun java-compile(c)
  "Compile the current java file"
  (interactive "sFile name: ")
  (compile 
   (concat "javac " c))
  (rename-buffer "*java-output*"))

(add-hook 'java-mode-hook
          (lambda ()
            (global-set-key (kbd "C-c m") 'java-compile)
            (global-set-key (kbd "C-c r") 'java-run)))


;;; LaTeX work flow
(auctex-latexmk-setup) 
(setq auctex-latexmk-inherit-TeX-PDF-mode t)
(setq preview-gs-command "/usr/local/bin/gs")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck helm markdown-mode rainbow-mode auctex-latexmk exec-path-from-shell auctex gradle-mode emmet-mode magit yasnippet switch-window evil-visual-mark-mode web-mode all-the-icons neotree dirtree powerline alpha monokai-theme nlinum auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
