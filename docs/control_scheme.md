# NGKs Crater Wardens — Control Scheme

## Input Philosophy
- Minimal input surface — only what gameplay requires
- Keyboard-first, controller-supported
- All menus must be keyboard-navigable without a mouse

---

## Godot Input Map Actions

| Action Name | Keyboard | Controller |
|---|---|---|
| `jump` | Space | A / Cross |
| `fire_forward` | Z / Left Ctrl | X / Square |
| `fire_up` | X / Left Shift | Y / Triangle |
| `pause` | Escape | Start |
| `ui_accept` | Enter / Space | A / Cross |
| `ui_cancel` | Escape | B / Circle |
| `ui_up` | Up Arrow / W | D-Pad Up |
| `ui_down` | Down Arrow / S | D-Pad Down |
| `ui_left` | Left Arrow / A | D-Pad Left |
| `ui_right` | Right Arrow / D | D-Pad Right |

---

## Movement Notes
- Rover moves forward automatically — no `move_left` / `move_right` inputs
- `jump` pressed once = short jump arc
- `jump` held slightly longer = long jump arc (OR a second dedicated key TBD during tuning)
- Both jump variants share the same `jump` action; duration determines arc type

## Restrictions (V1 Scope Lock)
- No mouse-dependent gameplay
- No analog stick aiming (fire direction is fixed: forward or up)
- No rumble / haptics in V1
