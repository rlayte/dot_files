### CONFIG ###

export PS1="\W $ "
export EDITOR="mvim"

if [ -f /usr/local/Cellar/bash-completion/1.2/etc/bash_completion ]; then
    . /usr/local/Cellar/bash-completion/1.2/etc/bash_completion
fi

### PATHS ###

PATH=$PATH:/usr/lib/ruby/gems/1.8/bin/
export PATH


### ALIASES ###

#ls
alias ls="ls -1 -F"

# cd
alias ..="cd ../"
alias ...="cd ../../"
function mkdir! {
    mkdir $1; cd $1
}
alias reload=". ~/.bashrc"

# bash
alias reload=". ~/.bashrc"
alias bashrc="mvim ~/.bash/"

# apache
alias vhosts="mvim /private/etc/apache2/extra/httpd-vhosts.conf"
alias hosts="mvim /private/etc/hosts"
alias restart="sudo apachectl restart"

# JsTestDriver
alias jstest="java -jar ~/Library/JsTestDriver/JsTestDriver-1.2.2.jar --tests all --reset"
alias jstestserver="java -jar ~/Library/JsTestDriver/JsTestDriver-1.2.2.jar --port "

# Django

if [ -f bash/completion/django_bash_completion ]; then
    source bash/completion/django_bash_completion
fi

source ~/.bash/completion/django_bash_completion
source ~/.bash/completion/svn_completion

# Python
export PYTHONSTARTUP="/Users/richardlayte/.pythonrc"
