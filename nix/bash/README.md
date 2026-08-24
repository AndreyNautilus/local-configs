# bash config files

## Prompt - PS1 envvar

`.bashrc-ps1` contains git-aware
[prompt](https://man7.org/linux/man-pages/man1/bash.1.html#PROMPTING)
inspired by
[bobthefish](https://github.com/oh-my-fish/theme-bobthefish) fish theme.

1. copy `.bashrc-ps1` into `$HOME`;
2. call it from the standard `.bashrc`:
    ```bash
    . ~/.bashrc-ps1
    ```

Check the script for configuration options.

## iTerm2 integration

[Shell integration](https://iterm2.com/documentation-shell-integration.html) enables lots of useful features in iTerm2 (macos-only).

According to [the docs](https://iterm2.com/documentation-shell-integration.html#install-by-hand):
1. download the script
   ```bash
   curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash
   ```
2. call it from `.bashrc`:
   ```bash
   if [ -f ~/.iterm2_shell_integration.bash ]; then
       source ~/.iterm2_shell_integration.bash
   fi
   ```

## aliases

`.alias-personal` contains personal aliases (mostly mimic my fish abbreviations).

1. copy `.alias-personal` into `$HOME`
2. call it from the standard `.bashrc`:
    ```bash
    . ~/.alias-personal
    ```

## Readline

`.inputrc` configures [Readline](https://man7.org/linux/man-pages/man1/bash.1.html#READLINE):
- _substring search_ via UP/DOWN keys instead of _previous/next_ commands (example: 'com' + UP will find `git commit -am "..."`).

1. copy `.inputrc` into `$HOME`
2. restart shell (bash will load the file automatically)

## Nano

`.nanorc` configures [nano text editor](https://www.nano-editor.org/).

1. copy `.nanorc` into `$HOME`
2. reopen `nano`

