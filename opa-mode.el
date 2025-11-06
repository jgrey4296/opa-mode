;;; opa-mode.el -*- lexical-binding: t; no-byte-compile: t; -*-
;;-- header
;; File Commentary:
;; A Major mode for https://www.openpolicyagent.org/ files
;;
;;-- end header

;;--| imports

;;--| keymap

(defvar-local opa-mode-map
    (make-sparse-keymap))


;;--| font lock

(defconst opa-font-lock-keywords
    (rx-let ((w (x) (: x (0+ blank)))
                (g (x) (group x))
                (ln (: punctuation line-end))
                (word+ (group word-start (+ (| word punct)) (0+ blank)))
                (basic-syms (| "@" "+" "!" "<-" "?" "-" "&"))
                (basic-kws  (| "percept" "self" "include" "register_function"))
                (agent-ids (| "beliefs" "goals" "debug" "verbose" "ag-class" "ag-arch" "ag-bb-class" "myparameter" "instances" "join" "focus" "roles"))
                (org-ids   (| "responsible-for" "debug" "group" "players" "owner"))
                )
        (list

            )
        )
    "Highlighting for opa-mode"
    )

;;-- syntax

(defvar opa-mode-syntax-table
    (let ((st (make-syntax-table)))
        ;; Symbols
        (modify-syntax-entry ?. "_" st)
        (modify-syntax-entry ?! "_" st)
        (modify-syntax-entry ?$ "_" st)
        (modify-syntax-entry ?+ "_" st)
        (modify-syntax-entry ?- "_" st)
        (modify-syntax-entry ?? "_" st)
        (modify-syntax-entry ?@ "_" st)
        (modify-syntax-entry ?\; "_" st)
        ;;underscores are valid parts of words:
        (modify-syntax-entry ?_ "w" st)
        ;; Comments start with // and end on newlines
        (modify-syntax-entry ?/ ". 124" st)
        (modify-syntax-entry ?* "_ 23b" st)
        (modify-syntax-entry ?\n ">" st)
        ;; Strings
        (modify-syntax-entry ?\" "\"" st)
        ;; Pair parens, brackets, braces
        (modify-syntax-entry ?\( "()" st)
        (modify-syntax-entry ?\[ "(]" st)
        (modify-syntax-entry ?{ "(}" st)
        (modify-syntax-entry ?: ".:2" st)
        st)
    "Syntax table for the opa-mode"
    )

;;-- end syntax

;;-- mode definition

(define-derived-mode opa-mode fundamental-mode
    "opa"
    (interactive)
    (kill-all-local-variables)
    (use-local-map opa-mode-map)

    ;; font-lock-defaults: (keywords disable-syntactic case-fold syntax-alist)
    (set (make-local-variable 'font-lock-defaults) (list opa-font-lock-keywords nil))
    ;; (set (make-local-variable 'font-lock-syntactic-face-function) 'opa-syntactic-face-function)
    ;; (set (make-local-variable 'indent-line-function) 'opa-indent-line)
    (set (make-local-variable 'comment-style) '(plain))
    (set (make-local-variable 'comment-start) "//")
    (set (make-local-variable 'comment-use-syntax) t)
    (set-syntax-table opa-mode-syntax-table)
    ;;
    (setq major-mode 'opa-mode)
    (setq mode-name "opa")
    (outline-minor-mode)
    (yas-minor-mode)
    (run-mode-hooks)
    )
(add-to-list 'auto-mode-alist '("\.opa\'" . opa-mode))

;;-- end mode definition

(provide 'opa-mode)
;;; opa-mode.el ends here
