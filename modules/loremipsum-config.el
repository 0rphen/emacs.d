;; -*- lexical-binding: t; -*-

(use-package lorem-ipsum
  :ensure t
  :bind(("C-c C-l s" . lorem-ipsum-insert-sentences)
        ("C-c C-l p" . lorem-ipsum-insert-paragraphs)
        ("C-c C-l l" . lorem-ipsum-insert-list)))

(provide 'loremipsum-config)
