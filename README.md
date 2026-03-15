# Dotfiles

## Instructions

### Homebrew

Install Homebrew:
```nushell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install packages from Brewfile:
```nushell
brew bundle install
```

### Mise

Install mise:
```nushell
curl https://mise.run | sh
```

Install global tools from config:
```nushell
mise install
```

### Devbox

Install devbox:
```nushell
curl -fsSL https://get.jetify.com/devbox | bash
```

Install global packages from devbox.json:
```nushell
devbox global update  # alias: dgu
```

### Neovim

Install DAP related things (more info in the dap plugin file).

## Updating Dependencies

### Homebrew
```nushell
brew update
brew upgrade
brew bundle dump  # alias: bbd
```

### Mise
```nushell
mise up
```

### Devbox
```nushell
devbox global update  # alias: dgu
```

## Other things

You will need to create a `.env` file in your `$HOME/.config` folder, with all the secrets following this structure:

```
GITHUB_TOKEN="Your github token"
```
