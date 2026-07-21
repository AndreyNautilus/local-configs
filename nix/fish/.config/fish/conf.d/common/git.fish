abbr -a -g gd   "git diff"
abbr -a -g gdh  "git diff HEAD"

abbr -a -g gb   "git branch"

abbr -a -g gss  "git status -s"

abbr -a -g gp   "git pull"

function abbr_git_push_origin --description "git push origin CURRENT_BRANCH"
    set CURRENT_BRANCH (git symbolic-ref --quiet --short HEAD 2>/dev/null)
    echo "git push origin $CURRENT_BRANCH"
end
abbr -a gpo --function abbr_git_push_origin

abbr -a -g --set-cursor=_CURSOR  gl   "git log --topo-order --color --decorate --oneline -10_CURSOR | awk '{print NR-1 \": \" \$0}'"
abbr -a -g gl20 "git log --topo-order --color --decorate --oneline -20 | awk '{print NR-1 \": \" \$0}'"

abbr -a -g --set-cursor=_CURSOR gcm  "git checkout main_CURSOR && git pull"
abbr -a -g gcms "git checkout master && git pull"

abbr -a -g gs   "git switch"

function abbr_git_switch_main_and_pull --description "git switch DEFAULT_BRANCH && git pull"
    set DEFAULT_BRANCH (git rev-parse --abbrev-ref origin/HEAD 2>/dev/null | sed 's|origin/||')
    if test -z "$DEFAULT_BRANCH"
        set DEFAULT_BRANCH "main"
    end
    echo "git switch $DEFAULT_BRANCH _CURSOR && git pull"
end
abbr -a gsm --set-cursor=_CURSOR --function abbr_git_switch_main_and_pull

function abbr_git_fixup --description "git commit --fixup=LAST_NON_FIXUP_COMMIT_AS_HEAD~N"
    set -l parts (string split \x1f -- (git log --invert-grep --grep='^fixup!' -n 1 --format='%h%x1f%s' 2>/dev/null))
    set LAST_NON_FIXUP_COMMIT_HASH $parts[1]
    set LAST_NON_FIXUP_COMMIT_TITLE $parts[2]

    if test -n "$LAST_NON_FIXUP_COMMIT_HASH"
        set LAST_NON_FIXUP_COMMIT_DISTANCE (git rev-list --count $LAST_NON_FIXUP_COMMIT_HASH..HEAD 2>/dev/null)
        echo "git commit --fixup=HEAD~$LAST_NON_FIXUP_COMMIT_DISTANCE _CURSOR"
    else
        echo "git commit --fixup="
    end
end
abbr -a gf --set-cursor=_CURSOR --function abbr_git_fixup

abbr -a -g ga   "git add"

function abbr_git_rebase_autosquash_i --description "git rebase --autosquash -i HEAD~N"
    set -l parts (string split \x1f -- (git log --invert-grep --grep='^fixup!' -n 1 --format='%h%x1f%s' 2>/dev/null))
    set LAST_NON_FIXUP_COMMIT_HASH $parts[1]
    set LAST_NON_FIXUP_COMMIT_TITLE $parts[2]

    if test -n "$LAST_NON_FIXUP_COMMIT_HASH"
        set LAST_NON_FIXUP_COMMIT_DISTANCE (git rev-list --count $LAST_NON_FIXUP_COMMIT_HASH~1..HEAD 2>/dev/null)
        echo "git rebase --autosquash -i HEAD~$LAST_NON_FIXUP_COMMIT_DISTANCE"
    else
        echo "git rebase --autosquash -i"
    end
end
abbr -a gra --function abbr_git_rebase_autosquash_i

abbr -a -g gchp "git cherry-pick --no-commit"
abbr -a -g gcp  "git cherry-pick --no-commit"

abbr -a -g grpo "git remote prune origin"

abbr -a -g git_subm_deinit "git submodule deinit -f --all"
abbr -a -g git_subm_reinit "git submodule update --init"
