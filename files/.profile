# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n
export LC_ALL="en_US.UTF-8"
export PATH=/opt/intelFPGA_lite/18.0/quartus/sopc_builder/bin/:/opt/intelFPGA_lite/18.0/quartus/bin/:$PATH
export LD_PRELOAD=/usr/lib/libtcmalloc_minimal.so.4
alias l='ls -alF'
alias ll='ls -alF'
alias ..='cd ..'

