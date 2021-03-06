# show current git branch in commandline prompt and take existing coloring
# and changes into account (e.g. .venv) 
# http://martinvalasek.com/blog/current-git-branch-name-in-command-prompt
# If colors are enabled in git output, we run into an ugly bash escaping issue
# The post below provides details:
# https://stackoverflow.com/questions/19092488/custom-bash-prompt-is-overwriting-itself#
# Instead of extra escaping (which doesn't seem to fully solve the problem), we
# just force git branch to not use any colors

function parse_git_branch () {
  git -c color.ui=false branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
 
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
 
PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "
#prompt_cmd () {
#    PS1="${PYTHON_VIRTUALENV}$PURPLE\$(set_rvm_prompt)$NO_COLOUR\u@\h:[\W]${B_STATE}\$(parse_git_branch)$NO_COLOUR\$ "
#}

#PROMPT_COMMAND=prompt_cmd
