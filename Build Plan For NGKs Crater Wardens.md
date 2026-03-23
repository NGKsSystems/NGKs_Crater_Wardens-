Project Name

Dustrunner V1
Working title for a low-spec, gameplay-first arcade rover shooter.

Project Goal

Build a small, fast, modern arcade game inspired by the feel of Moon Patrol, with:

no story screens
no NPC conversations
no gameplay interruptions
instant restart
stable performance on non-gaming computers
Core Product Rules
gameplay first
low-spec first
no fluff
no feature creep
one clean V1 before expansion
every system must justify its performance cost
Build Foundation
Platform Target

Primary target:

Windows desktop

Optional later:

Linux
Steam Deck
controller-first support improvements
Performance Target

Minimum target:

integrated graphics
8 GB RAM class machines
office desktop/laptop class hardware

Performance goals:

60 FPS target
30 FPS stable fallback in low-spec mode
fast load times
instant retry feel
Engine

Godot

Why this engine
lightweight
good for low-spec builds
fast iteration
good for 2D / 2.5D
easier to keep clean than heavier stacks
Game Structure
side-view fixed-lane action
2.5D presentation
controlled enemy count
narrow gameplay strip
short play sessions
stage-based progression
endless mode included
Technical Architecture
Rendering Style
stylized retro-future arcade art
simple shaders
baked or fake lighting
layered parallax
low-poly or low-cost art assets
minimal transparency spam
no expensive cinematic features
Input

Keyboard:

jump
forward fire
upward fire
pause

Controller:

jump
forward fire
upward fire
pause
Systems to Build
Core loop systems
game state manager
player rover controller
jump system
forward shot system
upward shot system
damage/death/restart system
Content systems
hazard system
enemy system
checkpoint system
stage progression system
endless mode system
Support systems
score system
UI/HUD system
audio system
settings system
performance mode system
object pooling
spawn manager
Polish systems
particles/VFX
parallax background
hit feedback
sound feedback
menu flow
Content Lock
V1 Included
1 rover
1 biome
1 full stage
1 endless mode
3 enemies
3 hazards
score system
checkpoints
menus
settings
low-spec mode
keyboard support
basic controller support
V1 Excluded
story
cutscenes
dialogue
bosses
upgrades
unlock trees
lore screens
multiple biomes
multiple vehicles
procedural world generation
multiplayer
advanced destruction
deep customization
online services
Art Plan
Visual Identity

Theme:

dusty moon frontier
hostile terrain
abandoned outposts
drones and surface threats
clean readable silhouettes
Art Buckets
Player
rover
wheel/suspension motion
muzzle flash
hit effect
dust trail
death effect
Enemies
scout drone
hover attacker
ground turret node
Hazards
crater gap
mine
rock/falling obstacle
Environment
terrain strips
checkpoint markers
distant horizon
mid structures
foreground overlays
star/sky layers
UI
HUD
score
checkpoint label
pause menu
settings menu
game over panel
FX
explosion
hit spark
muzzle flash
dust kick-up
checkpoint burst
Audio Plan
Needed Audio
jump SFX
forward shot SFX
upward shot SFX
hit/destroy SFX
death SFX
checkpoint SFX
menu confirm/back SFX
1 gameplay music loop
1 menu loop
Audio Rules
no voices
no narration
no character chatter
short responsive cues only
Data / Tuning Plan

Use editable tuning files for:

rover movement
jump values
weapon cooldowns
enemy health/speed
hazard spacing
scoring values
endless scaling
settings defaults

This keeps balancing out of hard-coded logic.

Testing Plan
Test Areas
Gameplay
jump feel
shot feel
fairness/readability
restart speed
Systems
stage flow
endless mode
score logic
checkpoint triggers
input reliability
Performance
low-spec mode behavior
projectile spam stability
particle scaling
menu responsiveness
stable FPS on weak hardware
Release
clean startup
build packaging
settings save/load
keyboard and controller function
no major crash path
Build Order
Phase 0 — Foundation
project setup
folders
scope lock
controls
scene shell
config files
Phase 1 — Rover Prototype
camera
auto-scroll
rover movement
short jump
long jump
landing feel
Phase 2 — Shooting Prototype
forward fire
upward fire
projectile pooling
hit tests
fire timing
Phase 3 — Hazards
crater
mine
rock obstacle
collision/death
restart loop
Phase 4 — Enemies
drone
hover attacker
ground turret
spawn rules
kill/hit feedback
Phase 5 — Stage Structure
checkpoint system
stage segments
stage completion
endless mode base
Phase 6 — UI / Score / Menus
HUD
score
menu flow
pause
settings
game over panel
Phase 7 — Visual/Audio Polish
parallax
dust
impact effects
explosions
music and SFX
Phase 8 — Performance Lock
low-spec mode
particle reduction
background reduction
frame cap tests
asset compression
weak-machine testing
Phase 9 — V1 Ship Lock
fix bugs
balance
final checklist
package release build
feature freeze
Recommended Folder Structure
Dustrunner_V1/
├─ project.godot
├─ README.md
├─ docs/
│  ├─ V1_scope_lock.md
│  ├─ build_plan.md
│  ├─ control_scheme.md
│  ├─ art_direction.md
│  ├─ performance_budget.md
│  └─ test_checklist.md
├─ scenes/
│  ├─ bootstrap/
│  ├─ player/
│  ├─ enemies/
│  ├─ hazards/
│  ├─ level/
│  ├─ environment/
│  ├─ fx/
│  └─ ui/
├─ scripts/
│  ├─ core/
│  ├─ player/
│  ├─ enemies/
│  ├─ hazards/
│  ├─ level/
│  ├─ systems/
│  ├─ ui/
│  └─ debug/
├─ assets/
│  ├─ art/
│  ├─ audio/
│  ├─ fonts/
│  └─ shaders/
├─ data/
│  ├─ stage/
│  ├─ tuning/
│  └─ settings/
├─ builds/
│  ├─ dev/
│  └─ release/
└─ tests/
   ├─ manual/
   └─ notes/