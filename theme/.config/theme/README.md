# theme

One place to keep the desktop's look consistent.

## `colors.css`

Semantic colour tokens (`@bg`, `@fg`, `@accent`, …) as GTK `@define-color`
rules. Imported by:

| App     | File                        | Toolkit |
|---------|-----------------------------|---------|
| waybar  | `~/.config/waybar/style.css`  | GTK3  |
| swayosd | `~/.config/swayosd/style.css` | GTK4  |

The concrete colours come from pywal (`~/.cache/wal/colors-waybar.css`),
which `colors.css` imports and then re-maps to semantic names. After the
**wallust migration** (see repo `TODO.md`), `colors.css` becomes a wallust
template — importers don't change.

## Changing the look

- **Colours everywhere** → edit the token mappings in `colors.css`.
- **Shape** (corner radius, padding, font) → GTK CSS can't share non-colour
  values, so each app's `style.css` carries its own geometry block marked
  with a `THEME` comment. Keep the values in sync between waybar and
  swayosd by hand.
