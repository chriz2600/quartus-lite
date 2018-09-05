# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n
export LC_ALL="en_US.UTF-8"
export LD_PRELOAD=/usr/lib/libtcmalloc_minimal.so.4
alias l='ls -alF'
alias ll='ls -alF'
alias ..='cd ..'

if [ -f /root/.profile.addons ]; then
    source /root/.profile.addons
fi
