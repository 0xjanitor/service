find .git/objects -type f -printf "%P\n" | sed s,/,, | while read object; do echo "=== $obj $(git cat-file -t $object) ==="; git cat-file -p $object; done
