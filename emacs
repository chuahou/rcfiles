;; enable local evil mode
(add-to-list 'load-path "~/dev/kiwami/submod/evil-mode")
(add-to-list 'load-path "~/dev/kiwami/submod/goto-chg")
(setq evil-want-C-i-jump nil) ;; <C-i> prevents <TAB> from working in terminal
(require 'evil)
(evil-mode 1)

;; org-mode settings
(require 'org)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c j") 'org-next-link)
(global-set-key (kbd "C-c k") 'org-previous-link)
(global-set-key (kbd "C-c h")
                (lambda () (interactive)(find-file "~/Dropbox/org/index.org")))
(setq org-agenda-files '("~/Dropbox/org/"))
(setq org-todo-keywords
      '((sequence "HOLD" "TRIAGE" "TODO" "NEXT" "|" "DONE")))
(setq org-link-frame-setup '((file . find-file)))
(setq org-agenda-span 5)
(setq org-agenda-start-on-weekday nil)
(setq safe-local-variable-values '((eval org-content 2)))

;; evil-org
(add-to-list 'load-path "~/dev/kiwami/submod/evil-org")
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

;; other settings
(setq-default display-line-numbers 'relative) ;; always show relative numbers
(menu-bar-mode -1)                            ;; remove menu bar
(xterm-mouse-mode 1)                          ;; set mouse mode
(global-set-key (kbd "<mouse-4>") 'scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'scroll-up-line)

;; disable autosave/backup files
(setq auto-save-default nil)
(setq backup-directory-alist '(("" . "~/emacs.d/backup")))
