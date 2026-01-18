# Spooky Dash - Setup & Build Guide

## Project Setup Complete ✓

The game has been renamed to **Spooky Dash** and the project structure is initialized.

### What's Been Done:
- ✓ Renamed game from "Slingshot Boy" to "Spooky Dash"
- ✓ Created `project.godot` configuration file
- ✓ Created basic scene structure with `scenes/main.tscn`
- ✓ Game scripts ready in `scripts/` directory

### To Build and Run:

1. **Download Godot 4.2.2:**
   ```bash
   cd /home/rastko
   wget https://downloads.tuxfamily.org/godotengine/4.2.2/Godot_v4.2.2-stable_linux.x86_64.zip
   unzip Godot_v4.2.2-stable_linux.x86_64.zip
   chmod +x Godot_v4.2.2-stable_linux.x86_64
   ```

2. **Open the Project:**
   ```bash
   ./Godot_v4.2.2-stable_linux.x86_64 -e /home/rastko/dev/spooky
   ```

3. **Run the Game:**
   - Press F5 in the Godot editor or click "Play" button

### Project Structure:
```
spooky/
├── project.godot          # Godot project config
├── scenes/
│   └── main.tscn         # Main game scene
├── scripts/
│   ├── player.gd         # Player controller
│   ├── enemy.gd          # Base enemy class
│   ├── bullet.gd         # Projectile script
│   ├── skeleton.gd       # Skeleton enemy (fast, 1 HP)
│   └── zombie.gd         # Zombie enemy (slow, 2 HP)
├── art/                  # Graphics assets
└── TODO.md               # Development tasks
```

### Next Steps:
1. Create player sprite/graphics
2. Create enemy sprites/graphics
3. Add physics colliders to scenes
4. Implement bullet collision with enemies
5. Add enemy spawning system
6. Implement game UI/score system
