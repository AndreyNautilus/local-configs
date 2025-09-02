abbr -a -g  tar_c_gz    tar -czvf out.tar.gz .
abbr -a -g --set-cursor=_C tar_un_gz    tar -xzvf file_C.tar.gz
abbr -a -g --set-cursor=_C tar_un_bz2   tar -xjvf file_C.tar.bz2


abbr -a -g  gpg_encr    gpg --symmetric --cipher-algo AES-256
abbr -a -g  gpg_decr    gpg --decrypt
