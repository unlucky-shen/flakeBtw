#!/usr/bin/env bash

set -u

APPS=(
	"app.zen_browser.zen"
	"com.discordapp.Discord"
	"org.gimp.GIMP"
)

# Check if flatpak is installed
if ! command -v flatpak &> /dev/null; then
	echo " Flatpak is not installed "
	exit 1
fi

# Add Flathub remote
echo " Checking for Flathub Remote... "
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Loop through listed apps and install
echo " Installing... "
for APP in "${APPS[@]}"; do
	if flatpak list --ids | grep -q "$APP"; then
		echo "[Skipping] $APP is already installed."
	else
		echo "[ Installing ] $APP..."
		if flatpak install flathub "$APP" -y --noninteractive --or-update; then
			echo "[ Success ] Finished installing $APP."
		else
			echo "[ Failed ] Could not install $APP. Moving to next item."
		fi
	fi
done

echo " Done! "
