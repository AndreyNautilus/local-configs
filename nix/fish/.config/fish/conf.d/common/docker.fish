set -x PS1_DOCKER '[\[\e[38;5;2m\]\u\[\e[0m\]:\[\e[38;5;9m\]DOCKER\[\e[0m\]@\[\e[1;38;5;13m\]\h\[\e[0m\]]\$ '

abbr -a -g --set-cursor=% docker_run "docker run --rm -it \
-v (pwd):/home/host/(basename (pwd)) \
--workdir=/home/host/(basename (pwd)) \
--env PS1=\$PS1_DOCKER \
IMAGE:latest% \
/bin/bash"

abbr -a -g --set-cursor=% docker_exec_sh "docker exec -it NAME% /bin/bash"

abbr -a -g docker_rm_stopped "docker ps -aq --no-trunc -f status=exited | xargs docker rm"
