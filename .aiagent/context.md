# Spooky Dash - Project Context

## Project Overview
**Name:** Spooky Dash  
**Type:** 2D Platformer Game  
**Engine:** Godot 4.2.2  
**Platform:** Linux (with Android support planned)  
**Location:** `/home/rastko/dev/spooky`

## Game Concept
A platformer game where the player must navigate through levels, avoid enemies, and defeat them using a projectile system. The game features:
- A player character that can move left/right and jump
- Multiple enemy types (Skeleton, Zombie) with different stats
- A bullet/projectile system for combat
- Android export target

## Project Structure

```
spooky/
├── .aiagent/                    # AI Agent documentation
│   ├── Agents.md               # Agent index
│   ├── context.md              # Full project context
│   ├── instructions.md         # Development instructions
│   └── workflows.md            # Development workflows
├── project.godot               # Godot project configuration
├── BUILD_GUIDE.md              # Setup and build instructions
├── CHECKLIST_ANDROID.md        # Android setup checklist
├── SPEC.md                     # Game specification
├── TODO.md                     # Development tasks
├── install_godot.sh            # Godot installation script
├── scenes/
│   └── main.tscn              # Main game scene
├── scripts/
│   ├── player.gd              # Player controller (120 speed, 300 jump force, 800 gravity)
│   ├── enemy.gd               # Base enemy class (40 speed, 1 HP)
│   ├── bullet.gd              # Projectile script (300 speed, 1 damage)
│   ├── skeleton.gd            # Skeleton enemy (60 speed, 1 HP) - extends enemy.gd
│   └── zombie.gd              # Zombie enemy (30 speed, 2 HP) - extends enemy.gd
└── art/                        # Graphics assets (empty)
```

## Game Scripts Details

### player.gd
- **Class:** CharacterBody2D
- **Speed:** 120 pixels/sec
- **Jump Force:** -300 (upward velocity)
- **Gravity:** 800 pixels/sec²
- **Controls:** move_left, move_right, jump input actions

### enemy.gd (Base Class)
- **Class:** CharacterBody2D
- **Speed:** 40 pixels/sec (default)
- **Health:** 1 HP (default)
- **Method:** `take_damage(dmg)` - reduces HP and removes enemy if HP <= 0

### bullet.gd
- **Class:** Area2D
- **Speed:** 300 pixels/sec
- **Damage:** 1
- **Movement:** Travels horizontally

### skeleton.gd
- Extends: enemy.gd
- **Speed:** 60 pixels/sec
- **Health:** 1 HP
- **Role:** Faster, weaker enemy

### zombie.gd
- Extends: enemy.gd
- **Speed:** 30 pixels/sec
- **Health:** 2 HP
- **Role:** Slower, stronger enemy

## Godot Configuration

### project.godot Settings
- **Game Name:** Spooky Dash
- **Version:** 0.1.0
- **Main Scene:** res://scenes/main.tscn
- **Engine Features:** 4.2, GL Rendering
- **Physics Ticks:** 60 per second

### Input Actions Defined
- **move_left** - Arrow Left (KEY_LEFT), A key (KEY_A)
- **move_right** - Arrow Right (KEY_RIGHT), D key (KEY_D)
- **jump** - Spacebar (KEY_SPACE), W key (KEY_W)

## Development Environment

### System
- **OS:** Linux
- **Godot Path:** ~/.local/bin/godot
- **Godot Version:** 4.2.2.stable.official.15073afe3
- **Git:** Initialized (main branch)
- **Git Commit:** dc61aa9 (Initial project setup)

### Running the Project
**Open in Editor:**
```bash
godot -e ~/dev/spooky
```

**Run Game (Headless):**
```bash
godot ~/dev/spooky
```

**Validate Project:**
```bash
cd ~/dev/spooky && godot --headless --validate-project
```

## Current Status

### Completed
✓ Project renamed to "Spooky Dash"  
✓ Godot 4.2.2 installed  
✓ project.godot configuration file created  
✓ Input actions configured (move_left, move_right, jump)  
✓ Base scene structure (main.tscn with Player node)  
✓ All GDScript files written (player, enemies, bullets)  
✓ Git repository initialized
✓ Initial commit created (dc61aa9)  

### Not Yet Implemented
- CollisionShape2D for physics bodies
- Enemy sprite graphics
- Player sprite graphics
- Bullet collision detection with enemies
- Enemy AI/movement logic
- Enemy spawning system
- Game UI/HUD (score, health, etc.)
- Sound effects and music
- Level design
- Android-specific configurations

## Known Issues
- Input actions defined but physics colliders not yet added to scenes
- Enemy and bullet scripts have no collision/damage implementation yet
- No visual assets present (art/ folder is empty)

## Dependencies
- Godot 4.2.2 (installed)
- Linux OS (system running on)
- GDScript 2.0 (included with Godot)

## Next Development Phases

### Phase 1: Core Mechanics
- Add CollisionShape2D nodes to player, enemies, bullets
- Implement bullet collision detection
- Implement damage system
- Add basic enemy AI movement

### Phase 2: Content
- Create/import sprite graphics
- Design level layout
- Implement enemy spawning
- Add background/platform graphics

### Phase 3: Polish
- Sound effects
- UI/HUD system
- Game manager/level controller
- Animation system

### Phase 4: Android Export
- Configure Android export settings
- Test on Android device
- Optimize performance
- Build APK

## File Modification History
- Game renamed from "Slingshot Boy" to "Spooky Dash"
- SPEC.md, TODO.md, CHECKLIST_ANDROID.md updated with new title
- project.godot created with full configuration
- install_godot.sh created for automated setup
- BUILD_GUIDE.md created with setup instructions
- Input actions added to project.godot
- .aiagent/ directory created with complete agent documentation
- Git repository initialized with initial commit (dc61aa9)
