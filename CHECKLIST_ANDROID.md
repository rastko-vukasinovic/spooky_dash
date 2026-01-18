# Spooky Dash - Android Setup Checklist (Godot 4.x)

This checklist ensures the project builds and runs correctly on Android.

---

## 1. Godot Installation

* [ ] Install **Godot 4.x (Standard build)**
* [ ] Verify Godot launches correctly

---

## 2. Android SDK / JDK Setup

### Required

* [ ] Install **Android Studio**
* [ ] Install Android SDK (via SDK Manager)
* [ ] Install **OpenJDK 17** (recommended)

### Environment Paths

* [ ] `ANDROID_HOME` set
* [ ] `JAVA_HOME` set

---

## 3. Godot Android Configuration

In **Editor → Editor Settings → Export → Android**:

* [ ] Android SDK path set
* [ ] JDK path set
* [ ] Debug keystore generated

---

## 4. Export Preset Setup

* [ ] Add **Android Export Preset**
* [ ] Set package name (e.g. `com.yourname.slingshotboy`)
* [ ] Version code set (start at 1)
* [ ] Version name set (e.g. 0.1.0)

---

## 5. Project Settings (Required)

### Display

* [ ] Orientation: **Landscape**
* [ ] Viewport width: 320
* [ ] Viewport height: 180
* [ ] Stretch Mode: `canvas_items`
* [ ] Stretch Aspect: `keep`

### Rendering

* [ ] 2D Pixel Snap enabled
* [ ] Texture filtering disabled

---

## 6. Input Setup

* [ ] Define actions: `move_left`, `move_right`, `jump`, `shoot`
* [ ] Bind keyboard inputs (debug)
* [ ] Add on-screen touch buttons

---

## 7. Mobile Optimization

* [ ] Use texture atlases
* [ ] Avoid large sprites
* [ ] Limit particle effects
* [ ] Avoid real-time lighting

---

## 8. Testing

* [ ] Enable USB debugging on device
* [ ] Run project on physical Android device
* [ ] Verify touch controls
* [ ] Verify performance (60 FPS target)

---

## 9. Build Artifacts

* [ ] Debug APK builds successfully
* [ ] Release APK/AAB builds successfully

---

## 10. Pre-Release

* [ ] App icon added
* [ ] App name set
* [ ] Splash screen configured
* [ ] Permissions reviewed

---

## 11. Store Readiness (Optional)

* [ ] Signed release build
* [ ] Play Store listing assets
* [ ] Privacy policy (if required)

---

## Done Criteria

✔ App installs
✔ Runs without crashes
✔ Controls responsive
✔ Stable FPS
