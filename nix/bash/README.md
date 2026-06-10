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

## Readline

`.inputrc` configures [Readline](https://man7.org/linux/man-pages/man1/bash.1.html#READLINE):
- _substring search_ via UP/DOWN keys instead of _previous/next_ commands (example: 'com' + UP will find `git commit -am "..."`).

1. Copy `.inputrc` into `$HOME`
2. restart shell (bash will load the file automatically)
