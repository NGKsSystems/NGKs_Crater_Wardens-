Full Project Checklist
Project Setup
 Create project folder
 Initialize Godot project
 Create top-level folder structure
 Add README
 Add scope lock document
 Add control scheme document
 Add performance budget document
 Define V1 included features
 Define V1 excluded features
Input / Core Shell
 Create input map
 Add keyboard bindings
 Add controller bindings
 Create main menu scene
 Create game root scene
 Create pause menu scene
 Create settings menu scene
Rover / Movement
 Create rover scene
 Add auto-forward behavior
 Add terrain collision
 Add short jump
 Add long jump
 Add landing response
 Tune jump feel
 Tune movement feel
Weapons
 Create forward projectile scene
 Create upward projectile scene
 Add forward fire input
 Add upward fire input
 Add fire cooldowns
 Add projectile hit detection
 Add projectile cleanup
 Add projectile pooling
Hazards
 Create crater gap
 Create mine
 Create rock obstacle
 Add hazard collision rules
 Add hazard spawn logic
 Add hazard cleanup
 Test readability and fairness
Enemies
 Create drone enemy
 Create hover attacker
 Create ground turret
 Add enemy movement rules
 Add enemy hit/death logic
 Add enemy spawn logic
 Add enemy cleanup
 Tune enemy pressure
Stage / Progression
 Create stage scene
 Create terrain segment system
 Add checkpoint markers
 Add checkpoint manager
 Add stage progression logic
 Add stage completion state
 Create endless mode scene
 Add endless scaling logic
Score / Flow
 Create score system
 Add enemy score values
 Add checkpoint score values
 Add distance score
 Add stage clear bonus
 Add death state
 Add instant restart flow
 Add game over panel
UI
 Create HUD
 Add score display
 Add checkpoint display
 Add mode label
 Add pause menu flow
 Add settings UI
 Add game over UI
 Verify keyboard-only menu navigation
Environment / Visuals
 Create parallax root
 Add far background layer
 Add mid background layer
 Add foreground layer
 Add checkpoint visual
 Add dust trail effect
 Add muzzle flashes
 Add hit spark
 Add explosion effect
Audio
 Add jump SFX
 Add forward shot SFX
 Add upward shot SFX
 Add hit/destroy SFX
 Add death SFX
 Add checkpoint SFX
 Add menu sounds
 Add gameplay music loop
 Add menu music loop
 Add volume controls
Settings / Performance
 Add fullscreen/windowed toggle
 Add resolution selector
 Add frame cap selector
 Add particle density toggle
 Add screen shake toggle
 Add low-spec mode toggle
 Add settings save/load
 Reduce particles in low-spec mode
 Reduce background detail in low-spec mode
Data / Tuning
 Create rover tuning file
 Create enemy tuning file
 Create hazard tuning file
 Create scoring tuning file
 Create endless spawn table
 Create stage segment data
 Validate tuning load flow
Testing
 Test jump timing
 Test shot timing
 Test all hazard collisions
 Test all enemy behaviors
 Test checkpoint triggers
 Test score logic
 Test death/restart speed
 Test menu flow
 Test settings persistence
 Test low-spec mode
 Test on weakest available PC
 Fix stutter and cleanup issues
Release
 Freeze features
 Fix critical bugs
 Balance enemy/hazard timing
 Verify all included features work
 Package dev build
 Package release build
 Final QA pass
 Ship V1