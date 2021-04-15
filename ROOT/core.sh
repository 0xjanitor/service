#!/usr/bin/env bash
/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin 
/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
/usr/bin/git config --local gc.auto 0
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :
/usr/bin/git config --local http.https://github.com/.extraheader AUTHORIZATION: basic ***
/usr/bin/git -c protocol.version=2 fetch --no-tags --prune --progress --no-recurse-submodules --depth=1 origin 
/usr/bin/git checkout --progress --force -B ${GIT_BRANCH_ORIGIN} refs/remotes/origin/${GIT_BRANCH_ORIGIN}
/usr/bin/git log -1 --format='%H'
/usr/bin/bash -e {0}

#cleanup
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
