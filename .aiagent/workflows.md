# Spooky Dash - Development Workflows

## Game Development Workflow

### Daily Development Cycle
1. **Review** - Check .aiagent/context.md for current state
2. **Plan** - Use manage_todo_list to organize work
3. **Develop** - Make focused changes using appropriate tools
4. **Test** - Validate project and check for errors
5. **Document** - Update context.md with any new information
6. **Commit** - Review changes before finalizing

## Feature Development Workflow

### Adding a New Game Feature (Example: Enemy Spawner)

**Phase 1: Planning**
```
- Create script: spawner.gd
- Define spawning logic
- Plan scene structure
- Add to TODO.md
```

**Phase 2: Implementation**
```
1. Create spawner.gd in scripts/
2. Implement spawning algorithm
3. Create spawner.tscn scene
4. Add to main.tscn
5. Configure enemy types to spawn
```

**Phase 3: Testing**
```
1. Validate project
2. Run in editor
3. Verify spawning behavior
4. Check performance
5. Test edge cases
```

**Phase 4: Documentation**
```
1. Update context.md with new system
2. Add code comments
3. Update instructions.md if new conventions
4. Mark task as complete in TODO.md
```

### Adding New Enemy Type Workflow

**1. Create Script**
```gdscript
# scripts/goblin.gd
extends "res://scripts/enemy.gd"

func _ready():
    speed = 50  # Custom speed
    hp = 1      # Custom health
```

**2. Create Scene**
- Instance enemy in scenes/enemies/goblin.tscn
- Add CollisionShape2D with appropriate shape
- Assign goblin.gd script

**3. Add to Game**
- Add instance to main.tscn
- Set spawn position
- Test collision and physics

**4. Update Spawning**
- Add to spawner's enemy pool
- Configure spawn rates
- Balance difficulty

## Collision & Physics Setup Workflow

### Setting Up Character Collision (Player)

1. **In main.tscn**
   ```
   Player (CharacterBody2D)
   └── CollisionShape2D
       └── CapsuleShape2D (width: 16, height: 32)
   ```

2. **Configure Collision**
   - Layer: 1 (Player)
   - Mask: 2, 3 (Enemies, Environment)

3. **Test Movement**
   - Run game
   - Move left/right - should slide on environment
   - Jump - should be affected by gravity
   - Interact with enemies - should register collisions

### Setting Up Enemy Collision

1. **In enemy scene**
   ```
   Enemy (CharacterBody2D)
   └── CollisionShape2D
       └── CapsuleShape2D (width: 14, height: 24)
   ```

2. **Configure Collision**
   - Layer: 2 (Enemies)
   - Mask: 1, 3 (Player, Environment)

3. **Test Interaction**
   - Position near player
   - Verify collision detection works
   - Test bullet collision later

### Setting Up Bullet Collision

1. **In bullet scene**
   ```
   Bullet (Area2D)
   └── CollisionShape2D
       └── CircleShape2D (radius: 4)
   ```

2. **Configure Collision**
   - Layer: 3 (Projectiles)
   - Mask: 2 (Enemies only)

3. **Implement Hit Detection**
   ```gdscript
   func _on_area_entered(area):
       if area.is_in_group("enemies"):
           area.take_damage(damage)
           queue_free()
   ```

## Scene Building Workflow

### Creating a Complete Level Scene

**Step 1: Setup Scene Hierarchy**
```
Level (Node2D)
├── Environment
│   ├── Platforms (TileMap or StaticBody2D)
│   └── Background (CanvasLayer)
├── Entities
│   ├── Player (instance from main)
│   ├── Enemies (spawned or placed)
│   └── Pickups (optional)
└── UI
    └── HUD (CanvasLayer)
```

**Step 2: Configure Physics**
- Set up collision layers/masks
- Add StaticBody2D for platforms
- Configure gravity and physics

**Step 3: Add Logic**
- Attach scripts to spawn systems
- Configure enemy patterns
- Implement win/lose conditions

**Step 4: Polish**
- Add animations
- Add particle effects
- Add sounds

## Bug Fix Workflow

### Identifying & Fixing Issues

**1. Reproduce Bug**
- Note exact steps to trigger
- Record error messages
- Check console output

**2. Isolate Problem**
- Check relevant script
- Use print statements for debugging
- Review recent changes

**3. Fix Issue**
- Identify root cause
- Implement minimal fix
- Avoid over-engineering

**4. Test Fix**
- Verify original bug is fixed
- Check for regressions
- Test related functionality

**5. Document**
- Add comment explaining fix
- Update context.md if needed
- Note in TODO.md

## Export & Build Workflow

### Building for Linux

```bash
# From Godot editor
- File → Export Project
- Select "Linux/X11"
- Configure export settings
- Build executable
```

### Building for Android

```bash
# Prerequisites
1. Install Android SDK/NDK
2. Configure in Godot Settings
3. Create keystore for signing

# Export
- File → Export Project
- Select "Android"
- Configure APK settings
- Build APK
```

See CHECKLIST_ANDROID.md for detailed Android setup.

## Performance Optimization Workflow

### Profiling the Game

1. **Enable Profiler**
   - In Editor: Debug → Monitor
   - Watch FPS, memory, draw calls

2. **Identify Bottlenecks**
   - High draw calls = rendering issue
   - High physics time = collision issue
   - High script time = code optimization needed

3. **Optimize Problem Areas**
   - Reduce collision checks if needed
   - Optimize scripts
   - Batch rendering where possible

4. **Re-profile**
   - Verify improvements
   - Ensure no regressions

## Team Collaboration Workflow

### Sharing Project State

1. **Document Current State**
   - Update context.md
   - Create summary in TODO.md
   - Note any blockers

2. **Pass to Another Agent**
   - Agent reads .aiagent/context.md first
   - Uses instructions.md for guidelines
   - Follows workflows.md for processes

3. **Handoff Checklist**
   - [ ] context.md is current
   - [ ] All scripts validate
   - [ ] No obvious errors
   - [ ] instructions.md reflects conventions used
   - [ ] workflows.md covers new processes

## Emergency Recovery Workflow

### If Project Breaks

1. **Validate Project**
   ```bash
   godot --headless --validate-project
   ```

2. **Check Recent Changes**
   - Review what was modified
   - Check context.md for version info

3. **Revert Problematic Changes**
   - Use replace_string_in_file to undo
   - Restore from backup if needed

4. **Test Recovery**
   - Validate again
   - Run in editor
   - Verify functionality

5. **Document Lesson**
   - Update instructions
   - Add to checklist
   - Prevent future issues

## Integration Testing Workflow

### Before Major Release

1. **Full Project Validation**
   ```bash
   godot --headless --validate-project
   ```

2. **Play Through Content**
   - Test all levels
   - Test all enemy types
   - Test all mechanics

3. **Verify All Systems**
   - Input handling
   - Physics & collision
   - Enemy behavior
   - Scoring/UI
   - Audio

4. **Performance Check**
   - Run profiler
   - Check memory usage
   - Verify FPS on target device

5. **Document Results**
   - Note any issues found
   - Plan fixes for next iteration
   - Update context.md with release notes
