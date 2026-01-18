# Spooky Dash - Development Instructions

## Code Style & Standards

### GDScript Guidelines
- Use snake_case for variables and functions
- Use PascalCase for class names
- Use UPPER_CASE for constants
- Comment complex logic
- Keep functions focused and modular
- Use type hints when possible

### Naming Conventions
- Node names: PascalCase (e.g., `Player`, `Enemy`, `MainScene`)
- Variables: snake_case (e.g., `player_speed`, `jump_force`)
- Functions: snake_case (e.g., `take_damage()`, `_physics_process()`)
- Constants: UPPER_CASE (e.g., `MAX_SPEED`, `GRAVITY`)

## File Organization

### Scripts Directory Structure
```
scripts/
├── player.gd          # Player controller
├── enemy.gd           # Base enemy class
├── bullet.gd          # Projectile system
├── skeleton.gd        # Skeleton enemy type
└── zombie.gd          # Zombie enemy type
```

New scripts should follow the pattern:
- One class per file
- Descriptive filenames
- Group related functionality together

### Scene Directory Structure
```
scenes/
├── main.tscn          # Main game scene
├── levels/            # (To be created)
│   ├── level_1.tscn
│   └── level_2.tscn
└── ui/                # (To be created)
    ├── hud.tscn
    └── menu.tscn
```

## Editing Workflow

### Before Making Changes
1. Read the current file completely
2. Check BUILD_GUIDE.md and context.md for latest info
3. Review the specific script or scene you're modifying
4. Plan your changes to minimize errors

### Making Changes
1. Use appropriate tools (replace_string_in_file for code edits)
2. Include 3-5 lines of context around changes for clarity
3. For multiple independent changes, use multi_replace_string_in_file
4. Test changes by validating the project

### After Making Changes
1. Validate the project: `godot --headless --validate-project`
2. Test in editor if needed: `godot -e ~/dev/spooky`
3. Update relevant documentation
4. Update context.md if adding new systems

## Common Tasks

### Adding a New Enemy Type
1. Create new script in `scripts/new_enemy.gd`
2. Extend `enemy.gd` base class
3. Override `_ready()` to set custom speed/hp
4. Add to main.tscn scene
5. Configure CollisionShape2D and physics

### Adding Player Functionality
1. Edit `scripts/player.gd`
2. Add new exported variables at top
3. Implement logic in `_physics_process()`
4. Add new input action if needed in project.godot
5. Test movement and physics

### Creating New Scenes
1. Create .tscn file in `scenes/` directory
2. Add root node (Node2D for general scenes)
3. Add child nodes and scripts
4. Set up physics bodies and collision shapes
5. Save and test

## Testing Checklist

Before committing changes:
- [ ] Project validates without errors
- [ ] Input actions work as expected
- [ ] Physics behave correctly
- [ ] No console warnings/errors
- [ ] Scene loads without issues
- [ ] All node references are correct

## Debugging Tips

### Common Issues & Solutions

**Error: "The InputMap action 'X' doesn't exist"**
- Solution: Add the action to project.godot [input] section
- Check spelling matches exactly

**Physics not working**
- Solution: Ensure nodes have CollisionShape2D children
- Check body types are correct (CharacterBody2D, RigidBody2D, etc.)

**Nodes not appearing in scene**
- Solution: Check node visibility and position
- Verify scene is loaded as main_scene in project.godot

