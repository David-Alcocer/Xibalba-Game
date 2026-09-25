# Proyecto Xibalbá

Juego 2D de acción basado en salas, inspirado en la mitología maya. El protagonista —hombre o mujer con las mismas estadísticas— busca venganza contra los dioses mayas después de hacer un pacto con los señores del Xibalbá.

El ciclo de juego es: **entrar a una sala → limpiar enemigos → derrotar al mini-jefe → avanzar.**

El combate tiene tres acciones: cuerpo a cuerpo, distancia y ataque especial con medidor.

**Motor:** Godot 4.x · **Exportación:** Web (HTML5)

---

## Cómo trabajamos — Trunk-Based Development

`main` siempre debe estar jugable. Nadie sube código roto a `main`.

### Flujo por ticket

1. **Abre tu issue** en GitHub (o tómalo del tablero del Sprint).
2. **Crea una rama desde ese issue.**
   En la página del issue, haz clic en *Create a branch* (panel derecho) — GitHub la nombrará automáticamente. Renómbrala al formato del proyecto:
   ```
   XIB-xx-descripcion-corta
   ```
   Ejemplo: `XIB-07-player-controller`
3. **Trabaja en esa rama.** Commits pequeños y frecuentes.
4. **Mantén tu rama al día** con `main` al menos una vez al día:
   ```bash
   git pull --rebase origin main
   ```
5. **Abre un PR hacia `main`** cuando termines.
   - Referencia el issue en el cuerpo: `Cierra #xx`
   - Usa la plantilla de PR que aparece automáticamente
6. **Espera 1 aprobación** de un CodeOwner (Misa `@David-Alcocer` o Adrian `@adrian-software-dev`).
7. **Merge con Squash** — un commit limpio por ticket en `main`.
8. **Borra la rama** después del merge.

### Reglas

- Las ramas duran **máximo 1 día**. Si tu tarea toma más, súbela incompleta detrás de una bandera.
- Las funciones incompletas van apagadas en `GameManager.gd`:
  ```gdscript
  const ENABLE_BOSS    := false
  const ENABLE_SPECIAL := false
  ```
- Un ticket = una rama = un PR. No mezcles tickets.
- **Congelamiento de funciones:** miércoles 30 de septiembre a las 14:00. Después solo entran PRs de corrección de bugs.

### Comandos de referencia

```bash
# Clonar el repo
git clone https://github.com/David-Alcocer/Xibalba-Game.git

# Crear y cambiar a tu rama
git checkout -b XIB-xx-nombre

# Actualizar con main (hacer esto diario)
git pull --rebase origin main

# Subir tu rama
git push -u origin XIB-xx-nombre

# Abrir PR desde la terminal
gh pr create --title "XIB-xx · Nombre del ticket" --base main

# Mergear (después de la aprobación)
gh pr merge --squash
```

---

## Equipo

| Usuario GitHub | Rol |
|---|---|
| `@David-Alcocer` | Misa — repo, QA, integración, builds (CodeOwner) |
| `@adrian-software-dev` | Adrian — programación principal (CodeOwner) |
| `@hermensdiaz` | Steven — programación y pixel art |
| `@Leonardo-Lomas` | Leo — dirección creativa, pixel art, game feel |
| `@Osiris0g` | Osiris — UI, sprites de enemigos, música, SFX |

---

## Sprint 1 — Vertical Slice (Nivel 1)

**24 de septiembre – 2 de octubre de 2026**

Objetivo: un prototipo jugable de principio a fin. Flujo completo:
**Menú → Selección de avatar → Lore → Nivel 1 (3 salas + mini-jefe) → Victoria o Derrota**

Tablero: [Xibalba-Sprint1](https://github.com/orgs/David-Alcocer/projects/15)
