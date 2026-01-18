# Spooky Dash Game Specification

A 2D pixel-art platform shooter inspired by **Mario** (movement & level design) and **Metal Slug** (combat feel), built with **Godot Engine** and targeting **Android**.

---

## 1. Tech Stack

* **Engine:** Godot 4.x
* **Language:** GDScript
* **Target Platform:** Android (Landscape)
* **Art Style:** Pixel art (flat colors, no gradients)
* **Base Resolution:** 320×180 (scaled x4–x5)

---

## 2. Core Gameplay

### Player

* Move left / right
* Jump
* Shoot slingshot projectiles
* Take damage and die

### Enemies

* **Zombie** — slow, higher HP
* **Skeleton** — fast, lower HP

### Objective

* Reach end of level
* Avoid or defeat enemies

---

## 3. Controls

### Touch (Android)

* Left side: Move Left / Right
* Right side: Jump, Shoot

### Keyboard (Debug)

* Arrow keys / A–D: Move
* Space: Jump
* Ctrl / Mouse: Shoot

---

## 4. Project Structure

```
res://
├── scenes/
│   ├── player.tscn
│   ├── enemies/
│   │   ├── zombie.tscn
│   │   └── skeleton.tscn
│   ├── bullet.tscn
│   └── levels/
│       └── level_01.tscn
├── scripts/
│   ├── player.gd
│   ├── enemy.gd
│   ├── zombie.gd
│   ├── skeleton.gd
│   └── bullet.gd
├── art/
│   ├── sprites/
│   └── tilesets/
├── audio/
│   ├── sfx/
│   └── music/
└── ui/
```

---

## 5. Player Specification

### Node Structure

```
CharacterBody2D
├── AnimatedSprite2D
├── CollisionShape2D
├── Marker2D (shoot_origin)
```

### Properties

| Property   | Value |
| ---------- | ----- |
| Speed      | 120   |
| Jump Force | -300  |
| Gravity    | 800   |
| Max HP     | 3     |
| Fire Rate  | 0.4s  |

---

## 6. Player Animations

* Frame size: **24×32 px**

| Animation | Frames | FPS | Loop |
| --------- | ------ | --- | ---- |
| idle      | 2      | 4   | Yes  |
| run       | 4      | 8   | Yes  |
| jump      | 1      | —   | No   |
| shoot     | 3      | 10  | No   |
| die       | 4      | 6   | No   |

Rules:

* Jump overrides all while airborne
* Shoot temporarily overrides idle/run
* Sprite flips horizontally based on direction

---

## 7. Shooting System

### Projectile

* Scene: `bullet.tscn`
* Speed: 300
* Damage: 1
* Lifetime: 2s

Behavior:

* Horizontal movement
* Direction from player facing
* Destroy on collision

---

## 8. Enemy System

### Base Enemy

* Gravity
* Horizontal movement
* Turn on wall collision
* Damageable

### Zombie

| Speed | HP | Damage |
| ----- | -- | ------ |
| 30    | 2  | 1      |

### Skeleton

| Speed | HP | Damage |
| ----- | -- | ------ |
| 60    | 1  | 1      |

---

## 9. Level Design

* Tile-based ground
* Platforms
* Enemy spawn points
* End-level trigger

---

## 10. Camera

* Side-scrolling
* Follow player on X axis
* Clamp to level bounds

---

## 11. Audio

* Jump
* Shoot
* Enemy hit
* Enemy death
* Player hurt

---

## 12. Performance Targets

* 60 FPS on mid-range Android devices
* Minimal draw calls
* Texture atlases preferred

---

## 13. Milestones

### Milestone 1

* Player movement
* Shooting
* One enemy
* One level

### Milestone 2

* Skeleton enemy
* Multiple levels
* Basic UI

### Milestone 3

* Polish
* Audio
* Camera smoothing

---

## 14. License

* Code: MIT
* Art: Project-specific

