# MMORPG One Button Rotation

This tool provides a script that allows you to automate a rotation of skills for MMORPGs using a single hotkey. Each time you press the assigned hotkey, the next step in your skill rotation is executed, simplifying gameplay.

Best used by:
- Late-night or drunk-fueled raiders.
- Second monitor MMO enjoyers. 
- Skill issue sufferers.
- People with carpal tunnel syndrome or hand injuries.

## **DISCLAIMER**

Make sure you check the Terms & Conditions of the game you intend to use this with.

While this will not auto-play for you (you still need to press each individual keystroke), some developers might not be tolerant of any sort of macros (if they are able to detect it).

Use at your own risk and please don't send me a decapitated horse head if your account gets blocked.

## Features

- Set up and execute skill rotations in MMORPGs with a single button.
- Save and load custom rotations for different characters or games.
- Easy to customize and works with any MMORPG.

## Prerequisites

Before using the script, you will need to install AutoHotKey from https://www.autohotkey.com. Make sure you download version 2.0.

- [Download AutoHotKey](https://www.autohotkey.com/download/ahk-v2.exe)

## Setup and Installation

1. Clone the repository or download the ZIP file and extract it to a folder on your computer.

    ```bash
    git clone https://github.com/your-username/mmorpg-one-button-rotation.git
    ```

1. Download and install AutoHotKey from the official site [here](https://www.autohotkey.com).

## Running the script

### Method 1: 

1. Navigate to the project folder.
1. Select `Run with Powershell (Admin)` after right-clicking `main.ps1`. 
1. If you don't see `Run with Powershell (Admin)` as an option, or the terminal closes instantly, use Method 2.

### Method2:

1. Navigate to the project folder and copy the folder path. This should be something like `C:\Users\<Username>\Downloads\mmorpg-one-button-rotation`, depending where the folder is saved.
1. Press the Windows key and search for "Windows Powershell". 
1. Right-click and select `Run as Administrator`.
1. Type cd, hit space, and paste the folder path you copied (`cd C:\Users\<Username>\Downloads\mmorpg-one-button-rotation`). Hit enter.
1. Copy and paste the following command:

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
    ```
    This is done to ensure you can run the script. It will only be in effect in this terminal window, which means you will have to re-run this command every time you want to start the script.

    If you'd rather set it once and not worry about it again, use this command instead:

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
    ```
1. Confirm by typing "y".
1. Run the script:

    ```powershell
    & "./main.ps1"
    ```

## How to Use

On your first run, you will have no rotations saved. You will be asked to set a new rotation.

### Creating a New Rotation

1. Enter the rotation hotkey: This is the key you will press to trigger each step of the rotation.
    
    Example: `q`

1. Enter the skill rotation steps: Provide the sequence of skills (or key presses) separated by spaces.

    Example: `1 2 3 4 5`

    This sets up a rotation where pressing `q` will execute the sequence: 1 -> 2 -> 3 -> 4 -> 5.

1. Save or use temporarily: You will be asked to set a name for the current rotation if you want to save it for future use, or press "Enter" to use it during the current session only without saving. 

    If you made a mistake, press "." to do it over.

### Loading a Saved Rotation

Your rotations will be saved under the `rotations` folder.

If you have saved rotations, the script will display them in a numbered list. Enter the corresponding number to load a saved rotation.

### Running the Rotation

- Once a rotation is set or loaded, the script will launch the AutoHotKey script (rotation.ahk) in the background.
- **Make sure the hotkey is not assigned to anything else (whether character skill or UI-related) in-game.**
- Press the defined hotkey to trigger each step in the rotation. It will loop back to the first step after a completed rotation.

Press `Ctrl + ESC` to terminate the AutoHotKey script.


## License

This project is licensed under the MIT License. See the LICENSE file for more details.