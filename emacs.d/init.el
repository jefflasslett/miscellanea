(setq inhibit-splash-screen t)

; delete excess backup versions silently
(setq delete-old-versions -1 )

; use version control
(setq version-control t )

; make backups file even when in version controlled dir
(setq vc-make-backup-files t )

; which directory to put backups file
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) )

; don't ask for confirmation when opening symlinked file
(setq vc-follow-symlinks t )

;transform backups file name
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) )

; inhibit useless and old-school startup screen
(setq inhibit-startup-screen t )

; silent bell when you make a mistake
(setq ring-bell-function 'ignore )

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

; use utf-8 by default
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8 )

; sentence SHOULD end with only a point.
(setq sentence-end-double-space nil)

; toggle wrapping text at the 80th character
(setq default-fill-column 80)

(column-number-mode)

; print a default message in the empty scratch buffer opened at startup
(setq initial-scratch-message "This is your scratch buffer")

;; (setq treesit-extra-load-path "/usr/local/lib/tree-sitter")

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; Don't litter file system with *~ backup files; put them all inside
;; ~/.emacs.d/backup or wherever
(defun bedrock--backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* ((backupRootDir "~/.emacs.d/emacs-backup/")
         (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path
         (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") )))
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath))
(setq make-backup-file-name-function 'bedrock--backup-file-name)

(require 'package)

; tells emacs not to load any packages before starting up
(setq package-enable-at-startup nil)

;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; update packages archive
  (package-install 'use-package)) ; and install the most recent version of
				  ; use-package

(require 'use-package)

(use-package general :ensure t
  :config
  (general-define-key "C-'" 'avy-goto-word-1)
  )

(use-package avy :ensure t
  :commands (avy-goto-word-1)
  )

;; which-key: shows a popup of available keybindings when typing a long key
;; sequence (e.g. C-x ...)
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package emacs
  :config
  (load-theme 'modus-vivendi)) ; for light theme, use modus-operandi

;; Evil: vi emulation
(use-package evil
  :ensure t

  :init
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-redo)

  ;; Enable this if you want C-u to scroll up, more like pure Vim
  ;(setq evil-want-C-u-scroll t)

  :config
  (evil-mode)

  ;; Configuring initial major mode for some modes
  (evil-set-initial-state 'vterm-mode 'emacs))

;; To automatically prevent Key sequence starts with a non-prefix key errors
;; without the need to explicitly unbind non-prefix keys, you can add
;; (general-auto-unbind-keys) to your configuration file. This will advise
;; define-key to unbind any bound subsequence of the KEY. Currently, this
;; will only have an effect for general.el key definers. The advice can later
;; be removed with (general-auto-unbind-keys t).
(general-auto-unbind-keys)

(general-create-definer my-leader-def
  ;; :prefix my-leader
  :prefix "SPC")

(my-leader-def
  :keymaps 'normal
  ;; bind "SPC a"
  "'" 'avy-goto-word-1
  "w" 'evil-window-map)

(general-create-definer my-jump-leader-def
  ;; Avy leader. "j" for "jump"
  :prefix "SPC j"
  )

(my-jump-leader-def
  :keymaps 'normal
  "w" 'avy-goto-word-1
  "j" 'avy-goto-char-timer
  "l" 'avy-goto-line)

(use-package counsel
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  )

(general-create-definer my-file-leader-def
  ;; Search leader.
  :prefix "SPC f"
  )

(my-file-leader-def
  :keymaps 'normal
  "f" 'find-file)

(general-create-definer my-buffer-leader-def
  ;; Buffer leader. "b" for "buffer"
  :prefix "SPC b"
  )

(my-buffer-leader-def
  :keymaps 'normal
  "k" 'kill-buffer
  "b" 'ivy-switch-buffer
  "s" 'scratch-buffer
  "n" 'evil-buffer-new)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Built-in config for developers
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package emacs
  :config
  ;; Treesitter config

  ;; Tell Emacs to prefer the treesitter mode
  ;; You'll want to run the command `M-x treesit-install-language-grammar' before editing.
  (setq major-mode-remap-alist
        '((yaml-mode . yaml-ts-mode)
          (bash-mode . bash-ts-mode)
          (c-mode . c-ts-mode)
          (js2-mode . js-ts-mode)
          (json-mode . json-ts-mode)
          (ruby-mode . ruby-ts-mode)))
  :hook
  ;; Auto parenthesis matching
  ((prog-mode . electric-pair-mode)))

(use-package tree-sitter
  :ensure t
  :config
  ;; activate tree-sitter on any buffer containing code for which it has a parser available
  (global-tree-sitter-mode)
  ;; you can easily see the difference tree-sitter-hl-mode makes for python, ts or tsx
  ;; by switching on and off
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Version Control
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Magit: best Git client to ever exist
;; (use-package magit
;;   :ensure t
;;   :bind (("C-x g" . magit-status)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Common file types
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-ts-mode
  :hook ((markdown-mode . visual-line-mode)))

(use-package yaml-ts-mode
  :ensure t)

(use-package json-ts-mode
  :ensure t)

(use-package ruby-ts-mode)
;; (add-hook 'ruby-ts-mode-hook 'eglot-ensure)

;; Emacs ships with a lot of popular programming language modes. If it's not
;; built in, you're almost certain to find a mode for the language you're
;; looking for with a quick Internet search.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Eglot, the built-in LSP client for Emacs
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package eglot
  ;; no :ensure t here because it's built-in

  ;; Configure hooks to automatically turn-on eglot for selected modes
  :hook
  ((ruby-ts-mode c-ts-mode bash-ts-mode) . eglot-ensure)

  :custom
  (eglot-send-changes-idle-time 0.1)

  :config
  (fset #'jsonrpc--log-event #'ignore)  ; massive perf boost---don't log every event
  ;; Sometimes you need to tell Eglot where to find the language server
  (add-to-list 'eglot-server-programs
               '(ruby-ts-mode . ("bundle" "exec" "solargraph" "stdio"))
  	       )
  )


(add-hook 'before-save-hook #'time-stamp)

(setq org-default-notes-file "/home/jeff/todo.org" 
      initial-buffer-choice org-default-notes-file)
(find-file org-default-notes-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ignored-local-variable-values '((time-stamp-active . t)))
 '(package-selected-packages nil)
 '(safe-local-variable-values '((time-stamp-active . t))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
