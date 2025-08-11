# MacOS configuration (last tested on 15.6)

## System

- turn off `Automatically rearrange Spaces based on most recent use`: `System Settings` -> `Desktop & Dock` -> scroll down -> turn it off;
- enable regular Function keys (F1 - F12): `System Settings` -> `Keyboard` -> `Keyboard Shortcuts...` button -> `Function Keys` tab -> turn on "Use F1, F2, etc. keys as standard function keys".

## Apps

1. [ScrollReverser](https://pilotmoon.com/scrollreverser/) ([github](https://github.com/pilotmoon/Scroll-Reverser)) to configure trackpad scroll direction and mouse scroll direction separately;
1. [iTerm2](https://iterm2.com/) - proper console for macos (see [details](iterm2/README.md));
1. [Home brew](https://brew.sh/) - package manager
	- must be installed **after** fish shell to have all envvars set (or should be re-installed after fish);
	- follow the instructions in output to update fish config;
1. [muCommander](https://www.mucommander.com/)
1. fresh python3: `brew install python3` ([details](python.md))
1. [Sublime Text](https://www.sublimetext.com/)
	- copy configs from [`win` folder](../win/sublime-text) to `Library/Application Support/Sublime Text/Packages/User/`;
