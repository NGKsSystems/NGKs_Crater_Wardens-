# NGKs Crater Wardens — Test Checklist

Legend: [ ] = not started | [x] = complete | [!] = failed / blocked

---

## Project Setup
- [x] Project folder exists
- [x] Godot project initialized (project.godot present)
- [x] Top-level folder structure created
- [x] README.md present
- [x] V1_scope_lock.md present
- [x] build_plan.md present
- [x] control_scheme.md present
- [x] performance_budget.md present
- [x] test_checklist.md present

---

## Input / Core Shell
- [x] Input map defined (project.godot InputMap section)
- [x] Keyboard bindings assigned
- [x] Controller bindings assigned
- [x] Main menu scene created
- [x] Game root scene created
- [x] Pause menu scene created
- [x] Settings menu scene created

---

## Rover / Movement
- [x] Rover scene created
- [x] Auto-forward movement working
- [x] Terrain collision working
- [x] Short jump working
- [x] Long jump working
- [x] Landing response working
- [ ] Jump feel tuned          ← requires in-engine play testing
- [ ] Movement feel tuned     ← requires in-engine play testing

---

## Weapons
- [x] Forward projectile scene created
- [x] Upward projectile scene created
- [x] Forward fire input working
- [x] Upward fire input working
- [x] Fire cooldowns working
- [x] Projectile hit detection working
- [x] Projectile cleanup working
- [x] Projectile pooling confirmed (no instantiate() during gameplay)

---

## Hazards
- [x] Crater gap created
- [x] Mine created
- [x] Rock obstacle created
- [x] Hazard collision rules working
- [ ] Hazard spawn logic working       ← requires SpawnManager (Phase 6)
- [x] Hazard cleanup working           ← static placed hazards; pool cleanup in Phase 6
- [ ] Readability and fairness verified ← requires in-engine play testing

---

## Enemies
- [x] Scout drone created
- [x] Hover attacker created
- [x] Ground turret created
- [x] Enemy movement working
- [x] Enemy hit/death logic working
- [ ] Enemy spawn logic working       ← static lane placement; SpawnManager not in V1 scope
- [x] Enemy cleanup working
- [ ] Enemy pressure tuned             ← requires in-engine play testing

---

## Stage / Progression
- [x] Stage scene created
- [ ] Terrain segment system working   ← static single lane; not in V1 scope
- [x] Checkpoint markers present
- [x] Checkpoint manager working
- [x] Stage progression logic working
- [x] Stage completion state working
- [ ] Endless mode scene created       ← not in V1 scope
- [ ] Endless scaling logic working    ← not in V1 scope

---

## Score / Flow
- [x] Score system created
- [x] Enemy score values assigned
- [x] Checkpoint score values assigned
- [ ] Distance score working           ← not in V1 scope
- [x] Stage clear bonus working
- [ ] Death state working              ← instant restart only; no death screen in V1
- [x] Instant restart flow working (< 1 second)
- [ ] Game over panel working          ← not in V1 scope

---

## UI / HUD
- [x] HUD created
- [x] Score display working
- [x] Checkpoint display working
- [ ] Mode label working               ← not in V1 scope
- [x] Pause menu flow working
- [ ] Settings UI working              ← scene exists; controls not wired in V1
- [ ] Game over UI working             ← not in V1 scope
- [ ] Keyboard-only menu navigation verified  ← requires in-engine play testing

---

## Environment / Visuals
- [ ] Parallax root created             ← not in V1 scope
- [ ] Far background layer created     ← not in V1 scope
- [ ] Mid background layer created     ← not in V1 scope
- [ ] Foreground layer created         ← not in V1 scope
- [x] Checkpoint visual present
- [x] Dust trail effect working
- [x] Muzzle flash working
- [x] Hit spark working
- [x] Explosion effect working

---

## Audio
- [x] Jump SFX assigned
- [x] Forward shot SFX assigned
- [x] Upward shot SFX assigned
- [x] Hit/destroy SFX assigned
- [x] Death SFX assigned
- [x] Checkpoint SFX assigned
- [ ] Menu sounds assigned             ← not in V1 scope
- [ ] Gameplay music loop assigned    ← not in V1 scope
- [ ] Menu music loop assigned        ← not in V1 scope
- [ ] Volume controls working          ← not in V1 scope

---

## Settings / Performance
- [ ] Fullscreen/windowed toggle working
- [ ] Resolution selector working
- [ ] Frame cap selector working
- [ ] Particle density toggle working
- [ ] Screen shake toggle working
- [ ] Low-spec mode toggle working
- [ ] Settings save/load working
- [ ] Particles reduced in low-spec mode
- [ ] Background detail reduced in low-spec mode

---

## Data / Tuning
- [ ] Rover tuning file created
- [ ] Enemy tuning file created
- [ ] Hazard tuning file created
- [ ] Scoring tuning file created
- [ ] Endless spawn table created
- [ ] Stage segment data created
- [ ] Tuning load flow validated

---

## Testing
- [ ] Jump timing verified
- [ ] Shot timing verified
- [ ] All hazard collisions verified
- [ ] All enemy behaviors verified
- [ ] Checkpoint triggers verified
- [ ] Score logic verified
- [ ] Death/restart speed verified (< 1 second)
- [ ] Menu flow verified
- [ ] Settings persistence verified
- [ ] Low-spec mode verified
- [ ] Tested on weakest available PC
- [ ] Stutter and cleanup issues fixed

---

## Release
- [ ] Features frozen
- [ ] Critical bugs fixed
- [ ] Enemy/hazard timing balanced
- [ ] All V1 included features verified working
- [ ] Dev build packaged
- [ ] Release build packaged
- [ ] Final QA pass
- [ ] V1 shipped
