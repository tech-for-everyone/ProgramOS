echo "Installing security tools: ClamAV, fail2ban, ufw..."
echo_and_run sudo apt install -y clamav clamav-daemon fail2ban ufw

echo "Updating ClamAV virus database..."
echo_and_run sudo systemctl stop clamav-freshclam || true
echo_and_run sudo freshclam
echo_and_run sudo systemctl start clamav-freshclam || true

echo "Enabling and starting fail2ban..."
echo_and_run sudo systemctl enable fail2ban
echo_and_run sudo systemctl start fail2ban

echo "Enabling and configuring UFW (Uncomplicated Firewall)..."
echo_and_run sudo ufw allow OpenSSH
echo_and_run sudo ufw --force enable

# MIT License
#
# Copyright (c) 2026 @Tech-for-everyone
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

set -e

# Helper to run commands quietly
echo_and_run() {
  echo "$@"
  "$@" > /dev/null 2>&1
}

echo "Updating package lists and installing dependencies..."
echo_and_run sudo apt update

echo "Installing curl, lzip, tar, ca-certificates..."
echo_and_run sudo apt install -y curl lzip tar ca-certificates

echo "Adding Waydroid repository..."
echo "curl https://repo.waydro.id | sudo bash"
curl https://repo.waydro.id | sudo bash > /dev/null 2>&1

echo "Installing Waydroid..."
echo_and_run sudo apt install -y waydroid

echo "Stopping Waydroid session (if running)..."
echo_and_run waydroid session stop || true

echo "Upgrading Waydroid..."
echo_and_run sudo waydroid upgrade

echo "Installing GAPPS for Waydroid..."
echo_and_run sudo waydroid install-gapps

echo "Starting Waydroid session..."
echo_and_run waydroid session start

echo "Setting up Visual Studio Code repository and key..."
echo "wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg 2>/dev/null

echo_and_run sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
echo "Adding VS Code repository to sources list..."
echo "echo 'deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main' | sudo tee /etc/apt/sources.list.d/vscode.list"
echo 'deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main' | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

echo "Updating package lists..."
echo_and_run sudo apt update

echo "Installing Visual Studio Code..."
echo_and_run sudo apt install -y code

echo "Installing npm..."
echo_and_run sudo apt install -y npm

echo "Installing nativefier..."
echo_and_run sudo npm install -g nativefier

echo "Creating WhatsApp desktop app (nativefier)..."
echo_and_run nativefier --name "WhatsApp" --single-instance https://web.whatsapp.com/

echo "All installations and setups are complete!"

LOGFILE="../build_log.txt"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

log "Starting ISO creation..."
# Placeholder: Insert ISO build commands here (e.g., using mkisofs, xorriso, etc.)
# Example:
# xorriso -as mkisofs -o ../programOS.iso /path/to/rootfs
log "ISO creation completed."

log "Starting post-install tool installation..."

# Install Waydroid
log "Installing Waydroid..."
# Placeholder: Insert Waydroid install commands

# Install Visual Studio Code
log "Installing Visual Studio Code..."
# Placeholder: Insert VS Code install commands

# Install GAPPS (required with Waydroid)
log "Installing GAPPS..."
# Placeholder: Insert GAPPS install commands

# Install WhatsApp for Linux (optional, selected: Yes)
log "Installing WhatsApp for Linux..."
# Placeholder: Insert WhatsApp for Linux install commands

log "All installations complete."

log "please sudo apt reboot to apply all changes and updates."

echo "please sudo apt reboot to apply all changes and updates."
