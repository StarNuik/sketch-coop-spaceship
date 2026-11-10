# Spec Delta

## Purpose

Defines the pilot character's top-down movement and facing behavior so a controllable person-thing exists as the prototype's first playable element.

## ADDED Requirements

### Requirement: Pilot moves freely with WASD input
The pilot SHALL move in the four cardinal directions in response to WASD input, with input normalized so diagonal movement is not faster than axis-aligned movement, and SHALL stop immediately when no movement input is held.

#### Scenario: Cardinal movement
- **WHEN** the player holds a single movement key
- **THEN** the pilot moves in that direction at a constant speed

#### Scenario: Diagonal movement is not faster
- **WHEN** the player holds two perpendicular movement keys at once
- **THEN** the pilot moves diagonally at the same effective speed as axis-aligned movement

#### Scenario: Instant stop
- **WHEN** the player releases all movement keys while moving
- **THEN** the pilot stops immediately without sliding or momentum

### Requirement: Pilot flips facing when moving the opposite way
The pilot's sprite SHALL toggle its horizontal mirror when the pilot changes horizontal direction, giving an isometric-like facing without rotation.

#### Scenario: Face left then right
- **WHEN** the pilot moves left and then moves right
- **THEN** the sprite's horizontal mirror toggles between the two directions

#### Scenario: No horizontal movement leaves facing unchanged
- **WHEN** the pilot moves only vertically while already facing a horizontal direction
- **THEN** the sprite's horizontal mirror stays as it was

### Requirement: Pilot cannot pass through solid geometry
The pilot SHALL collide with solid level geometry using a capsule-shaped collision body and slide along walls rather than stopping abruptly or penetrating them.

#### Scenario: Walking into a wall
- **WHEN** the pilot moves toward a solid wall
- **THEN** the pilot stops at the wall's surface and does not penetrate it

#### Scenario: Sliding along a wall
- **WHEN** the pilot moves diagonally into a wall
- **THEN** the pilot slides along the wall's surface in the unobstructed direction
