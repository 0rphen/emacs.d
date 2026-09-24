(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes '(default))
 '(ledger-reports
   '(("benef"
      "%(binary) -f %(ledger-file) bal ^expenses ^income --invert")
     ("benefm"
      "%(binary) -f %(ledger-file) bal --period %(month) ^expenses ^income --invert")
     ("capital"
      "%(binary) -f %(ledger-file) bal  ^assets ^liabilities")
     ("capitalm"
      "%(binary) -f %(ledger-file) bal --period %(month) ^assets ^liabilities")
     ("regcap" "%(binary) -f %(ledger-file) reg ^assets ^liabilities")
     ("regcapm"
      "%(binary) -f %(ledger-file) reg --period %(month) ^assets ^liabilities")
     ("registro"
      "%(binary) -f %(ledger-file) reg %(account) --period %(month)")
     ("gastos" "%(binary) -f %(ledger-file) reg Expenses -S amount")
     ("gastosm"
      "%(binary) -f %(ledger-file) reg --period %(month) Expenses -S amount")
     ("cleared" "%(binary) -f %(ledger-file) cleared")
     ("clearedm"
      "%(binary) -f %(ledger-file) --period %(month) cleared")
     ("balance"
      "%(binary) -f %(ledger-file) bal %(account) --period %(month)")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("balm" "%(binary) -f %(ledger-file) bal --period %(month)")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)")))
 '(package-vc-selected-packages
   '((claude-code-ide :url
                      "https://github.com/manzaltu/claude-code-ide.el")))
 '(warning-suppress-types '((initialization) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
