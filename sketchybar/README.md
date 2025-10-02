# SketchyBar Configuration

A simple, clean SketchyBar setup with AeroSpace workspace integration.

## Features

**Left Side:**
- **Workspace Indicators (1-10)**: Clickable buttons showing all AeroSpace workspaces with visual highlight for the active one
- **Front App**: Name of currently focused application

**Right Side:**
- **WiFi**: Network connection status and SSID
- **Volume**: System volume with mute indicator
- **Battery**: Battery percentage with charging status
- **Clock**: Current time and date

## Installation

### 1. Install SketchyBar
```bash
brew tap FelixKratz/formulae
brew install sketchybar
```

### 2. Install Nerd Font (for icons)
```bash
brew install --cask font-hack-nerd-font
```

### 3. Symlink Configuration
```bash
ln -sf ~/dev/dotfiles/sketchybar ~/.config/sketchybar
```

### 4. Start SketchyBar
```bash
# Start manually for testing
sketchybar

# Or start automatically at login
brew services start sketchybar
```

### 5. Hide macOS Menu Bar (macOS Sequoia 15+)

On macOS Sequoia, the native menu bar can't be easily hidden. Instead, SketchyBar is configured to draw **on top** of it using `topmost=on` (already set in the config).

**Note:** macOS 15.1+ shows a purple screen recording indicator dot when SketchyBar is running. This is a macOS privacy feature and cannot be disabled.

### 6. Enable AeroSpace Integration

The AeroSpace config already includes SketchyBar integration. Just reload AeroSpace:
```bash
aerospace reload-config
```

This enables:
- Automatic SketchyBar startup with AeroSpace
- Workspace indicator updates when switching workspaces

## Configuration

### Main Config (`sketchybarrc`)

All bar settings are configured at the top with extensive comments explaining each option:

- **Bar appearance**: Height, colors, blur, padding, corner radius
- **Default styles**: Font, colors, padding for all items
- **Items**: Workspace indicators, front app, clock, battery, volume, wifi

### Plugins (`plugins/`)

Each item has its own plugin script with detailed comments:

- `aerospace.sh`: Highlights the active workspace
- `front_app.sh`: Shows current app name
- `clock.sh`: Time/date display (format customizable via strftime)
- `battery.sh`: Battery % with charging indicator and color-coded icons
- `volume.sh`: Volume % with mute detection
- `wifi.sh`: WiFi SSID or "Disconnected" status

All plugins are heavily commented to explain what they do and how to modify them.

## Customization

### Colors

Colors use ARGB hex format: `0xAARRGGBB`
- `AA` = Alpha (transparency): `00` = fully transparent, `ff` = fully opaque
- `RR` = Red: `00` to `ff`
- `GG` = Green: `00` to `ff`
- `BB` = Blue: `00` to `ff`

Examples:
- `0xffffffff` = Solid white
- `0x44000000` = Semi-transparent black
- `0xffFFBE69` = Solid orange (Rose Pine accent)

### Icons

Icons use [Nerd Fonts](https://www.nerdfonts.com/cheat-sheet). To change icons:
1. Browse the Nerd Fonts cheat sheet
2. Copy the icon character
3. Paste into the appropriate plugin script

Or use SF Symbols:
```bash
brew install --cask sf-symbols
```

### Time Format

Edit `plugins/clock.sh` and modify the date format string. Common codes:
- `%H` = 24-hour (00-23)
- `%I` = 12-hour (01-12)
- `%M` = Minutes (00-59)
- `%p` = AM/PM
- `%a` = Weekday (Mon, Tue)
- `%b` = Month (Jan, Feb)
- `%d` = Day (01-31)

## Troubleshooting

### Bar not showing
```bash
# Check if running
pgrep sketchybar

# View logs
tail -f /tmp/sketchybar.log

# Restart
brew services restart sketchybar
```

### Icons not showing
Make sure Hack Nerd Font is installed:
```bash
brew list --cask | grep font-hack-nerd-font
```

### Workspace indicators not updating
Verify AeroSpace integration in `aerospace.toml` is uncommented and reload:
```bash
aerospace reload-config
```

### Permissions
Some features may require permissions:
- **Screen Recording**: For displaying menu bar items
- **Accessibility**: For detecting focused app

Grant in System Settings > Privacy & Security

## Resources

- [SketchyBar Documentation](https://felixkratz.github.io/SketchyBar/)
- [AeroSpace Documentation](https://nikitabobko.github.io/AeroSpace/)
- [Nerd Fonts Cheat Sheet](https://www.nerdfonts.com/cheat-sheet)
