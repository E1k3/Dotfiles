#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -l --color=auto'
PS1='[\u@\h \W]\$ '

export VISUAL="vim"
export EDITOR="vim"
