# general
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git shortcuts
alias gc='git commit'
alias grc='git rm --cached'
alias grcr='git rm -r --cached'
alias gphm='git push heroku main'
alias gpa='git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done; git fetch --all; git pull --all'
alias gitdiscard='git clean -fd; git checkout -- .'
gdl() { git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done }

# docker shortcuts
alias dockps='docker ps'
alias dockup='docker compose up'
alias dockupdev='docker compose -f docker-compose.dev.yml up'
alias dockdown='docker compose down'
alias dockstop='docker compose stop'
alias dockbuild='docker compose build'
alias dockcrl='docker system prune --all'
docksh() { docker exec -it $1 /bin/bash; }
dockshx() { docker exec -it $(docker ps | grep $1 | head -c 2) sh }
dockcrlimg() { docker rmi -f $(docker images -a -q) }
dockcrlvol() { docker volume rm $(docker volume ls -q) }
alias dockcrlall='docker compose stop; docker compose down; dockcrl; dockcrlimg; dockcrlvol'

# manipulate zshrc
alias cmds='cat ~/.zshrc | grep "alias "'
alias catrc='cat ~/.zshrc'
alias coderc='code ~/.zshrc'
alias nanorc='nano ~/.zshrc'
alias readrc='source ~/.zshrc'
alias cliprc='cat ~/.zshrc | clip.exe'
alias codeomz='code ~/.oh-my-zsh'
alias nanowslc='nano /mnt/c/Users/Kiko/.wslconfig'

# shortcuts
alias emoji='code ~/Documents/resources/emoji.md'
alias ports='sudo netstat -plten'
alias herokuhck='heroku logs --tail --app healthchecker-api'
killport() { sudo kill -9 `sudo lsof -t -i:$1` }
# assoauth() { curl -X POST -H "Content-Type: application/json" -d '{"username":"201704790","password":"pass"}' http://localhost:8080/authentication/register }

# change directory
alias docs='cd ~/Documents'
alias ds='cd ~/Documents/ds-meic1'
alias mes='cd ~/Documents/feup/robin-mes'
alias lgp='cd ~/Documents/feup/robin-mes'
alias wiki='cd ~/Documents/feup/robin-mes.wiki'
alias robin='cd ~/Documents/feup/robin-website'
alias asso='cd ~/Documents/feup/uni4all'
alias tts='cd ~/Documents/niaefeup/tts-revamp-fe'
alias ttsb='cd ~/Documents/niaefeup/tts-be'
alias me='cd ~/Documents/kikogoncalves.me'
alias fh='cd ~/Documents/finishershub'
alias guerner='cd ~/Documents/guerner'
alias diss='cd ~/Documents/dissertation'
alias thesis='diss'
alias ux='cd ~/Documents/usability-dashboard'

# change directory enhance
alias ttsx='tts; code .; npm start'
alias ttsbx='ttsb; docker compose up --build'
alias mex='me; code .; npm start'
alias fhx='fh; code .; npm start'
alias fhb='fh; cd src/backend'
alias guernerx='guerner; code .; npm start'

# program shortcuts
alias clip='clip.exe'
alias explorer='explorer.exe'
alias start='cmd.exe /c start cmd.exe /c wsl.exe'
alias ghci='/opt/ghc/bin/ghci-9.0.1'
alias python='python3'
alias pip='pip3'
# find src -name "*.jsx" -exec sh -c 'mv "$0" "${0%.jsx}.tsx"' {} \;

# temporary
alias pflsync='pfld; git pull; pfl; cd workshops'
alias pflcp='rm -rf /mnt/d/mieic/PFL/prolog; cp -r ~/Documents/feup/pfl/prolog /mnt/d/mieic/PFL'

# backlog
# gklb() { git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done }
# cd path/to/frontend  # docker build -t simulation-frontend .  # docker run -d -p 3000:3000 simulation-frontend

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kiko/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=()

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colorize
  docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example alias
# alias zshconfig="mate ~/.zshrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

