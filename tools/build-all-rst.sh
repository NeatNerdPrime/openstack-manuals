#!/bin/bash -e

mkdir -p publish-docs/html

LINKCHECK=""
if [[ $# > 0 ]] ; then
    if [ "$1" = "--linkcheck" ] ; then
        LINKCHECK="$1"
    fi
fi

# Set this to a sensible value if not set by OpenStack CI.
if [ -z "$ZUUL_BRANCH" ] ; then
    ZUUL_BRANCH="stable/newton"
fi

# Do not build for stable/newton, these are only published from master
#for guide in admin-guide arch-design cli-reference contributor-guide \
#    ha-guide image-guide ops-guide user-guide; do
#    tools/build-rst.sh doc/$guide --build build \
#        --target $guide $LINKCHECK
#done

# This marker is needed for infra publishing.
# Note for stable branches, this needs to be the top of each manual.
MARKER_TEXT="Project: $ZUUL_PROJECT Ref: $ZUUL_BRANCH Build: $ZUUL_UUID Revision: $ZUUL_NEWREF"

# Draft guides
# This includes guides that we publish from stable branches
# as versioned like the networking-guide.
for guide in user-guide admin-guide cli-reference networking-guide config-reference; do
    tools/build-rst.sh doc/$guide --build build \
        --target "newton/$guide" $LINKCHECK
    echo $MARKER_TEXT > publish-docs/html/newton/$guide/.root-marker
done

tools/build-install-guides-rst.sh $LINKCHECK
