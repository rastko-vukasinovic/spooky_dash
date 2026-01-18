# Spooky Dash - AI Agent Documentation

## Overview

This directory contains comprehensive documentation for AI agents working on the Spooky Dash game project. Use these files to quickly understand the project state and development process.

## Quick Start for New Agents

1. **Read First:** [context.md](context.md) - Understand the current project state
2. **Learn Conventions:** [instructions.md](instructions.md) - Code style and development standards
3. **Follow Process:** [workflows.md](workflows.md) - Step-by-step development workflows

## File Guide

### [context.md](context.md)
**Purpose:** Complete project knowledge base  
**Contains:**
- Project overview and concept
- Full directory structure
- Script specifications and stats
- Godot configuration details
- Current development status
- Known issues and blockers
- Next development phases
- File modification history

**When to use:**
- First thing to read when picking up the project
- Before making any changes
- To understand game mechanics
- To verify file locations and paths
- To understand what's been completed

**Update when:**
- Adding new systems
- Changing game mechanics
- Completing major features
- Discovering new issues

### [instructions.md](instructions.md)
**Purpose:** Development standards and guidelines  
**Contains:**
- Code style guidelines (GDScript)
- Naming conventions
- File organization best practices
- Editing workflow steps
- Common task procedures
- Testing checklist
- Debugging tips
- Performance guidelines
- Code review checklist

**When to use:**
- Before writing any code
- When unsure about naming or style
- Setting up new file structures
- Reviewing code before testing
- Adding new features

**Update when:**
- Establishing new coding conventions
- Finding better practices
- Adding new task types
- Discovering common mistakes

### [workflows.md](workflows.md)
**Purpose:** Step-by-step development processes  
**Contains:**
- Daily development cycle
- Feature development procedures
- Enemy type addition workflow
- Collision setup procedures
- Scene building steps
- Bug fix workflow
- Export/build procedures
- Performance optimization process
- Team collaboration handoff
- Emergency recovery procedures
- Integration testing checklist

**When to use:**
- Before starting major work
- When implementing new features
- Fixing bugs or issues
- Setting up physics/collision
- Preparing for release
- Passing work to another agent

**Update when:**
- Discovering more efficient processes
- Adding new feature types
- Improving build pipeline
- Learning lessons from issues

## Project Quick Reference

**Game Name:** Spooky Dash  
**Engine:** Godot 4.2.2  
**Language:** GDScript  
**Project Path:** `/home/rastko/dev/spooky`  
**Main Scene:** `res://scenes/main.tscn`  

**Open in Editor:**
```bash
godot -e ~/dev/spooky
```

**Run Game:**
```bash
godot ~/dev/spooky
```

**Validate:**
```bash
cd ~/dev/spooky && godot --headless --validate-project
```

## Key Scripts & Their Responsibilities

| Script | Role | Speed | Health |
|--------|------|-------|--------|
| player.gd | Player controller | 120 px/s | N/A |
| bullet.gd | Projectile system | 300 px/s | 1 dmg |
| enemy.gd | Base enemy class | 40 px/s | 1 HP |
| skeleton.gd | Fast enemy | 60 px/s | 1 HP |
| zombie.gd | Strong enemy | 30 px/s | 2 HP |

## Core Systems Status

| System | Status | Location |
|--------|--------|----------|
| Input System | ✅ Implemented | project.godot |
| Player Controller | ✅ Scripted | scripts/player.gd |
| Enemy Base Class | ✅ Scripted | scripts/enemy.gd |
| Bullet System | ✅ Scripted | scripts/bullet.gd |
| Physics/Collision | ⏳ Partial (needs shapes) | scenes/main.tscn |
| Enemy AI | ❌ Not Implemented | TBD |
| Level Design | ❌ Not Implemented | TBD |
| UI/HUD | ❌ Not Implemented | TBD |
| Sound/Music | ❌ Not Implemented | TBD |
| Graphics/Sprites | ❌ Not Implemented | art/ |

## Common Tasks Quick Links

- **Adding Enemy Type** → See workflows.md "Adding a New Enemy Type"
- **Setting Up Physics** → See workflows.md "Collision & Physics Setup"
- **Creating Scene** → See workflows.md "Scene Building Workflow"
- **Fixing Bug** → See workflows.md "Bug Fix Workflow"
- **Code Style** → See instructions.md "GDScript Guidelines"
- **File Organization** → See instructions.md "File Organization"

## Development Priority Matrix

### Phase 1 - Core Mechanics (In Progress)
- Collision shapes and physics bodies
- Bullet collision detection
- Damage system
- Enemy movement AI

### Phase 2 - Content
- Sprite graphics
- Level design
- Enemy spawning
- Platform graphics

### Phase 3 - Polish
- Sound effects
- Music
- UI/HUD
- Animations

### Phase 4 - Export
- Android configuration
- Performance optimization
- Build system
- Testing on devices

## Important Notes

### Before You Start
- [ ] Read context.md completely
- [ ] Check project validates: `godot --headless --validate-project`
- [ ] Understand the task from workflows.md
- [ ] Plan changes before implementing

### While Working
- [ ] Follow naming conventions from instructions.md
- [ ] Include context in code edits
- [ ] Validate after each major change
- [ ] Use manage_todo_list to track progress

### When Done
- [ ] Test your changes thoroughly
- [ ] Update context.md if needed
- [ ] Update TODO.md status
- [ ] Document any new systems

## Getting Help

### Project Questions
- Check context.md for project overview
- See instructions.md for conventions
- Review workflows.md for procedures

### Stuck on a Problem
1. Check instructions.md debugging section
2. Look at workflows.md relevant procedure
3. Validate project and check console
4. Review related scripts in detail

### Found an Issue
1. Document in TODO.md
2. Note in context.md known issues
3. Add to appropriate workflow if it's a procedure issue
4. Update instructions if it's a code style issue

## Agent Collaboration Notes

This documentation is designed for seamless handoff between AI agents. Each agent should:

1. **Start Session:** Read context.md entirely
2. **Plan Work:** Review relevant workflows.md section
3. **Code:** Follow instructions.md conventions
4. **Finish:** Update context.md with final state

This ensures the next agent can pick up immediately where the previous one left off.

## Last Updated
- **By:** Initial Setup Agent
- **Date:** January 18, 2026
- **Changes:** Created .aiagent directory structure and documentation

## Version Control

These files should be kept in sync with project changes:
- context.md - Updated after each feature completion
- instructions.md - Updated when new conventions established
- workflows.md - Updated when processes improve
- This file (Agents.md) - Updated when documentation structure changes
