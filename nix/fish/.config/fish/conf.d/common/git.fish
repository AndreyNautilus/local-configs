abbr -a -g gd   "git diff"
abbr -a -g gdh  "git diff HEAD"

abbr -a -g gb   "git branch"

abbr -a -g gss  "git status -s"

abbr -a -g gp   "git pull"
abbr -a -g gpo  "git push origin"
abbr -a -g gpoh "git push origin HEAD"

abbr -a -g --set-cursor=_CURSOR  gl   "git log --topo-order --color --decorate --oneline -10_CURSOR | awk '{print NR-1 \": \" \$0}'"
abbr -a -g gl20 "git log --topo-order --color --decorate --oneline -20 | awk '{print NR-1 \": \" \$0}'"

abbr -a -g --set-cursor=_CURSOR gcm  "git checkout main_CURSOR && git pull"
abbr -a -g gcms "git checkout master && git pull"

abbr -a -g gs   "git switch"
abbr -a -g --set-cursor=_CURSOR gsm  "git switch main_CURSOR && git pull"
abbr -a -g gsms "git switch master && git pull"

abbr -a -g gf   "git commit --fixup=HEAD~"
abbr -a -g ga   "git add"

abbr -a -g gra  "git rebase --autosquash -i"

abbr -a -g gchp "git cherry-pick --no-commit"
abbr -a -g gcp  "git cherry-pick --no-commit"

abbr -a -g grpo "git remote prune origin"
