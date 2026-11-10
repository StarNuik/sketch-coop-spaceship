# Design

## Context

The project is a Godot 4.x game using GDScript with static typing preferred. The ship exists as a node but has no locomotion yet — there is no input handling, no movement logic, and no rotation logic. Movement uses constant-speed translation (lerp-style) rather than physics forces, per the agreed approach. See proposal.md for motivation; see specs/ship-movement/spec.md for the behavioral requirements.

## Goals / Non-Goals

**Goals:**
- Snap the ship's rotation to face a clicked world point instantly.
- Translate the ship toward that point at a constant speed.
- Support mid-flight retargeting on re-click (updates target and rotation).
- Stop and hold position once within an arrival tolerance of the target.

**Non-Goals:**
- Physics forces, torque, or engine placement (force-vector shenanigans deferred).
- Block editing of the ship or ship-as-sub-scene systems.
- Pilot/ship separation beyond movement (pilot is not a separate actor yet).
- Acceleration, deceleration, or easing curves (constant speed only).
- Multi-ship or fleet control.

## Decisions

**Instant rotation (snap) over rotate-then-thrust.**
Chosen for arcade feel and simplicity, per the agreed approach. The ship faces its destination immediately rather than spending a turn phase spinning in place. Alternative (rotation speed / angular acceleration) considered and deferred — it adds tuning complexity without changing the core contract.

**Constant-speed translation (lerp) over RigidBody2D forces.**
Chosen per the agreed approach for predictable, deterministic movement that arrives exactly at the target. A physics-force approach would fight the solver to stop precisely and complicates retargeting. Reconsidered only if the "bulky real thing" feel is later prioritized over precision.

**Single GDScript on the ship node, not an autoload.**
There is one ship; movement state (target, speed, active flag) lives on the ship node itself. An autoload / manager is overkill for a single actor and would complicate later multi-ship work.

## Risks / Trade-offs

[Instant rotation feels snappy/unnatural] → Acceptable for now; a rotation-speed cap can be layered in later without changing the spec.

[Constant speed with no deceleration] → Movement may feel robotic on arrival; easing could be added later, but the arrival tolerance masks the stop.

[Rapid re-clicking may cause the ship to wiggle] → Acceptable; each click cleanly replaces the target. A click cooldown or target-change threshold can be added if it becomes annoying in play.

## Migration Plan

Not applicable — this is new behavior on an empty project with no existing players or saves to migrate. No rollback needed beyond removing the new script/node.

## Open Questions

None that would change the specs, the approach, or the task breakdown. Any tuning values (speed, arrival tolerance) are implementation details to be set in tasks/implementation, not design decisions.
