# ProgramOS

ProgramOS is a custom Linux-based OS automation project. It creates a bootable ISO, logs all actions, and installs essential system tools:

- Waydroid
- Visual Studio Code
- GAPPS (required with Waydroid)
- WhatsApp for Linux (optional)

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

## Security
- ClamAV
- fail2ban
- UFW

## OS
- Linux Only (any distribution will run this. The software will not run in WSL or Windows Subsystem for Linux)

## Lisence
 MIT License

 Copyright (c) 2026 @Tech-for-everyone

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including, without limitation, the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

 SOFTWARE.


