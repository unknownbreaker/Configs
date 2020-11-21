;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Robert Yang"
      user-mail-address "rob.yang@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
(setq doom-font (font-spec :family "Hack Nerd Font" :size 9 :weight 'semi-light))
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dark+)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Library/Mobile Documents/com~apple~CloudDocs/Org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (after! org-roam
;;   (setq org-roam-directory "~/Library/Mobile\ Documents/com\\~apple\\~CloudDocs/org-roam")
;;   (setq org-roam-graph-viewer "/usr/bin/open")
;;   (setq org-roam-ref-capture-templates
;;     '(("r" "ref" plain (function org-roam-capture--get-point)
;;       "%?"
;;       :file-name "websites/${slug}"
;;       :head "#+TITLE: ${title}
;;   #+ROAM_KEY: ${ref}
;;   - source :: ${ref}"
;;     :unnarrowed t)))
;;   (map! :leader
;;     :prefix "n"
;;     :desc "org-roam" "l" #'org-roam
;;     :desc "org-roam-insert" "i" #'org-roam-insert
;;     :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
;;     :desc "org-roam-find-file" "f" #'org-roam-find-file
;;     :desc "org-roam-show-graph" "g" #'org-roam-show-graph
;;     :desc "org-roam-insert" "i" #'org-roam-insert
;;     :desc "org-roam-capture" "c" #'org-roam-capture)
;;     (add-hook 'after-init-hook 'org-roam-mode))

;; (use-package deft
;;   :after org
;;   :bind
;;   ("C-c n d" . deft)
;;   :custom
;;   (deft-recursive t)
;;   (deft-use-filter-string-for-filename t)
;;   (deft-default-extension "org")
;;   (deft-directory "~/Library/Mobile\ Documents/com\\~apple\\~CloudDocs/org-roam"))

;; (use-package org-journal
;;   :bind
;;   ("C-c n j" . org-journal-new-entry)
;;   :custom
;;   (org-journal-date-prefix "#+TITLE: ")
;;   (org-journal-file-format "%Y-%m-%d.org")
;;   (org-journal-dir "~/Library/Mobile\ Documents/com\\~apple\\~CloudDocs/org-roam")
;;   (org-journal-date "%A, %d %B %Y"))


;; OTHER CONFIGS
;; Several configs together for HTML/ES6/React development.
(add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode)) ;; auto-enable for .js/.jsx files
;; (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

;; (require 'flycheck)

;; (setq-default flycheck-disabled-checkers
;;               (append flycheck-disabled-checkers
;;                       '(javascript-jshint json-jsonlist)))
;; (add-hook 'flycheck-mode-hook 'add-node-modules-path)
;;

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))


(add-hook 'web-mode-hook  'emmet-mode)

;; DIRED
(setq dired-dwim-target t)

;; Auto complete
(setq company-idle-delay 0.1
      company-minimum-prefix-length 2)

;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-show-early-on-C-h t)
;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.
(setq which-key-idle-delay 10000)
(setq which-key-idle-secondary-delay 0.05)
(which-key-mode)

;; Tabs to 2
(setq js-indent-level 2)
