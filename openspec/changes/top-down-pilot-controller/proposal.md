# Proposal

## Why

The project needs a controllable pilot character as the first playable element of the top-down spaceship prototype. Before building the editable ship scene, we need a throwaway prototype of the pilot — a simple WASD-controlled person-thing that moves freely in the level — so movement feel and input handling can be validated early.

## What Changes

- Add a pilot scene (`CharacterBody2D` root) with a `Sprite2D` and `CapsuleShape2D` collision.
- Add a top-down WASD character controller in GDScript: read movement input, normalize diagonals, apply `move_and_slide()` for instant-stop free movement.
- Flip the sprite's `mirror_y` when the pilot moves the opposite horizontal direction (isometric-like facing toggle).
- Define input actions for up/down/left/right movement.
- No sprint, no dodge, no camera, no ship, no networking.

## Capabilities

### New Capabilities

- `pilot-controller`: The pilot character's top-down movement and facing behavior — input handling, normalized diagonal movement, collision via capsule, instant stop, and sprite mirror toggle.

### Modified Capabilities

None.

## Impact

- New scene and script under `project/` (Godot project root).
- Input map additions in `project/project.godot` or via the editor's Project Settings.
- No changes to existing specs (none exist yet).
- Deliberately a throwaway prototype: no networking prep, no ship integration, no camera system.
