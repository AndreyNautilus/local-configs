# abbreviations for "conan" package manager for C++.
# See:
#   - https://conan.io/
#   - https://github.com/conan-io

abbr -a -g  coni    "conan install . -pr:h=macos_armv8 --build=missing"
abbr -a -g  conb    "conan build . -pr:h=macos_armv8"
abbr -a -g  conc    "conan create . --version=(git describe --tags) --user=andrey --channel=testing -pr:h=macos_armv8 --build=missing"
abbr -a -g  cons    'conan search "*"'
abbr -a -g  conr    "conan remove --confirm"
abbr -a -g  conl    "conan list"
abbr -a -g  concache    "conan cache path pkg/ver:id"

abbr -a -g  con_clean   'conan remove --builds --src --force "*"'
abbr -a -g  con_re_default 'rm ~/.conan2/profiles/default && conan profile detect'
