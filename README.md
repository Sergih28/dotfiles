# Dotfiles

## Instructions

### Homebrew

Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install packages from Brewfile:
```bash
brew bundle install
```

### Oh My Zsh

Install Oh My Zsh:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Mise

Install mise:
```bash
curl https://mise.run | sh
```

Install global tools from config:
```bash
mise install
```

### Devbox

Install devbox:
```bash
curl -fsSL https://get.jetify.com/devbox | bash
```

Install global packages from devbox.json:
```bash
devbox global update  # alias: dgu
```

### Neovim

Install DAP related things (more info in the dap plugin file).

## Updating Dependencies

### Homebrew
```bash
brew update
brew upgrade
brew bundle dump  # alias: bbd
```

### Mise
```bash
mise up
```

### Devbox
```bash
devbox global update  # alias: dgu
```

## Other things

You will need to create a `.env` file in your `$HOME/.config` folder, with all the secrets following this structure:

```
GITHUB_TOKEN="Your github token"
```