**Game crashes on startup**
- Solution: Check main.tscn exists and has correct path
- Validate all script paths are correct (res://scripts/...)
- Run: `godot --headless --validate-project`

## Documentation Updates

When making changes, update relevant docs:
- **Code changes:** Update this instructions file if adding new conventions
- **New systems:** Add to context.md
- **Build process changes:** Update BUILD_GUIDE.md
- **Android changes:** Update CHECKLIST_ANDROID.md
- **Gameplay changes:** Update SPEC.md

## Performance Guidelines

- Avoid heavy calculations in `_process()` or `_physics_process()`
- Use yield for asynchronous operations
- Cache node references instead of finding them repeatedly
- Use proper collision layers and masks for efficient physics

## Code Review Checklist

Before asking for testing:
- [ ] Code follows GDScript style guidelines
- [ ] Variable/function names are descriptive
- [ ] Comments explain complex logic
- [ ] No hardcoded values (use constants/exports)
- [ ] Error handling is implemented
- [ ] Code is DRY (Don't Repeat Yourself)

## Version Control & Git Commands

### Key Files to Preserve
- `project.godot` - never delete, always merge carefully
- `scripts/` - all GDScript files
- `scenes/` - all scene files
- `.aiagent/` - agent documentation

### Files That Can Be Regenerated
- Build outputs
- Cache files
- Temporary exports

### Allowed Git Commands

#### Basic Operations
```bash
# Initialize repository (already done)
git init

# Check status
git status

# View commit history
git log
git log --oneline
git log --graph --all --decorate

# View differences
git diff
git diff <filename>

# View remotes
git remote
git remote -v
git remote show <remote-name>
```

#### Remote Management
```bash
# Add remote repository
git remote add <name> <url>

# Remove remote
git remote remove <name>

# Rename remote
git remote rename <old-name> <new-name>

# Change remote URL
git remote set-url <name> <new-url>
```

#### Staging & Committing
```bash
# Stage specific file
git add <filename>

# Stage all changes
git add .

# Stage changes interactively
git add -p

# Commit with message
git commit -m "descriptive message"

# Amend last commit
git commit --amend

# View what will be committed
git diff --staged
```

#### Branches
```bash
# Create new branch
git branch <branch-name>

# List branches
git branch
git branch -a

# Rename current branch
git branch -M <new-name>

# Switch branch
git checkout <branch-name>

# Create and switch to new branch
git checkout -b <branch-name>

# Delete branch (local)
git branch -d <branch-name>

# Delete branch (force)
git branch -D <branch-name>

# Set upstream branch
git branch --set-upstream-to=<upstream> [<branch>]
git branch -u <upstream> [<branch>]
```

#### Undoing Changes
```bash
# Discard changes in working directory
git checkout -- <filename>

# Unstage file
git reset <filename>

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1
```

#### Information & Configuration
```bash
# Show commit details
git show <commit-hash>

# Show file history
git log -- <filename>

# Show who changed each line
git blame <filename>

# View git configuration
git config --list

# Set configuration
git config --global <key> <value>
git config <key> <value>
```

### Commit Message Guidelines

Use clear, descriptive commit messages following this format:
```
<type>: <brief description>

<optional longer explanation>
```

**Types:**
- `feat:` - New feature or system
- `fix:` - Bug fix
- `refactor:` - Code restructuring without behavior change
- `docs:` - Documentation updates
- `test:` - Adding/updating tests
- `config:` - Project configuration changes

**Examples:**
```
feat: Add enemy spawning system
fix: Correct bullet collision detection with enemies
docs: Update context.md with new collision system
config: Add input actions for game controls
refactor: Simplify player movement logic
```

### Branching Strategy

**Recommended branches:**
- `main` - Stable, tested code (don't commit directly)
- `develop` - Integration branch for features
- `feature/*` - Individual features (e.g., `feature/bullet-system`)
- `bugfix/*` - Bug fixes (e.g., `bugfix/collision-issue`)

**Workflow:**
1. Create feature branch: `git checkout -b feature/my-feature`
2. Make changes and commit regularly
3. Merge back to develop when complete
4. Test thoroughly before merging to main

### Git Workflow Example

```bash
# Create feature branch
git checkout -b feature/enemy-ai

# Make changes
# ... edit files ...

# Stage and commit
git add .
git commit -m "feat: Implement basic enemy pathfinding"

# Make more changes
# ... edit files ...

# Commit again
git add scripts/enemy.gd
git commit -m "feat: Add enemy patrol behavior"

# View your commits
git log --oneline -5

# Switch back to main when done
git checkout main
```

### Important Git Notes

- **Never force push** to main or shared branches
- **Always test** before committing
- **Small commits** are better than large ones
- **Write descriptive messages** for future reference
- **Commit regularly** to avoid losing work
- **Pull before pushing** to avoid conflicts
