# Dotfiles

Personal configuration files for my Arch Linux setup, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's Included

- **bash** - Shell configuration
- **ghostty** / **kitty** - Terminal emulators
- **git** - Git configuration
- **hyprland** / **i3** - Window managers
- **nvim** - Neovim setup
- **rofi** / **wofi** - Application launchers
- **tmux** - Terminal multiplexer
- **waybar** - Status bar

## Prerequisites
```bash
sudo pacman -S stow
```

## Usage

Clone this repo to your home directory:
```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Stow a package

To symlink a config (e.g., nvim):
```bash
stow nvim
```

This creates symlinks from `~/.config/nvim` pointing to `~/dotfiles/nvim/.config/nvim`.

### Stow multiple packages
```bash
stow bash git nvim tmux
```

### Remove a package
```bash
stow -D nvim
```

### Restow (useful after updating)
```bash
stow -R nvim
```

### Preview changes (dry run)
```bash
stow -n -v nvim
```

## Directory Structure

Each package mirrors the home directory structure:
```
dotfiles/
├── nvim/
│   └── .config/
│       └── nvim/
│           └── init.lua
├── bash/
│   └── .bashrc
└── git/
    └── .gitconfig
    ```

    ## Notes

    - Run stow commands from the `~/dotfiles` directory
    - If you get conflicts, backup and remove existing files first
    - Use `stow -t ~` if your dotfiles repo isn't directly in `$HOME`
