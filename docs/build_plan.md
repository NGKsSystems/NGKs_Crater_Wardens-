# NGKs Crater Wardens — Build Plan

## Project Identity
- Name: NGKs Crater Wardens
- Engine: Godot (GDScript)
- Style: 2.5D fixed-lane side scroller arcade action
- Target Platform: Windows desktop (primary)
- Scope: V1 LOCKED

---

## Performance Target
| Metric | Target |
|---|---|
| FPS (normal mode) | 60 FPS stable |
| FPS (low-spec mode) | 30 FPS stable |
| RAM target | < 512 MB |
| Load time | < 5 seconds |
| Retry speed | Instant (< 1 second) |
| Min hardware | Integrated graphics, 8 GB RAM |

---

## Folder Structure

```
NGKs_Crater_Wardens/
├── project.godot
├── docs/
│   ├── V1_scope_lock.md
│   ├── build_plan.md
│   ├── control_scheme.md
│   ├── performance_budget.md
│   └── test_checklist.md
├── scenes/
│   ├── root/
│   ├── player/
│   ├── enemies/
│   ├── hazards/
│   ├── ui/
│   ├── environment/
│   └── stage/
├── scripts/
│   ├── player/
│   ├── enemies/
│   ├── hazards/
│   ├── systems/
│   ├── ui/
│   └── data/
├── assets/
│   ├── sprites/
│   ├── audio/
│   └── fonts/
├── data/
│   ├── tuning/
│   └── stages/
├── builds/
└── tests/
```

---

## Development Order

| Phase | Focus |
|---|---|
| 1 | Foundation (project init, input, scene shell) |
| 2 | Rover movement (auto-forward, jump, terrain) |
| 3 | Shooting (forward fire, upward fire, pooling) |
| 4 | Hazards (crater, mine, rock) |
| 5 | Enemies (drone, hover, turret) |
| 6 | Stage progression (checkpoints, end state) |
| 7 | Score + UI/HUD |
| 8 | Polish (VFX, audio, feel tuning) |
| 9 | Performance (low-spec mode, profiling) |
| 10 | Release (QA, packaging) |

---

## Architecture Rules

- Every spawned object (projectiles, enemies, hazards, particles) uses object pooling
- No per-frame allocations (no `Array.new()` / `Dictionary.new()` in `_process`)
- Systems communicate via signals, not direct references
- Game state managed by a single `GameStateManager` autoload
- All tuning values live in `data/tuning/` as `.tres` resource files
- Low-spec mode controlled by a global `PerformanceManager` autoload
