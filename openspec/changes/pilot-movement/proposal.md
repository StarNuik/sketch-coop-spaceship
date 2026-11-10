# Proposal

## Why

The prototype needs a controllable pilot character as its first playable element. Before building the editable ship scene, we need a simple top-down WASD-controlled person-thing that moves freely in the level, so movement feel and input handling can be validated early.

## What Changes

- Add a pilot scene (`CharacterBody2D` root) with a `Sprite2D` and `CapsuleShape2D` collision shape.
- Add a top-down WASD character controller in GDScript: read movement input, normalize diagonals, apply `move_and_slide()` for instant-stop free movement.
- Flip the sprite's `mirror_y` when the pilot moves the opposite horizontal direction (isometric-like facing toggle).
- Define input actions for up/down/left/right movement.
- Explicitly out of scope: sprint, dodge, camera, ship integration, networking — this is a throwaway prototype.

## Capabilities

### New Capabilities

- `pilot-controller`: The pilot character's top-down movement and facing behavior — input handling, normalized diagonal movement, capsule collision, instant stop, and sprite mirror toggle.

### Modified Capabilities

None.

## Impact

- New scene and script under `project/` (Godot project root).
- Input map additions via the editor's Project Settings or `project/project.godot`.
- No existing specs to modify (spec inventory is empty).
- Deliberately a throwaway prototype: no networking prep, no ship integration, no camera system.
