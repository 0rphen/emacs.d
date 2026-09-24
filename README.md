# .emacs.d

Configuración personal de Emacs (30.1+), gestionada con `package.el` +
`use-package`. Pensada para clonarse tal cual en cualquier equipo.

## Instalación

```sh
mv ~/.emacs.d ~/.emacs.d.bak   # si ya tienes uno
git clone git@github.com:0rphen/emacs.d.git ~/.emacs.d
emacs
```

En el primer arranque Emacs refresca los índices de paquetes e instala todo
lo declarado (puede tardar unos minutos). Al terminar, instala las
gramáticas de tree-sitter:

```
M-x treesit-auto-install-all
```

Y opcionalmente los iconos:

```
M-x nerd-icons-install-fonts
M-x all-the-icons-install-fonts
```

## Requisitos

- Emacs 30.1+, compilado con soporte de módulos dinámicos y, si se quiere
  arranque rápido, con native-comp (`libgccjit`).
- Fuente [Fira Code](https://github.com/tonsky/FiraCode) instalada en el
  sistema (`modules/settings-config.el` la fija como fuente por defecto).
- `git` (magit, blamer).
- `ripgrep` (usado por `consult`).

### Opcionales, según lo que uses

- `ag` (the silver searcher).
- `ledger` — solo para los reportes de `ledger-reports` en `custom.el`.
- `cmake` + `libtool` — para compilar el módulo dinámico de `vterm`.
- Servidores LSP que necesites vía `eglot`: `vue-language-server`,
  `typescript-language-server`/`typescript` global, `pyright`, `dart`,
  `clangd`, etc.
- CLI de [`claude-code-ide`](https://github.com/manzaltu/claude-code-ide.el)
  (`claude`), si no está en tu `PATH` ajusta la ruta en `init-local.el`.

## Personalización por máquina

Copia `init-local.el.example` a `init-local.el` (ignorado por git) para
overrides que no quieres compartir entre equipos: directorio real de
org-roam, ruta a binarios, fuente distinta, etc. Se carga al final de
`init.el`.

`custom-local.el` (también ignorado) es a donde `M-x customize` escribe sus
cambios interactivos, para no ensuciar el `custom.el` versionado.

Si usas `org-agenda` con un diario personal, crea `~/.emacs.d/diary`
(ignorado por git, formato diary de Emacs, no org); si existe, `init.el` lo
asigna a `diary-file` automáticamente. Para agendas reales en `.org`, añade
tus rutas a `org-agenda-files` desde `init-local.el` — nunca metas el
`diary` ahí directamente, org intenta parsearlo como org y falla con
`"Cache must be active"`.

## Estructura

- `init.el` — entrypoint: bootstrap de paquetes, carga de módulos.
- `custom.el` — customizaciones compartidas (temas, `ledger-reports`, etc).
- `modules/*.el` — un archivo por paquete/feature, cada uno con su
  `use-package` y `(provide ...)`.
- `modules/meow/` — configuración del layout modal (meow, dvorak).

## Lo que NO está en el repo (ver `.gitignore`)

Paquetes instalados (`elpa/`, `eln-cache/`), caches de LSP/treemacs
(`.cache/`), gramáticas compiladas de tree-sitter, historial/sesiones
(`recentf`, `bookmarks`, `projects`, `.org-id-locations`, `org-roam.db`,
`eshell/`, `transient/`), y datos personales (`diary`). Todo eso se
regenera solo al usar Emacs normalmente.
