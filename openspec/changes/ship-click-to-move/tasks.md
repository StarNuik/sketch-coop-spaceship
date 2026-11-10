# Tasks

## 1. Project setup

- [ ] 1.1 Create the ship scene (Node2D with a Sprite2D) and attach a ship_movement.gd script; verify the scene instanciates and runs in the editor without errors.

## 2. Click input and rotation

- [ ] 2.1 Handle left-click in the viewport and convert screen coordinates to world coordinates; verify the converted world point matches where the player clicked.
- [ ] 2.2 Instantly rotate the ship to face the clicked world point; verify the ship's rotation snaps to point directly at the target.

## 3. Constant-speed movement and arrival

- [ ] 3.1 Translate the ship toward the target at constant speed; verify straight-line motion at constant speed from any start position.
- [ ] 3.2 Stop and hold position when within an arrival tolerance of the target; verify the ship stops moving once close enough and does not overshoot or jitter.

## 4. Mid-flight retargeting

- [ ] 4.1 Update the movement target and rotation on re-click while moving; verify the ship instantly faces and travels toward the newly clicked point.

## 5. Play verification

- [ ] 5.1 Run the scene, click several points in sequence, and verify rotation snaps, movement runs at constant speed, arrival holds, and re-clicks retarget mid-flight — all matching the spec scenarios.
