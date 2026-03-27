$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")

# Mise
let line = 'use ($nu.data-dir | path join mise.nu)'
if not (open $nu.config-path | lines | any {|l| $l == $line }) {
    $"\n($line)" | save $nu.config-path --append
}

$env.PATH = ($env.PATH | prepend "/usr/local/bin")
devbox global shellenv --format nushell --preserve-path-stack -r
  | lines 
  | parse "$env.{name} = \"{value}\""
  | where name != null 
  | transpose -r 
  | into record 
  | load-env

zoxide init nushell | save -f ~/.zoxide.nu
# env.nu
#
# Installed by:
# version = "0.110.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
