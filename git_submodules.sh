git submodule status | awk '{print $2}' | parallel -j4 'cd {}; pwd; git pull'
git submodule foreach git pull \&
