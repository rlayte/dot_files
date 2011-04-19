
source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/paths

# Load completions

source ~/.bash/completion/bash-completion

for f in ~/.bash/completion/* 
do
        source $f
done
