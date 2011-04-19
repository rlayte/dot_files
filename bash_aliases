# cd
alias ..="cd ../"
alias ...="cd ../../"

# mkdir
function mkdir! {
    mkdir $1; cd $1
}

function mkpkg {
    dir= pwd
    for i in $(echo $1 | tr "/" "\n")
    do
      mkdir! $i
    done
    cd $dir
}

function mkpkg! {
    for i in $(echo $1 | tr "/" "\n")
    do
      mkdir! $i
    done
}

# bash
alias reload=". ~/.bashrc"
