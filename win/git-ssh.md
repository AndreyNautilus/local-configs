# Git installation

https://git-scm.com/downloads

## Configure git

Populate global git config:
```
git config --global --add core.autocrlf input
git config --global --add user.name "Andrey Potapov"
git config --global --add user.email "andrey.nautilus@yandex.ru"
```

## Enable OpenSSH Client

Run in admin-elevated terminal:
```
Get-Service -Name ssh-agent | Set-Service -StartupType Manual
```
Run in normal terminal:
```
Start-Service ssh-agent
```

## Generate and add ssh key

Generate ssh key + add it to github:
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

Run in normal terminal (ssh client must be running; the key must be generated):
```
ssh-add C:\Users\andre\.ssh\github_personal
```

Now git should work:
```
git clone ssh://***
```
