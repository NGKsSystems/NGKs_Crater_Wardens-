# NGKs Crater Wardens — Level 2 & 3 Exact Placement Specs

Source of truth for Phase 9 level build. No improvisation. All coords are authoritative.

---

## Global Metrics (locked)

| Property | Value |
|---|---|
| Ground Y | ~520–540 (keep consistent) |
| Rover speed | ~240 px/s |
| Long jump range | ~400–420 px |
| Safe reaction spacing | ≥ 120 px |
| Tight pressure spacing | 80–110 px (max) |

---

## Level 2 — `scenes/level/test_lane_2.tscn`

### Section 1 — Warm-up
- Mine at x=600
- Hover at x=900

### Section 2 — Jump + Threat
- Platform start: x=1200
- Gap: ~220 px
- Platform end: x=1420
- Mine at x=1450
- Hover at x=1650

### Section 3 — Long Jump + Drone
- Gap start: x=1900
- Gap width: ~400 px
- Landing: x=2300
- Drone at x=2350, y=380

### Section 4 — Pressure Corridor
- Mine at x=2600
- Turret at x=2800
- Mine at x=3000
- Spacing: ~200 px between threats

### Section 5 — Mixed
- Platform at x=3300
- Hover at x=3500
- Drone at x=3600, y=380

### Section 6 — Spike
- Gap start: x=3800
- Gap width: ~400 px
- Turret at x=4300
- Checkpoint at x=4500

### Checkpoints — Level 2
- CP1: x=1500
- CP2: x=3000
- CP3: x=4300

---

## Level 3 — `scenes/level/test_lane_3.tscn`

### Section 1 — Fast Open
- Hover at x=600
- Hover at x=900
- Drone at x=1000, y=380

### Section 2 — Jump Chain
- Platform → gap (200 px) → platform → gap (350 px)
- Positions: x=1200 → x=1400 → x=1750 → x=2100

### Section 3 — Air Control
- Long gap: x=2400 → x=2800
- Drone at x=2600, y=360

### Section 4 — Kill Zone
- Turret at x=3000
- Mine at x=3150
- Hover at x=3300
- Spacing: tight (~120 px)

### Section 5 — Vertical Pressure
- Platform at x=3600
- Drone at x=3650, y=360
- Hover crossing at x=3800

### Section 6 — Final Gauntlet
- Gap: x=4000 → x=4400
- Turret at x=4450
- Mine at x=4600
- Drone at x=4550, y=360

### Section 7 — Finish
- Safe stretch
- Finish trigger at x=5000

### Checkpoints — Level 3
- CP1: x=1400
- CP2: x=3200
- CP3: x=4400

---

## Reuse Rules (scope lock)

- Reuse existing enemy scenes: `drone_flyer.tscn`, `hover_attacker.tscn`, `ground_turret.tscn`
- Reuse existing hazard scenes: `mine.tscn`, `crater_gap.tscn`, `rock_obstacle.tscn`
- Reuse existing checkpoint system: `checkpoint_marker.tscn` + `stage_controller.gd`
- Do NOT modify any scripts, gameplay systems, or player stats
