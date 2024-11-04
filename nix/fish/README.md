# fish shell installation and configuration

https://fishshell.com/

1. install fish
2. change default shell to fish: `sudo chsh -s (which fish) $USER`
3. install oh-my-fish (https://github.com/oh-my-fish/oh-my-fish):
   `curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish`
4. install `bobthefish` theme (https://github.com/oh-my-fish/theme-bobthefish):
   `omf install bobthefish`
5. link my config to the system:
   ```bash
   ln -s local-configs/nix/fish/.config/fish/conf.d/common/ ~/.config/fish/conf.d/common
   ln -s local-configs/nix/fish/.config/fish/conf.d/_source_common.fish  ~/.config/fish/conf.d/_source_common.fish
   ```
