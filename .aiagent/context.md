# Spooky Dash - Project Context

## Project Overview
**Name:** Spooky Dash
**Type:** 2D Platformer Game
**Engine:** Godot 4.2.2
**Platform:** Linux (with Android support planned)
**Location:** `/home/rastko/dev/spooky`

## Game Concept
A platformer shooter where the player navigates levels, avoids enemies, and defeats them using projectiles. Features:
- Player character with movement, jumping, and shooting
- Multiple enemy types (Skeleton, Zombie) with different stats
- Bullet/projectile combat system
- HP system with game over/win conditions
- Demo level with platforms and enemies

## Project Structure

```
spooky/
├── .aiagent/                    # AI Agent documentation
│   ├── Agents.md               # Agent index
│   ├── context.md              # Full project context (this file)
│   ├── instructions.md         # Development instructions
│   └── workflows.md            # Development workflows + Autonomous Loop
├── project.godot               # Godot project configuration
├── addons/
│   └── gut/                    # GUT testing framework
├── tests/
│   ├── unit/                   # Unit tests
│   │   ├── test_player.gd
│   │   ├── test_enemy.gd
│   │   └── test_bullet.gd
│   └── integration/            # Integration tests
├── scenes/
│   ├── player.tscn             # Player scene with collision
│   ├── bullet.tscn             # Bullet projectile scene
│   ├── enemies/
│   │   ├── skeleton.tscn       # Skeleton enemy scene
│   │   └── zombie.tscn         # Zombie enemy scene
│   ├── levels/
│   │   └── level_01.tscn       # Demo level (main scene)
│   └── ui/
│       └── hud.tscn            # HUD with HP and messages
├── scripts/
│   ├── player.gd               # Player controller
│   ├── enemy.gd                # Base enemy class
│   ├── bullet.gd               # Projectile script
│   ├── skeleton.gd             # Skeleton enemy (extends enemy.gd)
│   ├── zombie.gd               # Zombie enemy (extends enemy.gd)
│   ├── game_manager.gd         # Game state management (Autoload)
│   ├── level.gd                # Level script for win condition
│   └── hud.gd                  # HUD controller
├── art/
│   ├── sprites/                # Character and object sprites
│   │   ├── player_idle.png     # Player idle (32x32, 4 frames)
│   │   ├── player_run.png      # Player run animation
│   │   ├── player_jump.png     # Player jump
│   │   ├── player_hurt.png     # Player hurt
│   │   ├── player_shoot.png    # Player shooting
│   │   ├── skeleton_idle.png   # Skeleton idle (16x16)
│   │   ├── skeleton_run.png    # Skeleton run animation
│   │   ├── skeleton_hurt.png   # Skeleton hurt
│   │   ├── zombie_idle.png     # Zombie idle (16x16, 2 frames)
│   │   ├── zombie_run.png      # Zombie run animation
│   │   ├── zombie_hurt.png     # Zombie hurt
│   │   ├── bullet.png          # Bullet sprite (4 frames)
│   │   ├── coin.png            # Collectible coin
│   │   ├── dust.png            # Dust particles
│   │   └── poof.png            # Poof effect
│   ├── tiles/                  # Tileset images
│   │   ├── terrain.png         # Main terrain (grass/dirt, 16x16 tiles)
│   │   ├── blocks.png          # Decorative blocks
│   │   └── entities.png        # Entity tiles
│   ├── backgrounds/            # Background layers
│   │   ├── sky.png             # Sky background
│   │   ├── clouds_far.png      # Far clouds (parallax)
│   │   ├── clouds_near.png     # Near clouds (parallax)
│   │   ├── hills.png           # Hills layer
│   │   └── foreground.png      # Foreground elements
│   ├── CREDITS.md              # Art asset credits
│   └── referencesprite.png     # Reference sprite
├── BUILD_GUIDE.md
├── CHECKLIST_ANDROID.md
├── SPEC.md
└── TODO.md
```

## Game Scripts Details

### player.gd
- **Class:** CharacterBody2D
- **Speed:** 120 pixels/sec
- **Jump Force:** -300 (upward velocity)
- **Gravity:** 800 pixels/sec²
- **Max HP:** 3
- **Fire Rate:** 0.4 seconds
- **Controls:** move_left, move_right, jump, shoot
- **Signals:** `hp_changed(new_hp)`, `died`
- **Groups:** "player"

### enemy.gd (Base Class)
- **Class:** CharacterBody2D
- **Speed:** 40 pixels/sec (default)
- **Health:** 1 HP (default)
- **Gravity:** 800 pixels/sec²
- **Damage:** 1 (dealt to player on contact)
- **Behavior:** Patrol left/right, turn at walls
- **Groups:** "enemies"
- **Method:** `take_damage(dmg)` - reduces HP, calls `die()` if HP <= 0

