# TODO taskwarrior aliases
# TODO timewarrior aliases
# TODO Setup difftastic in lazygit
# TODO Setup ov to be used in several places
# TODO tg?
# Steps to add a new program: devbox global -> .config/intelli-shell/commands.txt + icc -> .config/cheat/cheatsheets
# gh extensions: gh extension install dlvhdr/gh-enhance: https://www.gh-dash.dev/companions/enhance/dash-integration/
# .gitconfig (diff), gh-dash/config (keybindings and pager), 

$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")

# Mise
let line = 'use ($nu.data-dir | path join mise.nu)'
if not (open $nu.config-path | lines | any {|l| $l == $line }) {
    $"\n($line)" | save $nu.config-path --append
}

$env.EDITOR = "nvim"
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false # Remove welcome message

$env.config.keybindings ++= [
    {
        name: take_history_hint
        modifier: control
        keycode: char_j
        mode: [emacs, vi_normal]
        event: {
            until: [
                { send: historyhintwordcomplete }
            ]
        }
    }
];

# Intelli-shell
mkdir ($nu.data-dir | path join "vendor/autoload")
intelli-shell init nushell | save -f ($nu.data-dir | path join "vendor/autoload/intelli-shell.nu")

# Atuin
mkdir ($nu.data-dir | path join "vendor/autoload")
atuin init nu | save -f ($nu.data-dir | path join "vendor/autoload/atuin.nu")

# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

$env.INTELLI_SEARCH_HOTKEY = "control char_k"
$env.INTELLI_VARIABLE_HOTKEY = "control char_u"

alias ds = devbox search
alias dga = devbox global add
alias dgr = devbox global rm
alias dgu = devbox global update
alias dgl = devbox global list
alias dglo = devbox global list --outdated

alias ca = cursor-agent
alias nv = nvim
alias lg = lazygit
alias ld = lazydocker
alias lsql = lazysql
alias t = task
alias tw = timew
alias pi = pnpm install
alias pifl = pnpm install --frozen-lockfile
alias la = lsd -lAh
alias zj = zellij
alias ghei = gh extension install
alias ghel = gh extension list
alias mug = mise use -g
alias mlg = mise ls -g
alias bl = brew list
alias bli = brew list --installed-on-request
alias blic = brew list --casks
alias bbi = brew bundle install
alias bbd = brew bundle dump
alias bbdf = brew bundle dump --force
alias bu = brew update
alias bU = brew upgrade

def ahl [] {
  atuin history list --format "{time} {command}" | ov -n -l
}

alias zlm = zellij --layout layout_main
alias ghd = gh dash
alias ghn = gh notify
alias ghp = gh poi
alias ghpdr = gh poi --dry-run
alias ghmp = gh markdown-preview

alias icd = intelli-shell completion delete
alias iss = intelli-shell search
alias iic = intelli-shell import ~/.config/intelli-shell/commands.txt

def cl [] {
  cheat -l | ov -n -l
}

def clc [] {
  cheat -l -p community | ov -n -l
}

def clp [] {
  cheat -l -p personal | ov -n -l
}

def cep [] {
  cheat -p personal -e
}

def cld [] {
  cheat -l -p personal --tag dev | ov -n -l
}

def cll [] {
  cheat -l -p personal --tag lazy | ov -n -l
}

# -------- Oh-My-Zsh Git Plugin Aliases (NuShell Edition) --------

alias g = git
alias ga = git add
alias gaa = git add --all
alias gapa = git add --patch
alias gau = git add --update
alias gav = git add --verbose
alias gap = git apply
alias gapt = git apply --3way

alias gb = git branch
alias gba = git branch -a
alias gbd = git branch -d
# gbda: delete merged (see function section below)
alias gbD = git branch -D
alias gbl = git blame -b -w
alias gbnm = git branch --no-merged
alias gbr = git branch --remote

alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsr = git bisect reset
alias gbss = git bisect start

alias gc = git commit -v
alias gc! = git commit -v --amend
alias gcn! = git commit -v --no-edit --amend
alias gca = git commit -v -a
alias gca! = git commit -v -a --amend
alias gcan! = git commit -v -a --no-edit --amend
alias gcans! = git commit -v -a -s --no-edit --amend
alias gcam = git commit -a -m
alias gcas = git commit -a -s
alias gcasm = git commit -a -s -m
alias gcsm = git commit -s -m

