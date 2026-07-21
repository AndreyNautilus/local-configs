# tar
abbr -a -g  tar_c_gz    tar -czvf out.tar.gz .
abbr -a -g --set-cursor=_C  tar_un_gz   tar -xzvf file_C.tar.gz
abbr -a -g --set-cursor=_C  tar_un_bz2  tar -xjvf file_C.tar.bz2
abbr -a -g --set-cursor=_C  tar_list    tar -tvf file_C.tar.gz

# gpg
abbr -a -g  gpg_encr    gpg --symmetric --cipher-algo AES-256
abbr -a -g  gpg_decr    gpg --decrypt

# find
abbr -a -g  find_exec   'find . -name "*.txt" -exec echo == {} \;'
abbr -a -g  find_exec_grep  'find . -name "*.txt" -exec sh -c "echo {} && grep PATTERN {}" \;'

# grep
abbr -a -g  grep_not    'grep -v'
abbr -a -g --set-cursor=_C  grep_recursive  'grep --exclude-dir={.git,.venv,.mypy_cache,__pycache__} --recursive "_C" .'

# mkdir
abbr -a -g  mkd     'mkdir'
abbr -a -g  mdk     'mkdir'
abbr -a -g  mdkir   'mkdir'

# du
abbr -a -g  du_human_sum    'du -hs'

# .. -> cd ../
function abbr_multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function abbr_multicd
