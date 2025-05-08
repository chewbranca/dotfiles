# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/opt/curl/bin:$PATH"
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
# Load .bashrc if it exists
test -f ~/.bash_local && source ~/.bash_local

# Increase file limit
launchctl limit maxfiles 16384 16384 && ulimit -n 16384

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

export PATH=/Applications/Racket\ v6.0.1/bin:~/bin:~/bin/erlbrew.d:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR=vim

export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

. "$HOME/.asdf/asdf.sh"

HISTSIZE=100000

alias ls="ls -G"
alias tmux="`which tmux` -2"

# FROM: http://www.maketecheasier.com/8-useful-and-interesting-bash-prompts/
PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Shared bash history
export PROMPT_COMMAND='history -a'

# added by Anaconda2 4.0.0 installer
export PATH="/Users/chewbranca/anaconda/bin:$PATH"

dbgrep() {
    #grep $* src/*/{src,include,test}/*.{{h,e}rl,cfg}
    #grep $* src/*/{src,include,test,priv}/*.{{h,e}rl,cfg}
    #grep $* src/*/{src/*.{e,h}rl,include/*.cfg,test/*.erl,test/*/*.erl}
    #grep -r $* src/*/src/*.{e,h}rl src/*/include/*.hrl src/*/test/{*.erl,*/*.erl} src/*/priv/*
    echo "grep -r $* src/*/src/*.{e,h}rl src/*/include/*.hrl src/*/test/*.erl src/*/test/*/*.erl src/*/priv/*"
    grep -r $* src/*/src/*.{e,h}rl src/*/include/*.hrl src/*/test/*.erl src/*/test/*/*.erl src/*/priv/*
}
