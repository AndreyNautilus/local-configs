#!/bin/bash
# see: https://code.claude.com/docs/en/statusline#tips

# Read JSON input from stdin
input=$(cat)

CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
RESET='\033[0m'

# Extract values using jq
# see: https://code.claude.com/docs/en/statusline#available-data
MODEL=$(echo "$input" | jq -r '.model.display_name')
CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir')
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
CONTEXT_USAGE=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

# Show git branch if in a git repo, colored by status (matches __ps1_git_branch_color)
GIT_BRANCH=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [ -n "$BRANCH" ]; then
        if ! git diff --no-ext-diff --quiet --exit-code 2>/dev/null; then
            BRANCH_COLOR='\033[0;97;48;5;160m'   # red bg: unstaged changes
        elif ! git diff --cached --no-ext-diff --quiet --exit-code 2>/dev/null; then
            BRANCH_COLOR='\033[30;48;5;214m' # orange bg: staged changes
        else
            BRANCH_COLOR='\033[30;48;5;148m' # green bg: clean
        fi
        GIT_BRANCH=" ${BRANCH_COLOR} ⎇ ${BRANCH} ${RESET}"
    fi
fi

# Context usage (progress bar)
# see: https://code.claude.com/docs/en/statusline#display-multiple-lines

# Pick bar color based on context usage
if [ "$CONTEXT_USAGE" -ge 90 ]; then
    BAR_COLOR="$RED"
elif [ "$CONTEXT_USAGE" -ge 70 ]; then
    BAR_COLOR="$YELLOW"
else
    BAR_COLOR="$GREEN";
fi

FILLED=$((CONTEXT_USAGE / 10)); EMPTY=$((10 - FILLED))
printf -v FILL "%${FILLED}s"; printf -v PAD "%${EMPTY}s"
BAR="${FILL// /█}${PAD// /░}"

# Format cost
COST_FMT=$(printf '$%.2f' "$COST")

# Print everything
echo -e "${CYAN}[$MODEL]${RESET} 📁 ${CURRENT_DIR/#$HOME/~}$GIT_BRANCH"
echo -e "${BAR_COLOR}${BAR}${RESET} ${CONTEXT_USAGE}% | ${YELLOW}${COST_FMT}${RESET} "
