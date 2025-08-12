set -g fish_color_command brwhite
set -g fish_prompt_pwd_dir_length 0

set -g color_path_basename white

# For fish >= 4 bring back the old ctrl-c behaviour:
#   leave the current cancelled command, print the cancel mark and print the new prompt.
bind ctrl-c cancel-commandline
