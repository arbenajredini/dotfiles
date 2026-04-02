# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    # Core functionality
    git
    sudo
    history
    colored-man-pages
    command-not-found

    # Navigation & Productivity
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    zsh-history-substring-search
    autojump
    zoxide

    # Development 
    pip
    python
    ruby
    golang
    rust

    # Tools
    fzf
    tmux
    brew
    macos
    copypath
    copyfile
    copybuffer
    dirhistory
    web-search
    urltools
    encode64
    extract
    universalarchive
)

# Update behavior
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' verbose yes

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
setopt HIST_VERIFY

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Misc
setopt CORRECT
setopt CORRECT_ALL
setopt NO_BEEP
setopt INTERACTIVE_COMMENTS

# Editors
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less -R'

source $ZSH/oh-my-zsh.sh

# Python
alias py='python3'
alias py2='python2'
alias pip='pip3'
alias venv='python3 -m venv venv && source venv/bin/activate'
alias activate='source venv/bin/activate'

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

export PATH="$HOME/.ghcup/bin:$PATH"

alias zshrc="code ~/.zshrc"
alias gc="git checkout"
alias gpull="git pull"
alias gpush="git push"
alias gbranch="git checkout -b"

export PATH="/usr/local/share/dotnet:$PATH"
export PATH=~/miniconda3/bin:$PATH

# ==========================================
# CUSTOM FUNCTIONS
# ==========================================

# Create directory and cd into it
take() {
  mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.tar.xz)    tar xJf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.deb)       ar x "$1"      ;;
      *.tar.zst)   unzstd "$1"    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find and replace in current directory
findreplace() {
  find . -type f -name "$1" -exec sed -i '' "s/$2/$3/g" {} +
}

# Preview files with fzf and bat
preview() {
  fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/endrit/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/endrit/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/endrit/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/endrit/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/endrit/.opam/opam-init/init.zsh' ]] || source '/Users/endrit/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/endrit/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
export PATH="$HOME/.local/bin:$PATH"
