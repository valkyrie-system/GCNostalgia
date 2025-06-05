# GCNostalgia: The Ultimate GameCube Plasma Splash Screen

![Here's the Splash in Action](https://github.com/valkyrie-system/GCNostalgia/blob/main/GCNostalgia.gif)

## Relive the Nostalgia on Your Desktop!

Ever wished your Linux desktop could boot up with the iconic charm of a Nintendo GameCube? GCNostalgia is a custom KDE Plasma splash screen designed to bring that classic console's flair directly to your operating system. Featuring an animated GameCube boot logo and an optional authentic sound, this splash screen is perfect for gamers and retro enthusiasts alike.

## Now on Pling! https://www.pling.com/p/2293985/

---

### ✨ Features:

* **Authentic GameCube Boot Animation:** A nostalgic GIF plays during startup.
* **Customizable Colors:** Easily tweak the splash screen's background and text colors.
* **Optional Boot Sound:** Add the classic GameCube startup chime for a complete experience.

---

### 🚀 Installation:

**1. Download and Place the Theme:**

* Clone this repository or download the `GCNostalgia` folder.
* Copy the entire `GCNostalgia` folder to your KDE Plasma local look-and-feel directory:
    ```bash
    cp -r GCNostalgia ~/.local/share/plasma/look-and-feel/
    ```

**2. Apply the Splash Screen:**

* Open **KDE System Settings**.
* Navigate to **"Appearance"** (or "Workspace Behavior" -> "Splash Screen" in older versions).
* Select **"Splash Screen"**.
* Choose **"GCNostalgia"** from the list.
* Click **"Apply"**.

---

### 🎨 Customization:

You can personalize the splash screen's appearance by editing the QML file:

* **Location:** `~/.local/share/plasma/look-and-feel/GCNostalgia/contents/splash/splash.qml`

* **Colors:**
    * Open `splash.qml` in a text editor.
    * Look for properties like `color: "#000000"` (root background) or `color: "#eff0f1"` (text color).
    * Change the hexadecimal color codes to your desired values.

* **Images/GIFs:**
    * The main GameCube animation is specified by `source: "images/plasma_d.gif"`. You can replace this GIF with your own by updating the `source` path and placing your GIF in the `GCNostalgia/contents/splash/images/` directory.
    * Similarly, the busy indicator (`images/busywidget.gif`) and KDE logo (`images/kde.svgz`) can be customized.

---

### 🔊 Optional Boot Sound:

To play the iconic GameCube boot sound, you'll need to create a simple autostart script. This script uses `paplay` (part of PulseAudio/PipeWire) to play a WAV file.

~~1. Prepare Your Sound File:~~

~~* Obtain the `Nintendo_Gamecube_Boot.wav` sound file.~~
~~* Place it in a secure location, for example: `~/.config/autostart-scripts/` (create this directory if it doesn't exist).~~
    
~~**Folder with script is now supplied in this repo with the wav, otherwise provide your own**~~ ```

**Users can also set their login sound with the provided .WAV file for the splash screen at "System Settings > Apps & Windows > Notifications > System Notifications (top right) > Login" though it might not be properly timed**

---

### 📄 Licensing:

This project's QML code is based on work by Marco Martin, adapted by Valkyries taking Flight and is licensed under the GNU General Public License version 2 (or any later version). See the comments at the top of `splash.qml` for full details.

---
