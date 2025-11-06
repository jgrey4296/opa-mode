;;; flycheck-toml.el --- A Checker for toml files -*- lexical-binding: t; no-byte-compile: t; -*-
;; https://www.flycheck.org/en/latest/developer/developing.html#adding-a-checker
(require 'flycheck)

(flycheck-define-checker opa
  "A rego file checker using opa"
  :command ("opa" "check" source)
  :error-patterns (
                   (error "error occurred during loading: " (file) ":" (line) ": " (type) ": " (message) line-end)
                   )
  :modes (opa-mode)
  :standard-input nil
  )

;;;###autoload
(defun flycheck-opa-setup ()
  "Setup Flycheck for Kotlin."
  (add-to-list 'flycheck-checkers 'opa)
  )

(provide 'flycheck-opa)
;;; flycheck-toml.el ends here
