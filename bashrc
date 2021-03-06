#source ~/.devrc
#source /Users/robertt/.rvm/scripts/rvm
source '/usr/local/share/chruby/chruby.sh'
source '/usr/local/share/chruby/auto.sh'
if [ -d ".dotextras" ]; then
  for f in `ls .dotextras`
  do
    source ".dotextras/$f"
  done
fi

# added for git commandline completion
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

export EDITOR='vim'
# mkdir ~/lib
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
export LONG_PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[136m\]\w\[\033[36m\]$(__git_ps1)\[\033[00m\]\$ '
export SHORT_PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[136m\]\W\[\033[36m\]$(__git_ps1)\[\033[00m\]\$ '
export PS1=$LONG_PS1
export PREV_PS1=$SHORT_PS1

function tps1 () {
  local hold_ps1=$PS1
  PS1=$PREV_PS1
  PREV_PS1=$hold_ps1
}

export JAVA_HOME=`/usr/libexec/java_home`
set -o vi

# my aliases
srchjar='searchjars $1'

function searchjars(){
  find . -name \*.jar -print -exec jar -tf {} $1 \;
}


function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
      else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst-"$(date +%H:%M:%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

function findPid(){
  if [ "$2" == "-v" ]; then
    found=`ps -e | grep -i "$1" |grep -v grep`
    echo "found:${found}"
    echo ""
  fi
  tokill=`ps -e | grep -i "$1"| grep -v grep | cut -c 1-6`
  echo "$tokill"
}

function findPidKill(){
  if [ "$2" == "-v" ]; then
    found=`ps -e | grep -i "$1" |grep -v grep`
    echo "found:${found}"
    echo ""
  fi
  tokill=`ps -e | grep -i "$1"| grep -v grep | cut -c 1-6`
  arrtokill=(${tokill//\n/ })
  for i in "${arrtokill[@]}"
  do
    echo "killing ${i}"
    kill ${i}
  done
}

PATH=/Users/robert.tomb/Library/Python/3.4/bin:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$HOME/bin:$JAVA_HOME/bin:$HOME/.rvm/bin:/usr/local/share/npm/bin:/usr/local/go/bin:$PATH 

# added by travis gem
[ -f /Users/robert.tomb/.travis/travis.sh ] && source /Users/robert.tomb/.travis/travis.sh
