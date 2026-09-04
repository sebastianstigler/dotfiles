################################################################################
# Author: Pete Clark
# Email: pete[dot]clark[at]gmail[dot]com
# Version: 0.1 (05/24/2011)
# License: WTFPL<http://sam.zoy.org/wtfpl/>
#
# This oh-my-zsh plugin adds smart tab completion for
# TaskWarrior<http://taskwarrior.org/>. It uses the zsh tab completion
# script (_task) distributed with TaskWarrior for the completion definitions.
#
# Typing task[tabtab] will give you a list of current tasks, task 66[tabtab]
# gives a list of available modifications for that task, etc.
################################################################################

export TODOTXT_DEFAULT_ACTION=ls


alias t=todo.sh

# Run todo.sh
alias td="echo && todo.sh | sort | sed '1d;\$d'"
alias d="todo.sh do"
alias a="todo.sh add"
alias te="$EDITOR ~/.todo/todo.txt"

# Run Punch.py
alias i="punch in"
alias o="punch out"
alias r="punch report"
alias p="punch what"

compdef _todo.sh t=todo.sh
