# ProgramOS

ProgramOS is a custom Linux-based OS automation project. It creates a bootable ISO, logs all actions, and installs essential system tools:

- Waydroid
- Visual Studio Code
- GAPPS (required with Waydroid)
- WhatsApp for Linux (optional, selected: Yes)

## Features
- Automated ISO creation
- Action logging to a text file
- Post-install automation for system tools

## Usage
1. Run the main script to start ISO creation.
2. The script logs all actions to a text file.
3. After ISO creation, the script installs the required system tools.

## Customization
- Edit the install scripts to add or remove system tools.
- Modify the ISO build process as needed.

## Requirements
- Linux build environment (for ISO creation)
- Internet connection (for downloading tools)
