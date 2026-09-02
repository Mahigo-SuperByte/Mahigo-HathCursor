# 🖐️ HathCursor

> **HathCursor is Mahir's custom real-life hand cursor theme made in Bangladesh!** 🇧🇩

This repository contains raw design assets and compiled system pointers to bring a personalized, real-life hand interaction framework to **Linux (Mint/Ubuntu)**, **Windows 10/11**, and **macOS**.

---

## 🚀 Installation Instructions

### 🐧 Linux (Mint, Ubuntu, Debian, Arch)
1. **Build the assets** (if you are downloading the source code):
   ```bash
   chmod +x build_theme.sh
   ./build_theme.sh
   ```
2. **Install to your local user account**:
   ```bash
   cp -r linux/HathCursor ~/.icons/
   ```
3. Open your **Mint Menu**, search for **Themes**, click on **Mouse Pointer**, and choose **HathCursor**. *(Log out and log back in to apply it everywhere)*.

### 🪟 Windows (10 & 11)
1. Navigate to the `windows/` directory in this repo.
2. Right-click the `install.inf` file and choose **Install**.
3. Open the Windows Start Menu, search for **Change mouse pointer display or speed**.
4. Go to the **Pointers** tab, select **HathCursor** from the Scheme dropdown menu, and click **Apply**.

### 🍏 macOS
1. Install the open-source utility [Mousecape](https://github.com).
2. Download the `macos/HathCursor.cape` file and the raw images from `source_pngs/` into the same directory.
3. Double-click `HathCursor.cape` to import it into Mousecape.
4. Hit `Cmd + R` inside Mousecape to apply Mahir's hand cursor to your Mac!

---

## 📂 Repository Structure
* `source_pngs/` — Raw hand photography assets with transparent backgrounds.
* `linux/` — Compiled X11 binary cursor engine configurations.
* `windows/` — `.cur` files matching Windows Pointer configurations.
* `macos/` — Core Graphics plist configuration maps for Mousecape integration.
* `build_theme.sh` — The automation script that maps frames and links properties.

---

## 🛠️ Credits & Metadata
* **Author:** Mahir 
* **Origin:** Dhaka, Bangladesh 🇧🇩
* **License:** MIT License
