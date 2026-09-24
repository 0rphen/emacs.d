# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal Emacs configuration (`~/.emacs.d`), meant to be cloned onto any machine and produce a
100% working setup. Package manager is stock `package.el` + `use-package` (no straight/elpaca).
Emacs 30.1+.

## Commands

There is no build/lint/test tooling — this is Emacs Lisp config, not a package with a test suite.
Validate changes by loading them:

```sh
# Syntax-check one file without side effects
emacs --batch --eval '(with-temp-buffer (insert-file-contents "modules/foo-config.el") (goto-char (point-min)) (while (not (eobp)) (read (current-buffer))))'

# Full batch load of init.el (catches require/load-order errors)
cd ~/.emacs.d && emacs --batch -l init.el --eval '(message "INIT-OK")'

# Simulate a fresh machine (fresh HOME, real package install from MELPA/GNU ELPA)
git clone . /tmp/emacs-test
HOME=/tmp/fakehome emacs --batch --init-directory=/tmp/emacs-test -l /tmp/emacs-test/init.el
```

Interactively: `M-x eval-buffer` on a module, or restart Emacs and check `*Messages*` /
`--debug-init`.

## Architecture

- **`init.el`** — the only entrypoint. Order matters: it sets up `package-archives`, does a
  package-index bootstrap (`package-refresh-contents` when empty) and sets
  `use-package-always-ensure t` *before* requiring anything else, so every module below can rely
  on `:ensure` being implicit. It then adds `modules/` (and `modules/meow/`) to `load-path` and
  `require`s each module in sequence.
- **`modules/*.el`** — one file per package/feature, each wrapping a single `use-package` block
  (or a few related ones) and ending in `(provide 'xxx-config)`. This is the pattern to follow
  for **every** package, no exceptions — never add a bare `use-package` directly in `init.el`:
  create `modules/<name>-config.el`, `(provide '<name>-config)`, add `(require '<name>-config)`
  to `init.el` in a sensible spot (theme/UI modules load early, before things like
  `dashboard-config` that reference icons/faces from them; anything another module `require`s
  directly at load time, like `web-mode-config` before `vue-config`, must be required earlier).
- **`modules/settings-config.el`** — not a package wrapper; holds hand-written global settings
  (default font, UI chrome, keybindings, backup/autosave paths, `treesit-language-source-alist`).
  Loaded after `custom.el`/`custom-local.el`.
- **`custom.el`** vs **`custom-local.el`** — `custom.el` is committed and holds only
  customizations meant to be shared across machines (themes, `ledger-reports`,
  `package-vc-selected-packages`). `init.el` loads it explicitly, then repoints
  `custom-file` at `custom-local.el` (gitignored) so any interactive `M-x customize` write lands
  there instead of dirtying the tracked file. Never hand-edit the `custom-set-variables` block in
  `custom.el` for machine-specific values — those belong in `init-local.el`.
- **`init-local.el`** (gitignored, see `init-local.el.example`) — loaded last, for per-machine
  overrides (real org-roam directory, CLI paths, font). Modules that need a machine-specific
  value expose a `defvar` with a portable default (e.g. `my/org-roam-directory` in
  `modules/org-roam-config.el`) that `init-local.el` can override, or resolve it dynamically via
  `executable-find`/`expand-file-name` (e.g. `claude-code-ide-cli-path` in
  `modules/claude-code-ide-config.el`, the Vue `tsdk` lookup in `modules/vue-config.el`).
- **`claude-code-ide-config.el`** installs `claude-code-ide` via `:vc` (from
  github.com/manzaltu/claude-code-ide.el) instead of MELPA — it needs `:ensure nil` alongside
  `:vc` since `use-package-always-ensure` is on globally.
- **Diary vs. `org-agenda-files`** (`init.el`) — the plain-text `diary` file uses Emacs diary
  syntax, not org syntax. It's wired to the `diary-file` variable (picked up via
  `org-agenda-include-diary`), never added to `org-agenda-files`. Putting it in
  `org-agenda-files` makes org try to `org-element`-parse it and fail at runtime with
  `error "Cache must be active"` (surfaces as a dashboard-resize error since the dashboard's
  agenda widget triggers the scan). Real `.org` agenda files belong in `org-agenda-files`,
  set from `init-local.el`.

## Conventions to preserve

- No absolute/user-specific paths in tracked files — use `expand-file-name`,
  `executable-find`, or a `defvar` overridable from `init-local.el`. `.gitignore` already
  excludes generated/personal state (`elpa/`, `eln-cache/`, `.cache/`, `diary`, `recentf`,
  `bookmarks`, `org-roam.db`, etc.) — don't try to track those, and don't add secrets/tokens
  anywhere in `modules/` or `custom.el`.
- Keep each module self-contained and requireable independently (own `use-package`, own
  `(provide ...)`); don't reach into another module's internals from outside it.
