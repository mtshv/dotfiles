#!/bin/bash

# Set up keyboard shortcuts for input sources and Spotlight
echo "Setting up keyboard shortcuts..."

# Configure Command+Space for input source switching and disable Spotlight ctrl+space shortcut
cat > /tmp/symbolichotkeys_fixed.plist << EOL
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>AppleSymbolicHotKeys</key>
    <dict>
        <key>60</key>
        <dict>
            <key>enabled</key>
            <integer>1</integer>
            <key>value</key>
            <dict>
                <key>parameters</key>
                <array>
                    <integer>32</integer>
                    <integer>49</integer>
                    <integer>262144</integer>
                </array>
                <key>type</key>
                <string>standard</string>
            </dict>
        </dict>
        <key>61</key>
        <dict>
            <key>enabled</key>
            <integer>1</integer>
            <key>value</key>
            <dict>
                <key>parameters</key>
                <array>
                    <integer>32</integer>
                    <integer>49</integer>
                    <integer>1048576</integer>
                </array>
                <key>type</key>
                <string>standard</string>
            </dict>
        </dict>
        <key>64</key>
        <dict>
            <key>enabled</key>
            <integer>0</integer>
            <key>value</key>
            <dict>
                <key>parameters</key>
                <array>
                    <integer>32</integer>
                    <integer>49</integer>
                    <integer>1048576</integer>
                </array>
                <key>type</key>
                <string>standard</string>
            </dict>
        </dict>
    </dict>
</dict>
</plist>
EOL

defaults import com.apple.symbolichotkeys /tmp/symbolichotkeys_fixed.plist
killall cfprefsd

# Hide the input source menu bar icon
#defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0

echo "Keyboard shortcuts configured successfully."
