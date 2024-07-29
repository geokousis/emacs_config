(setq package-archives '(("gnu" . "http://mirrors.163.com/elpa/gnu/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("elpa". "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(global-display-line-numbers-mode 1)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))

;;; Automatically update file that was modified elsewhere

(use-package autorevert
  :config
  (global-auto-revert-mode 1)
  )

(use-package nerd-icons)

(use-package all-the-icons)
;; Also run M-x all-the-icons-install-fonts

(use-package all-the-icons-completion
  :config
  (all-the-icons-completion-mode 1)
  )

;; (use-package company
;;   :config
;;   (setq company-idle-delay 0.05

(use-package corfu
  :custom
  (corfu-auto 1)
  (corfu-cycle t)
  :config
  (global-corfu-mode)
  )

;; (use-package emacs-popon
;;   ;; :load-path "~/.emacs.d/emacs-popon"
;;   )

(use-package corfu-terminal
  ;; :load-path "~/.emacs.d/emacs-corfu-terminal"
  :demand t
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode +1))
  )

(use-package vertico
  :init (vertico-mode)
  )

(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package eglot
  :ensure t
  :defer t
  :hook (python-mode . eglot-ensure))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5))

(use-package tree-sitter
  :config
  (tree-sitter-hl-mode 1)
  :custom
  (treesit-font-lock-level 4)
  )

(use-package tree-sitter-langs)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode))

(use-package magit
  :bind("C-c C-m" . magit-status))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; Require snakemake-mode package
(require 'snakemake-mode)

;; Associate snakemake-mode with Snakemake files
(add-to-list 'auto-mode-alist '("\\.smk\\'" . snakemake-mode))
(add-to-list 'auto-mode-alist '("\\Snakefile\\'" . snakemake-mode))

;; Optionally, you can also add a hook to activate snakemake-mode for snakefile
(add-hook 'snakemake-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)  ;; Use spaces instead of tabs
            (setq tab-width 4)))         ;; Set tab width to 4 spaces
