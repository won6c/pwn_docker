#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1604"
    exit 1
fi

version=$1

case $version in
    1604)
        docker exec -it ctf1604 /bin/bash
        ;;
    1804)
        docker exec -it ctf1804 /bin/bash
        ;;
    2004)
        docker exec -it ctf2004 /bin/bash
        ;;
    2204)
        docker exec -it ctf2204 /bin/bash
        ;;
    *)
        echo "Unsupported version: $version"
        exit 1
        ;;
esac
