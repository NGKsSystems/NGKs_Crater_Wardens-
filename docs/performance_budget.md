# NGKs Crater Wardens — Performance Budget

## Target Hardware (Minimum)
- CPU: Dual-core ~2 GHz (office/laptop class)
- GPU: Intel integrated graphics (UHD 620 class or equivalent)
- RAM: 8 GB system (game budget: < 512 MB)
- Storage: SSD or HDD
- OS: Windows 10 (64-bit)

---

## FPS Targets
| Mode | Target FPS | Minimum Acceptable |
|---|---|---|
| Normal | 60 FPS | 55 FPS |
| Low-spec | 30 FPS | 28 FPS |

---

## Draw Call Budget
| Mode | Max Draw Calls per Frame |
|---|---|
| Normal | 150 |
| Low-spec | 80 |

---

## Entity Count Budget
| Entity Type | Max Simultaneous (Normal) | Max Simultaneous (Low-Spec) |
|---|---|---|
| Enemies on screen | 6 | 3 |
| Projectiles | 20 | 10 |
| Hazards | 8 | 4 |
| Particles (emitters) | 6 | 2 |

---

## Memory Budget
| Resource | Budget |
|---|---|
| Total RAM | < 512 MB |
| Texture atlas (total) | < 64 MB |
| Audio (loaded at once) | < 32 MB |
| Scene tree nodes | < 300 active |

---

## Rules for Developers
1. All projectiles, enemies, hazards, and particles MUST use object pools — no `instance()` during gameplay
2. No `Array.new()`, `Dictionary.new()`, or string concatenation inside `_process()` or `_physics_process()`
3. Parallax background layers: max 3 in normal mode, max 2 in low-spec mode
4. Shaders: simple shaders only — no full-screen post-processing in V1
5. Audio: all SFX must be pre-loaded at scene start, not on-demand
6. Low-spec mode must visibly reduce: particles, background layers, simultaneous entities

---

## Low-Spec Mode Changes
| Feature | Normal | Low-Spec |
|---|---|---|
| Particle effects | Full | Disabled or minimal |
| Background layers | 3 | 2 |
| Screen shake | On | Off |
| Enemy count | Up to 6 | Up to 3 |
| Frame cap | Unlocked / 60 | 30 |
| Shadow / glow | On | Off |
