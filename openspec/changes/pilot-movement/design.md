# Design

## Context

See proposal.md for motivation (proposal.md - Why). No existing specs or pilot code exist in the project; this is greenfield under the Godot 4.x project using GDScript with static typing. Scene files (.tscn) and resources (.tres) are text and edited via the engine when possible. The .godot/ folder is not touched.

## Goals / Non-Goals

**Goals:**
- A pilot scene (`CharacterBody2D` root with `Sprite2D` and `CapsuleShape2D`) that moves with WASD input.
- Normalized diagonal input so diagonal speed equals axis-aligned speed.
- Instant stop when input is released (no momentum).
- Horizontal sprite mirror toggle when movement direction reverses.
- Defined input actions for up/down/left/right.

**Non-Goals:**
- Sprint, dodge, or any movement acceleration curve.
- A camera system or camera follow behavior.
- Ship integration, entering/exiting the ship, or ship editing.
- Networking or multiplayer preparation.
- Saving or persisting pilot state.

## Decisions

**CharacterBody2D + move_and_slide()**
- Rationale: Godot's built-in top-down controller handles wall sliding automatically, matching the "cannot pass through solid geometry / slide along walls" spec requirement.
- Alternatives considered: `RigidBody2D` (rejected — physics simulation adds unwanted complexity for a throwaway prototype), `Area2D` + manual position (rejected — no built-in collision response).

**Instant stop (no momentum)**
- Rationale: User decided instant stop is fine; simplest to tune and satisfies the spec's "stop immediately" requirement.
- Alternatives considered: acceleration/deceleration curve (rejected — out of scope for this prototype).

**mirror_y toggle for facing**
- Rationale: User requested a simple "toggle mirror y on the sprite when going the other way" rather than true rotation or 8-direction sprites.
- Alternatives considered: rotating the sprite toward movement (rejected — not the requested isometric-like approach), 8-direction sprite sheets (rejected — art not available for a throwaway prototype).

**CapsuleShape2D collision**
- Rationale: Capsules slide around corners nicely and rarely get stuck, fitting free movement in a top-down level.
- Alternatives considered: CircleShape2D (never gets stuck but less readable as a person), RectangleShape2D (can catch on corners).

**No camera for now**
- Rationale: User scoped camera out; the pilot can be tested in the editor viewport directly.

## Risks / Trade-offs

[Pilot and ship will later be separate scenes] → The pilot scene must be instantiable independently and the enter/exit interaction will be added in a later change; nothing here assumes ship integration.

[mirror_y only handles horizontal facing] → Vertical movement does not change facing; acceptable per the requested simple toggle, revisit if 8-direction facing is wanted later.

[Instant stop can feel "ice-free" / abrupt] → Acceptable for a throwaway prototype; acceleration can be layered on later without changing the spec.

## Migration Plan

None — this is a new, standalone pilot scene with no existing data or behavior to migrate.
