if not type -q docker and type -q podman
    # define alias ONLY if:
    # - podman is a valid command
    # - docker is NOT a valid command
    alias docker=podman
end
