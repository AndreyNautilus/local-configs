# Disable built-in venv prompt, rely on fish theme
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

abbr -a -g venv "python3 -m venv .venv && . .venv/bin/activate.fish"