alias gcf = git config --list
alias gcl = git clone --recurse-submodules

alias gclean = git clean -id

# checkout
alias gcm = git checkout (git_main_branch)
alias gcd = git checkout (git_develop_branch)
alias gcmsg = git commit -m
alias gco = git checkout
alias gcor = git checkout --recurse-submodules

alias gcount = git shortlog -sn
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
alias gcs = git commit -S

alias gd = git diff
alias gdca = git diff --cached
alias gdcw = git diff --cached --word-diff
alias gdct = git describe --tags (git rev-list --tags --max-count=1)
alias gds = git diff --staged
alias gdt = git diff-tree --no-commit-id --name-only -r
alias gdup = git diff @{upstream}
alias gdv = git diff -w $it | view -
alias gdw = git diff --word-diff

alias gf = git fetch
alias gfa = git fetch --all --prune
alias gfg = git ls-files | grep
alias gfo = git fetch origin

# gui shortcuts

# push/pull shorthands
alias ggf = git push --force origin (git_current_branch)
alias ggfl = git push --force-with-lease origin (git_current_branch)
alias ggl = git pull origin (git_current_branch)
alias ggp = git push origin (git_current_branch)
alias ggpull = git pull origin (git_current_branch)
alias ggpur = git pull --rebase origin (git_current_branch)
alias ggpush = git push origin (git_current_branch)
alias ggsup = git branch --set-upstream-to=origin/(git_current_branch)

alias gr = git remote
alias gra = git remote add
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbd = git rebase (git_develop_branch)
alias grbi = git rebase -i
alias grbm = git rebase (git_main_branch)
alias grbom = git rebase origin/(git_main_branch)
alias grbo = git rebase --onto
alias grbs = git rebase --skip
alias grev = git revert

alias grh = git reset
alias grhh = git reset --hard
alias groh = git reset origin/(git_current_branch) --hard

alias grm = git rm
alias grmc = git rm --cached
alias grmv = git remote rename
alias grrm = git remote remove
alias grs = git restore
alias grset = git remote set-url
alias grss = git restore --source
alias grst = git restore --staged
alias gru = git reset --
alias grup = git remote update
alias grv = git remote -v

alias gsb = git status -sb
alias gsd = git svn dcommit
alias gsh = git show
alias gsi = git submodule init
alias gsps = git show --pretty=short --show-signature
alias gss = git status -s
alias gst = git status

# stash
alias gsta = git stash push
alias gstaa = git stash apply
alias gstc = git stash clear
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gsts = git stash show --text
alias gstu = git stash --include-untracked
alias gstall = git stash --all

# switch
alias gsw = git switch
alias gswc = git switch -c
alias gswm = git switch (git_main_branch)
alias gswd = git switch (git_develop_branch)

# tags
alias gts = git tag -s
alias gtv = git tag | sort -V

def git_current_branch [] {
    git rev-parse --abbrev-ref HEAD | str trim
}

def git_main_branch [] {
    let has_main = not (
        git branch --list main
        | is-empty
    )

    if $has_main {
        "main"
    } else {
        "master"
    }
}

def git_develop_branch [] {
    if (git branch --list develop | is-empty) {
        ""
    } else {
        "develop"
    }
}

def gbda [] {
    let main = (git_main_branch)
    let develop = (git_develop_branch)

    git branch --no-color --merged
    | each {|line| $line | str trim }
    | where {|branch|
        $branch != $main and $branch != $develop and $branch != "*"
      }
    | each {|branch|
        git branch -d $branch
      }
}

def gccd [repo: string] {
    git clone --recurse-submodules $repo
    let dirname = (
        $repo
        | path basename
        | str replace '.git' ''
    )
    cd $dirname
}

def ggpnp [] {
    ggl
    ggp
}

def grt [] {
    let root = (git rev-parse --show-toplevel | complete | get stdout | str trim)
    if $root != "" {
        cd $root
    }
}

def gpristine [] {
    git reset --hard
    git clean -dffx
}

source ~/.zoxide.nu

use ($nu.data-dir | path join mise.nu)
