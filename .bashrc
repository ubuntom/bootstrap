# Append this file to your ~/.bashrc 

# Clear the terminal
alias cls='printf "\033c"'


# Tools for building PS1 strings

# Constant definitions
DIREC="\w"
CLEARFMT="\[\033[0m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[1;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[1;36m\]"
GREEN="\[\033[1;32m\]"
COL="\[\033[1;31m\]"

# Substring definitions

# Print the current time 
TIME="$PURPLE\t$CLEARFMT:"

# Print the Conda environment if activated
CONDA="\`if [ \"\$CONDA_DEFAULT_ENV\" != 'base' ]; then echo -n \"$YELLOW\${CONDA_DEFAULT_ENV}$CLEARFMT:\"; fi\`"

# Print the current branch if in a Git repo
GIT="\`if [ \"\$_BRANCH\" != '' ]; then echo -n \"$BLUE\${_BRANCH}$CLEARFMT:\"; fi\`"
GIT_BRANCH_MAX_LEN=16  # The maximum number of chars to use to display the branch name
GIT_COMMAND='_BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null);_LEN=${#_BRANCH};if (( $_LEN > $GIT_BRANCH_MAX_LEN )); then _BRANCH="${_BRANCH:0:$(($GIT_BRANCH_MAX_LEN - 1))}~"; fi;'

# Print the current directory
SUFFIX="\`if [ \$? = 0 ]; then echo '$GREEN$DIREC\\\$$CLEARFMT'; else echo '$COL$DIREC\\\$$CLEARFMT'; fi\`"

# Finalise

PROMPT_COMMAND=$GIT_COMMAND
PS1="$CLEARFMT$TIME$CONDA$GIT$SUFFIX $CLEARFMT"
