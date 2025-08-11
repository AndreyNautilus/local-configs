# Installing python3

MacOS has embedded `python3` installation which causes lots of problems.
I need a "regular" python installation.

## Latest python3

`brew install python3` will install and link latest python3 into homebrew bin directory.

## Specific python version

`brew install python@3.11` to install.

Add to `.config/fish/config.fish`:
- `fish_add_path --path --prepend (brew --prefix python@3.11)/libexec/bin` to prepend the installed python to PATH;
- `fish_add_path --path /Users/andrey.potapov/Library/Python/3.11/bin` to add user-local python packages to PATH;