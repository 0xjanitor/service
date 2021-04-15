#!/bin/bash
function sort_versions() {
    sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' \
    | LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n \
    | awk '{print $2}' \
    | paste -s -d" " -
}

# Matches the following lines formats:
# - "name": "2019.02.03"
# - "name": "2019.02.03-alpha"
# As to be able to match stable Io releases and alpha/beta ones too
function extract_versions_numbers() {
    grep -o "\"name\": \"[0-9]\+.[0-9]\+.[0-9]\+-\?\w\+\"," | sed 's/"name": "\(.*\)",/\1/'
}
