# SSH config

1. `fish/.config/conf.d/common/ssh-agent.fish` takes care of starting `ssh-agent` automatically.
2. copy ssh config (verify path to github key):
   ```bash
   cp (pwd)/nix/ssh/config ~/.ssh/config
   chmod 600 ~/.ssh/config
   ```
