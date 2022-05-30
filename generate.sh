#!/bin/bash
# Credits: https://github.com/v2fly/domain-list-community
# Usage: ./generate.sh -f "domain list name"

OPTION=$1
NAME=$2
CUR=${PWD}

if [ $# -gt 2 ]; then
    echo "Please use -h to see the help."
    exit 1
fi

raw_file="${CUR}/src/${NAME}.txt"
clash_file="${CUR}/clash/${NAME}.yaml"

test() {
    if [ -f "${clash_file}" ]; then
        echo "${NAME}.yaml exists."
        rm -rfv ${clash_file}
        echo "${NAME}.yaml has been removed."
    else
        echo "${NAME}.yaml does not exist, create it."
        touch ${clash_file}
    fi
}

generate_clash() {
    echo "Generating ${clash_file}..."
    echo "payload:" > ${clash_file}
    cat ${raw_file} | sort | sed $'s/^/  - \'+./g' | sed $'s/$/&\'/g' >> ${clash_file}
    echo "Done."
}

help() {
    echo "Usage: ./generate.sh [OPTION] [NAME]"
    echo "Example: ./generate.sh -f weibo"
    echo "Option:"
    echo "-t : Test if clash file exists"
    echo "-gc : Generate clash file"
    echo "-f : Generate new clash file"
    echo "-h : Show this help."
    echo "Name:"
    echo "txt file in src folder"
}

case ${OPTION} in
    -t)
        test
        ;;
    -gc)
        generate_clash
        ;;
    -h)
        help
        ;;
    -f)
        test
        generate_clash
        ;;
    *)
        echo "Please use -h to see the help."
        ;;
esac