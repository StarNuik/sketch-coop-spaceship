# Tasks

## 1. Input and scene setup

- [ ] 1.1 Define input actions for up/down/left/right in the Godot input map and verify they register in the editor's Project Settings input map
- [ ] 1.2 Create the pilot scene (CharacterBody2D root with Sprite2D and CapsuleShape2D) as a standalone .tscn and verify it opens without errors

## 2. Movement implementation

- [ ] 2.1 Write the pilot controller script reading WASD input and normalizing diagonals; verify diagonal movement is not faster than axis-aligned movement
- [ ] 2.2 Apply move_and_slide() for instant-stop movement; verify the pilot stops immediately when input is released and slides along walls instead of penetrating them

## 3. Facing

- [ ] 3.1 Toggle Sprite2D mirror_y when horizontal movement direction reverses; verify mirror flips left<->right and stays unchanged during vertical-only movement

## 4. Playtest verification

- [ ] 4.1 Place the pilot in a level with solid walls and verify it cannot pass through geometry and slides along wall surfaces
