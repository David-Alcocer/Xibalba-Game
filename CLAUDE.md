# CLAUDE.md — Proyecto Xibalbá

Guía de trabajo para este repositorio. Aplica a todos los colaboradores y a cualquier asistente de IA.

## Motor

Godot 4.x (versión exacta en `docs/decisiones.md`). Todos deben usar la misma versión.

## Estructura de carpetas

```
scenes/       # Escenas de Godot (.tscn)
scripts/      # Scripts GDScript (.gd)
assets/
  art/        # Sprites, tilesets, animaciones
  audio/      # Música y SFX
ui/           # Escenas e imágenes de interfaz
docs/         # Decisiones de diseño y referencias
builds/       # Ignorado por git — builds locales
```

## Trunk-Based Development

- `main` siempre debe ser jugable. Nunca se sube código roto.
- No hay ramas de larga duración. Cada rama dura **máximo 1 día**.
- Nombre de rama: `XIB-xx-descripcion-corta` (ej. `XIB-07-player-controller`).
- Antes de abrir un PR: `git pull --rebase origin main`.
- Todo entra por PR con **1 aprobación de un CodeOwner** (Misa `@David-Alcocer` o Adrian `@adrian-software-dev`).
- PRs pequeños: un ticket = un PR. No acumules cambios de varios tickets.

## Banderas de funciones (feature flags)

Las funciones incompletas se integran **apagadas** en `GameManager.gd`:

```gdscript
const ENABLE_BOSS    := false
const ENABLE_SPECIAL := false
```

Así `main` siempre corre. Cuando la función está lista y probada, se abre un PR que solo cambia la bandera a `true`.

## Calendario del Sprint 1 (24 sep – 2 oct 2026)

| Fecha | Evento |
|---|---|
| Lun 28 sep | Revisión de avance — posible recorte de alcance |
| Mié 30 sep 14:00 | **Congelamiento de funciones** — solo PRs de bugs |
| Jue 1 oct | Grabación del video de entrega |
| Vie 2 oct | Entrega final |

## Plan de recorte (en orden)

1. XIB-14: paneles de lore → texto sobre fondo negro
2. Selección de avatar → personaje único
3. Enemigo tirador → solo perseguidor
4. Ataque especial → `ENABLE_SPECIAL = false` para Sprint 2

**No se recorta:** el ciclo sala → limpiar → mini-jefe → victoria.

## Equipo

| Usuario GitHub | Rol |
|---|---|
| `@David-Alcocer` | Misa — repo, QA, integración, builds (CodeOwner) |
| `@adrian-software-dev` | Adrian — programación principal (CodeOwner) |
| `@hermensdiaz` | Steven — programación y pixel art |
| `@Leonardo-Lomas` | Leo — dirección creativa, pixel art, game feel |
| `@Osiris0g` | Osiris — UI, sprites de enemigos, música, SFX |
