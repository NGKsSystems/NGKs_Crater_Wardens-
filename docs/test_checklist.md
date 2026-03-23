# NGKs Crater Wardens — Test Checklist

Legend: [ ] = not started | [x] = complete | [!] = failed / blocked

---

## Project Setup
- [ ] Project folder exists
- [ ] Godot project initialized (project.godot present)
- [ ] Top-level folder structure created
- [ ] README.md present
- [ ] V1_scope_lock.md present
- [ ] build_plan.md present
- [ ] control_scheme.md present
- [ ] performance_budget.md present
- [ ] test_checklist.md present

---

## Input / Core Shell
- [ ] Input map defined (project.godot InputMap section)
- [ ] Keyboard bindings assigned
- [ ] Controller bindings assigned
- [ ] Main menu scene created
- [ ] Game root scene created
- [ ] Pause menu scene created
- [ ] Settings menu scene created

---

## Rover / Movement
- [ ] Rover scene created
- [ ] Auto-forward movement working
- [ ] Terrain collision working
- [ ] Short jump working
- [ ] Long jump working
- [ ] Landing response working
- [ ] Jump feel tuned
- [ ] Movement feel tuned

---

## Weapons
- [ ] Forward projectile scene created
- [ ] Upward projectile scene created
- [ ] Forward fire input working
- [ ] Upward fire input working
- [ ] Fire cooldowns working
- [ ] Projectile hit detection working
- [ ] Projectile cleanup working
- [ ] Projectile pooling confirmed (no instance() during gameplay)

---

## Hazards
- [ ] Crater gap created
- [ ] Mine created
- [ ] Rock obstacle created
- [ ] Hazard collision rules working
- [ ] Hazard spawn logic working
- [ ] Hazard cleanup working
- [ ] Readability and fairness verified

---

## Enemies
- [ ] Scout drone created
- [ ] Hover attacker created
- [ ] Ground turret created
- [ ] Enemy movement working
- [ ] Enemy hit/death logic working
- [ ] Enemy spawn logic working
- [ ] Enemy cleanup working
- [ ] Enemy pressure tuned

---

## Stage / Progression
- [ ] Stage scene created
- [ ] Terrain segment system working
- [ ] Checkpoint markers present
- [ ] Checkpoint manager working
- [ ] Stage progression logic working
- [ ] Stage completion state working
- [ ] Endless mode scene created
- [ ] Endless scaling logic working

---

## Score / Flow
- [ ] Score system created
- [ ] Enemy score values assigned
- [ ] Checkpoint score values assigned
- [ ] Distance score working
- [ ] Stage clear bonus working
- [ ] Death state working
- [ ] Instant restart flow working (< 1 second)
- [ ] Game over panel working

---

## UI / HUD
- [ ] HUD created
- [ ] Score display working
- [ ] Checkpoint display working
- [ ] Mode label working
- [ ] Pause menu flow working
- [ ] Settings UI working
- [ ] Game over UI working
- [ ] Keyboard-only menu navigation verified

---

## Environment / Visuals
- [ ] Parallax root created
- [ ] Far background layer created
- [ ] Mid background layer created
- [ ] Foreground layer created
- [ ] Checkpoint visual present
- [ ] Dust trail effect working
- [ ] Muzzle flash working
- [ ] Hit spark working
- [ ] Explosion effect working

---

## Audio
- [ ] Jump SFX assigned
- [ ] Forward shot SFX assigned
- [ ] Upward shot SFX assigned
- [ ] Hit/destroy SFX assigned
- [ ] Death SFX assigned
- [ ] Checkpoint SFX assigned
- [ ] Menu sounds assigned
- [ ] Gameplay music loop assigned
- [ ] Menu music loop assigned
- [ ] Volume controls working

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
