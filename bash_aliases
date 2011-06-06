# cd
alias ..="cd ../"
alias ...="cd ../../"

# mkdir
function mkdir! {
    mkdir $1; cd $1
}

# bash
alias reload=". ~/.bashrc"


# django

function djs {
    PORT=8000

    if [ $1 ]; then
        PORT=$1
    fi
        
    django-admin.py runserver 0.0.0.0:$PORT
}

alias gae='/home/richardlayte/google_appengine/dev_appserver.py'