### bullet.gd
- **Class:** Area2D
- **Speed:** 300 pixels/sec
- **Damage:** 1
- **Direction:** Set by player (1 = right, -1 = left)
- **Lifetime:** 2 seconds
- **Behavior:** Moves horizontally, damages enemies on contact, self-destructs

### skeleton.gd
- Extends: enemy.gd
- **Speed:** 60 pixels/sec
- **Health:** 1 HP
- **Role:** Fast, weak enemy

### zombie.gd
- Extends: enemy.gd
- **Speed:** 30 pixels/sec
- **Health:** 2 HP
- **Role:** Slow, durable enemy

### game_manager.gd (Autoload)
- **Signals:** `game_over`, `level_completed`, `hp_updated(hp)`
- **Methods:** `register_player()`, `level_complete()`, `restart_level()`
- **Behavior:** Tracks player HP, handles win/lose, pauses game

### hud.gd
- Displays HP counter
- Shows "GAME OVER" or "LEVEL COMPLETE" messages
- Connects to GameManager signals

## Godot Configuration

### project.godot Settings
- **Game Name:** Spooky Dash
- **Version:** 0.1.0
- **Main Scene:** res://scenes/levels/level_01.tscn
- **Engine Features:** 4.2, GL Rendering
- **Physics Ticks:** 60 per second

### Autoloads
- **GameManager:** res://scripts/game_manager.gd

### Input Actions
| Action | Keys |
|--------|------|
| move_left | Arrow Left, A |
| move_right | Arrow Right, D |
| jump | Space, W |
| shoot | Ctrl, Left Mouse |
| restart | R |

### Collision Layers
| Layer | Name | Usage |
|-------|------|-------|
| 1 | Player | Player body |
| 2 | Enemies | All enemy bodies |
| 3 | Projectiles | Bullets |
| 4 | Environment | Platforms, walls |

## Development Environment

### System
- **OS:** Linux
- **Godot Path:** ~/.local/bin/godot
- **Godot Version:** 4.2.2.stable.official.15073afe3
- **Git:** Initialized (main branch)

### Running the Project
**Open in Editor:**
```bash
godot -e ~/dev/spooky
```

**Run Game:**
```bash
godot ~/dev/spooky
```

**Validate Project:**
```bash
cd ~/dev/spooky && godot --headless --validate-project
```

**Run Tests (GUT):**
```bash
cd ~/dev/spooky && godot --headless -s addons/gut/gut_cmdln.gd
```

## Current Status

### Completed (First Playable Demo)
✓ Project structure and configuration
✓ Player with movement, jumping, shooting, HP
✓ Bullet system with enemy collision
✓ Enemy base class with patrol AI
✓ Skeleton and Zombie enemy types
✓ Demo level (level_01) with platforms and enemies
✓ GameManager autoload for state management
✓ HUD with HP display and messages
✓ Win condition (reach green zone)
✓ Lose condition (HP depleted)
✓ Restart functionality (R key)
✓ Collision layers configured
✓ GUT testing framework installed
✓ Unit tests for player, enemy, bullet
✓ Autonomous development loop documented in workflows.md

### Graphics (World of Alpheratz Assets)
- Player: LilWiz sprites (32x32, idle/run/jump/hurt/shoot)
- Skeleton: Devo sprites (16x16, idle/run/hurt)
- Zombie: Bub sprites (16x16, idle/run/hurt)
- Bullet: Magical orb sprite (4 frames)
- Terrain: Grass/dirt tileset (16x16 tiles)
- Background: Sky with optional parallax layers
- Level end: Green transparent zone (placeholder)

### Not Yet Implemented
- Sprite animations (assets ready, need AnimatedSprite2D)
- Sound effects and music
- Additional levels
- Enemy spawner system
- Score system
- Parallax background layers
- Android-specific configurations

## Known Issues
- GUT editor plugin disabled (can still run tests via command line)

## How to Play
1. Run `godot ~/dev/spooky` or open in editor
2. **A/D or Arrows:** Move left/right
3. **Space or W:** Jump
4. **Left Mouse or Ctrl:** Shoot
5. **R:** Restart level
6. **Goal:** Reach the green zone on the right
7. **Avoid:** Getting hit by enemies (3 HP)

## Dependencies
- Godot 4.2.2 (installed)
- Linux OS
- GDScript 2.0 (included with Godot)
- GUT 9.2.1 (installed in addons/)

## File Modification History
- Initial project setup with scripts
- Added collision layers and input actions
- Created player, bullet, enemy scenes
- Created level_01 with platforms and enemies
- Added GameManager autoload and HUD
- Installed GUT testing framework
- Added unit tests
- Added autonomous development loop to workflows.md
- Imported World of Alpheratz art assets (sprites, tiles, backgrounds)
- Updated player, skeleton, zombie, bullet scenes to use sprite textures
- Updated level_01 to use terrain tileset and sky background

## Art Credits
All sprite and tile assets from **World of Alpheratz** project:
- Source: https://github.com/Ark2000/world_of_alpheratz
- See art/CREDITS.md for full attribution
