# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob prompt_subst
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/rlayte/.zshrc'

autoload -Uz compinit colors vcs_info
colors
compinit
# End of lines added by compinstall

TERM=xterm-256color

local smiley="%(?,%{$fg[green]%}>%{$reset_color%},%{$fg[red]%}x%{$reset_color%})"

function __git_prompt {
    local DIRTY="%{$fg[yellow]%}"
    local CLEAN="%{$fg[green]%}"
    local UNMERGED="%{$fg[red]%}"
    local RESET="%{$terminfo[sgr0]%}"
    git rev-parse --git-dir >& /dev/null
    if [[ $? == 0 ]]
    then
        if [[ `git ls-files -u >& /dev/null` == '' ]]
        then
            git diff --quiet >& /dev/null
            if [[ $? == 1 ]]
            then
                echo -n $DIRTY
            else
                git diff --cached --quiet >& /dev/null
                if [[ $? == 1 ]]
                then
                    echo -n $DIRTY
                else
                    echo -n $CLEAN
                fi
            fi
        else
            echo -n $UNMERGED
        fi
        echo -n "("
        echo -n `git branch | grep '* ' | sed 's/..//'`
        echo -n ")"
        echo -n $RESET
    fi
}

PROMPT='
%{$fg[blue]%}%~ $(__git_prompt)% 
${smiley} %{$reset_color%}'

# load tmuxinator if installed
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && . $HOME/.tmuxinator/scripts/tmuxinator

alias ls="ls -G1"
alias ll="ls -l"
alias tmux="TERM=screen-256color-bce tmux"
alias vi="mvim -v"
alias vim="mvim -v"

export EDITOR='vim'

export PATH="$PATH:/var/lib/gems/1.8/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="/usr/local/sbin:$PATH"

export GOPATH="$HOME/work/go"
