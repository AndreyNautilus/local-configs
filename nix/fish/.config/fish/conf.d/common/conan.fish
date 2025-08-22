abbr -a -g 	coni	"conan install . -pr=macos_armv8 --build=missing"
abbr -a -g 	conb	"conan build ."
abbr -a -g  conc    "conan create . (git describe --tags)@andrey/testing -pr=macos_armv8 --build=missing"
abbr -a -g  cons    'conan search "*"'
abbr -a -g  conr    "conan remove -f"

abbr -a -g  con_clean   'conan remove --builds --src --force "*"'
abbr -a -g  con_default 'rm ~/.conan/profiles/default'
