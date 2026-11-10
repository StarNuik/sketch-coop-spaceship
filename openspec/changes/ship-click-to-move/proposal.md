# Proposal

## Why

The player needs a direct, tactile way to move the ship around the 2D space. Currently there is no movement input at all: the ship exists only as a static object with no locomotion. Click-to-move gives the player immediate control (point and go) and is the foundation for everything else — positioning, docking, combat maneuvering. It's needed now because the ship can't do anything meaningful without it.

## What Changes

- Add a `ShipMovement` node/component responsible for rotating the ship toward a clicked world point and moving it at constant speed.
- On left-click in the game viewport, convert the screen click to a world point, snap the ship's rotation to face it, and begin constant-speed movement toward that point.
- A subsequent click while moving retargets: updates the movement target (and instant-rotation heading) without stopping.
- Stop (or hold) when within a small arrival tolerance of the target.

## Capabilities

### New Capabilities

- `ship-movement`: click-to-move locomotion for the ship — rotation, constant-speed translation, retargeting on re-click, and arrival behavior.

### Modified Capabilities

- None. No existing capabilities exist yet; this change introduces the first one.

## Impact

- New GDScript file(s) under the project (snake_case naming, PascalCase class name) implementing movement logic.
- Likely a new scene or a script attached to the ship node; no existing scenes are modified.
- Input handling for left-click in the viewport (screen-to-world coordinate conversion).
- No changes to `.godot/`, physics engine config, or rendering config. Movement uses constant-speed translation rather than physics forces, so no RigidBody2D tuning is introduced.
