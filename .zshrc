# Set personal aliases, overriding those provided by oh-my-zsh libs, plugins, and themes. 
# Aliases can be placed here, though oh-my-zsh users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# change dirs
alias docs='cd ~/Documents'
alias dev='cd ~/Documents/dev'
alias rls='cd ~/Documents/dev/rails'

# jumpseller hot branches
alias jshb1="git switch themes/1240-product-block-options-standardization"
alias jshb2="git switch feature/1194/rename-visual-editor-theme-state"

# jumpseller
function js0 () { 
  rls 
  clear 
  bundle install --gemfile /Users/franciscogoncalves/Documents/dev/rails/Gemfile 
  bin/rails db:migrate 
}

function js1 () { 
  rls 
  clear 
  yarn install 
  bundle install 
  rvmsudo rails s 
}

function js2 () { 
  rls 
  cd engines/admin 
  clear 
  yarn install 
  bundle install 
  ./bin/webpacker-dev-server 
}

function js3 () { 
  rls 
  cd engines/checkout 
  clear 
  yarn install 
  bundle install 
  ./bin/webpacker-dev-server 
}

function js4 () { 
  rls 
  clear 
  rvmsudo sidekiq -C config/sidekiq.yml 
}

function js5 () { 
  rls 
  clear 
  node_modules/webpack/bin/webpack.js --progress --watch --mode development 
}

function jsh1 () { 
  rls 
  clear 
  rvmsudo rails checkout:webpacker:clobber
}

function jsMigration () { 
  rls 
  clear
  bin/rails db:migrate # RAILS_ENV=development
}

function jsMigrationRollback () { 
  rls 
  clear
  bin/rails db:rollback
}

function jsSchemaDump () { 
  rls 
  clear
  bin/rails db:schema:dump
}

function jsSchemaLoad () { 
  rls 
  clear
  bin/rails db:schema:load
}

function jsMigrationFile () { 
  rls 
  clear
  rails generate migration $1 # rails generate migration dev_test_extend_data
}

# git
function gacp() { 
  git add -A && git commit -m "$1" && git push 
}

function gac() { 
  git add -A && git commit -m "$1" 
}

function gc () { 
  git commit -m "$1" 
}

function gcnv () { 
  git commit --no-verify -m "$1" 
}

function grc () { 
  git rm --cached "$1" 
}

function grcr () { 
  git rm -r --cached "$1" 
}

function gitPullAll() { 
  git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done; git fetch --all; git pull --all 
}

function gitDiscard() { 
  git clean -fd; git checkout -- . 
}

function gitDeleteLocal() { 
  git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done 
}

function gitUpdateWithMaster() {
  local currentBranch=$(git branch --show-current)
  git switch master
  git pull
  git switch "$currentBranch"
  git merge master
}

function gitUpdateWith() {
  local currentBranch=$(git branch --show-current)
  local targetBranch=$1
  git switch $targetBranch
  git pull
  git switch $currentBranch
  git merge $targetBranch
}

function revertFile() {
  local branch=$1
  local filepath=$2
  git checkout $branch -- $filepath
}

function revertFilePb() {
  local branch="themes/1240-product-block-options-standardization"
  local filepath=$1
  git checkout $branch -- $filepath
}

# docker
function dockps() {
  docker ps
}

function dockup() {
  docker compose up
}

function dockupdev() {
  docker compose -f docker-compose.dev.yml up
}

function dockdown() {
  docker compose down
}

function dockstop() {
  docker compose stop
}

function dockbuild() {
  docker compose build
}

function dockcrl() {
  docker system prune --all
}

function dockcrlall() {
  docker compose stop
  docker compose down
  dockcrl
  dockcrlimg
  dockcrlvol
}

function docksh() { 
  docker exec -it $1 /bin/bash; 
}

function dockshx() { 
  docker exec -it $(docker ps | grep $1 | head -c 2) sh 
}

function dockcrlimg() { 
  docker rmi -f $(docker images -a -q) 
}

function dockcrlvol() { 
  docker volume rm $(docker volume ls -q) 
}

# manipulate zshrc
function catrc() {
  cat ~/.zshrc
}

function cliprc() {
  cat ~/.zshrc | clip.exe
}

function coderc() {
  code ~/.zshrc
}

function nanorc() {
  nano ~/.zshrc
}

function readrc() {
  source ~/.zshrc
}

function codeomz() {
  code ~/.oh-my-zsh
}

function nanowslc() {
  nano /mnt/c/Users/Kiko/.wslconfig
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set the custom shell prompt
PS1="kiko@\h \w \$ "
PROMPT="kiko@\h \w \$ "

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will load a random theme each 
# time oh-my-zsh is loaded, in which case, to know which specific one was loaded, run: echo $RANDOM_THEME
ZSH_THEME="agnoster" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto # reminder, disabled or auto

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="false"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty. 
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time stamp shown in the history command output
# or set a custom format using the strftime function format specifications, see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy" # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nano'
export GIT_EDITOR=nano

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
