# GCNostalgia: The Ultimate GameCube Plasma Splash Screen

![Here's the Splash in Action](https://github.com/valkyrie-system/GCNostalgia/blob/main/GCNostalgia.gif)

## Relive the Nostalgia on Your Desktop!

Ever wished your Linux desktop could boot up with the iconic charm of a Nintendo GameCube? GCNostalgia is a custom KDE Plasma splash screen designed to bring that classic console's flair directly to your operating system. Featuring an animated GameCube boot logo and an optional authentic sound, this splash screen is perfect for gamers and retro enthusiasts alike.

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
~~```bash~~
    ~~mkdir -p ~/.config/autostart-scripts/~~
    ~~cp /path/to/Nintendo_Gamecube_Boot.wav ~/.config/autostart-scripts/~~
``` **Folder with script is now supplied in this repo with the wav, otherwise provide your own**

    ***Users can also set their login sound for the splash screen at "System Settings > Apps & Windows > Notifications > System Notifications (top right) > Login" though it might not be properly timed**

**2. Create the Login Script:**

* Create a new file named `gamecube_boot_sound.sh` in the same directory:
    `~/.config/autostart-scripts/gamecube_boot_sound.sh`

* Paste the following content into the file:
    ```bash
    #!/bin/bash

    # Wait for the splash screen to finish its animation
    # Adjust '5.1' seconds if your splash screen duration changes
    sleep 5.1

    # Play the GameCube boot sound using paplay (requires PulseAudio/PipeWire)
    paplay "/home/$(whoami)/.config/autostart-scripts/Nintendo_Gamecube_Boot.wav"

    exit 0
    ```
    * **Explanation:**
        * `sleep 5.1`: This command pauses the script for 5.1 seconds. This delay is crucial to ensure the sound plays *after* the visual splash animation is complete. You calculated your GIF duration to be 5.06 seconds, so 5.1 seconds provides a small buffer. If you change your GIF's duration in `splash.qml`, remember to update this `sleep` value.
        * `paplay`: This command plays audio files via PulseAudio or PipeWire (which is compatible with PulseAudio).
        * `"/home/$(whoami)/.config/autostart-scripts/Nintendo_Gamecube_Boot.wav"`: This constructs the path to your sound file dynamically, ensuring it works for any user.

**3. Make the Script Executable:**

* Open your terminal and run:
    ```bash
    chmod +x ~/.config/autostart-scripts/gamecube_boot_sound.sh
    ```

**4. Add the Script to Autostart:**

* Open **KDE System Settings**.
* Navigate to **"Startup and Shutdown"** (or "Workspace" -> "Autostart").
* Click **"Add Program..."**.
* In the file chooser, browse to `~/.config/autostart-scripts/` and select `gamecube_boot_sound.sh`.
* Click **"OK"**.

---

### 📄 Licensing:

This project's QML code is based on work by Marco Martin and is licensed under the GNU General Public License version 2 (or any later version). See the comments at the top of `splash.qml` for full details.

---

### 📸 Screenshots/Demo:

*(Consider adding screenshots or a short video clip here to showcase your splash screen!)*
