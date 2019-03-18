;;; -*- mode: Emacs-Listp -*-
;;; @author Joshua Rasmussen
;;;

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives 
       '("melpa-stable" . "http://stable.melpa.org/packages/"))

(add-to-list 'package-archives
       '("org" . "http://orgmode.org/elpa/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package 
  monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

(set-face-attribute 'default nil :height 150)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

;; (evil-mode)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(display-time-mode 1)
(set-default 'cursor-type 'box)

(column-number-mode)

(show-paren-mode)
(winner-mode t)

(global-hl-line-mode)
(windmove-default-keybindings)

(use-package 
  exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package 
  auto-complete
  :ensure t
  :config
  (ac-config-default))

(use-package
  magit
  :ensure t)

(use-package 
  nlinum
  :ensure t
  :config 
  (nlinum-mode))

(use-package
  rainbow-mode
  :ensure t
  :commands rainbow-mode)

(use-package 
  switch-window
  :ensure t
  :config
  (global-set-key (kbd "C-M-v") 'switch-window))

(use-package 
  all-the-icons
  :ensure t)

(use-package
  powerline
  :ensure t
  :config
  (powerline-center-theme)
  (setq powerline-default-separator 'wave))

(use-package 
  neotree
  :ensure t
  :config 
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(use-package 
  helm
  :ensure
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  (define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))

(global-set-key (kbd "M-x") 'helm-M-x)

(use-package
  helm-projectile
  :commands (helm-projectile helm-projectile-switch-project)
  :ensure t)

(use-package
  projectile
  :ensure t
  :defer 1
  :config
  (projectile-mode)
  (setq projectile-enable-caching t)
  (setq projectile-mode-line
        '(:eval (format " Proj[%s]" (projectile-project-name)))))

(use-package dictionary :ensure t)

(use-package 
  flycheck
  :ensure t
  :commands flycheck-mode)

;;; Web development work flow

(use-package
  emmet-mode
  :ensure t
  :commands emmet-mode)

(use-package 
  css-mode
  :ensure t
  :config
  (add-hook 'css-mode-hook (lambda () (rainbow-mode))))

(use-package
  yaml-mode
  :ensure t
  :commands yaml-mode)

(use-package
  rjsx-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (defun rjsx-mode-config()
    "Configure RJSX mode"
    (define-key rjsx-mode-map (kbd "C-j") 'rjsx-delete-creates-full-tag))
  (add-hook 'rjsx-mode-hook 'rjsx-mode-config))

(use-package 
  web-mode
  :ensure t
  :defer t 
  :config 
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-style-padding 2)
            (yas-minor-mode t)
            (emmet-mode)))

(use-package
  markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :config
  (define-key markdown-mode-map (kbd "<C-return>") 'markdown-insert-list-item)
  (define-key markdown-mode-map (kbd "C-c '")      'fence-edit-code-at-point)
  (define-key markdown-mode-map (kbd "C-c 1")      'markdown-insert-header-atx-1)
  (define-key markdown-mode-map (kbd "C-c 2")      'markdown-insert-header-atx-2)
  (define-key markdown-mode-map (kbd "C-c 3")      'markdown-insert-header-atx-3)
  (define-key markdown-mode-map (kbd "C-c 4")      'markdown-insert-header-atx-4)
  (define-key markdown-mode-map (kbd "C-c 5")      'markdown-insert-header-atx-5)
  (define-key markdown-mode-map (kbd "C-c 6")      'markdown-insert-header-atx-6)

  (add-hook 'markdown-mode-hook (lambda ()
                                  (visual-line-mode t)
                                  (set-fill-column 80)
                                  (turn-on-auto-fill)
                                  ;; Don't wrap Liquid tags
                                  (setq-local auto-fill-inhibit-regexp "{% [a-zA-Z]+")
                                  (flyspell-mode))))

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

(use-package
  tex-mode 
  :ensure auctex)

;;; LaTeX work flow
(use-package 
  auctex-latexmk
  :ensure t
  :config
  (auctex-latexmk-setup)
  (setq auctex-latexmk-inherit-TeX-PDF-mode t)
  (setq preview-gs-command "/usr/local/bin/gs"))

(use-package 
  yasnippet
  :ensure t
  :defer t
  :config 
  (yas-reload-all)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"
                           "~/.emacs.d/remote-snippets"))
  (setq tab-always-indent 'complete)
  (setq yas-prompt-functions '(yas-completing-prompt
                               yas-ido-prompt
                               yas-dropdown-prompt))
  (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet))

(use-package 
  yasnippet-snippets
  :ensure t)

(use-package
  eimp
  :ensure t
  :config
  (add-hook 'image-mode-hook 'eimp-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rjsx-mode yaml-mode eimp flycheck helm markdown-mode rainbow-mode auctex-latexmk exec-path-from-shell auctex gradle-mode emmet-mode magit yasnippet switch-window evil-visual-mark-mode web-mode all-the-icons neotree dirtree powerline alpha monokai-theme nlinum auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
