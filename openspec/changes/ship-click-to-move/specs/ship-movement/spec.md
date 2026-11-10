# Spec Delta

## Purpose

Lets the player move the ship across the 2D space by clicking a destination point, with instant rotation and constant-speed translation.

## ADDED Requirements

### Requirement: Ship rotates to face click target
The ship SHALL instantly rotate to face the world point the player clicked.

#### Scenario: Rotation faces the click point
- **WHEN** the player left-clicks a point in the viewport
- **THEN** the ship's rotation snaps to point directly at the clicked world point

### Requirement: Ship moves at constant speed toward target
The ship SHALL translate toward the click target at a constant speed until arrival.

#### Scenario: Constant speed translation
- **WHEN** a click target is set and the ship is not yet at the target
- **THEN** the ship moves in a straight line toward the target at a constant speed

#### Scenario: Arrival at target
- **WHEN** the ship reaches within a small tolerance of the click target
- **THEN** the ship stops moving and holds position

### Requirement: Re-click retargets mid-flight
The ship SHALL update its movement target when the player clicks again while already moving.

#### Scenario: Mid-flight retargeting
- **WHEN** the player left-clicks a new point while the ship is moving toward a previous target
- **THEN** the ship instantly rotates to face the new point and continues moving at constant speed toward it
