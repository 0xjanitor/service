git filter-branch --force --index-filter \
    "git ls-files -i -X /tmp/.gitignore | xargs -r git rm --cached --ignore-unmatch -rf" \
    --prune-empty --tag-name-filter cat -- --all
