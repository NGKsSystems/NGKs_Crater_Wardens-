# NGKs Crater Wardens — V1 Scope Lock

## Status: LOCKED
No features may be added to V1 without unlocking this document and logging the reason.

---

## V1 INCLUDED

### Player
- 1 rover (player character)
- Auto-forward movement
- Short jump
- Long jump
- Forward fire
- Upward fire

### World
- 1 biome (crater / moon frontier)
- 1 full stage (start → end with checkpoints)
- 1 endless mode

### Enemies (3 types)
- Scout drone
- Hover attacker
- Ground turret

### Hazards (3 types)
- Crater gap
- Mine
- Rock / falling obstacle

### Systems
- Score system
- Checkpoint system
- Stage progression
- Endless mode scaling
- Death / instant restart
- Object pooling
- Spawn manager
- HUD
- Pause menu
- Settings menu
- Main menu
- Game over panel
- Low-spec mode toggle
- Basic controller support (jump, fire, pause)

---

## V1 EXCLUDED — HARD LOCK

| Feature | Reason Excluded |
|---|---|
| Story / lore screens | Gameplay-only scope |
| Dialogue | No NPC systems in V1 |
| Cutscenes | Instant action principle |
| Boss enemies | Out of V1 scope |
| Upgrade trees | Expansion content |
| Unlock systems | Expansion content |
| Multiple biomes | Expansion content |
| Multiple rovers | Expansion content |
| Multiplayer | Out of V1 scope |
| Online services | Out of V1 scope |
| Advanced destruction | Performance risk |
| Deep customization | Out of V1 scope |
| Procedural world generation | Out of V1 scope |

---

## Non-Negotiable Rules

1. Gameplay only — no story, no dialogue, no NPCs, no cutscenes
2. Instant play → instant restart loop
3. Must run on non-gaming computers (integrated graphics, 8 GB RAM class)
4. 60 FPS target / 30 FPS stable fallback in low-spec mode
5. Object pooling required for projectiles, enemies, hazards, particles
6. No per-frame allocations
7. All systems modular and independently testable
