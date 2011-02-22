### CONFIG ###

export PS1="\W $ "
export EDITOR="mvim"


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
