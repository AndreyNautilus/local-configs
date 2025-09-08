abbr -a -g  tar_c_gz    tar -czvf out.tar.gz .
abbr -a -g --set-cursor=_C  tar_un_gz   tar -xzvf file_C.tar.gz
abbr -a -g --set-cursor=_C  tar_un_bz2  tar -xjvf file_C.tar.bz2
abbr -a -g --set-cursor=_C  tar_list    tar -tvf file_C.tar.gz


abbr -a -g  gpg_encr    gpg --symmetric --cipher-algo AES-256
abbr -a -g  gpg_decr    gpg --decrypt


abbr -a -g  find_exec   'find . -name "*.txt" -exec echo == {} \;'
abbr -a -g  find_exec_grep  'find . -name "*.txt" -exec sh -c "echo {} && grep PATTERN {}" \;'
