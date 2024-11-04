abbr -a -g --set-cursor=% docker_run "docker run --rm -it -v ~/:/home/host IMAGE:latest% /bin/bash"

abbr -a -g docker_rm_stopped "docker ps -aq --no-trunc -f status=exited | xargs docker rm"
