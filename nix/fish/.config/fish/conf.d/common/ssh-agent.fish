# taken from https://github.com/danhper/fish-ssh-agent/blob/master/conf.d/fish-ssh-agent.fish

if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end
