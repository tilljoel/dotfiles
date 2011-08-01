#!/bin/dash
#
#############################################################################
#   License
#############################################################################
#
# Copyright 2010 Joel Larsson, http://hackr.se/joellarsson
#
# This file is a script to manage photos and sort them into dirs.
#
# Separate.sh is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# Separate.sh is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along
# with Separate.sh. If not, see http://www.gnu.org/licenses/.
#
#############################################################################
#   About
#############################################################################
#
# Tested with both dash/bash on my gentoo box. Review the script
# before you use it, since it moves your photos around. I use the
# script to separate my raw and jpg files when i fetch them from
# my camera.
#
# Send patches, bugs, improvements or feedback http://hackr.se/joellarsson
#
#############################################################################
#   Settings
#############################################################################

# where to move/copy files
RAWDIR="raw pics"
JPGDIR="jpg"

JPGMASK="*.JPG"
RAWMASK="*.NEF"

# copy or move files?
COPYMOVE=mv


#############################################################################
#   SCRIPT START
#############################################################################

RAWDIR=$PWD/${RAWDIR}
JPGDIR=$PWD/${JPGDIR}

# debug
set +x

# exit on errors, unset variables
#set -o errexit
set -o nounset

# exit on these signals
SIGNALS="INT TERM EXIT HUP"


Util__die() {
    printf "\n"
    echo >&2 " ! $@"
    trap exit INT TERM EXIT
    exit 1
}

Util__killed() {
    printf "\n"
    echo >&2 " ! Caught a signal($SIGNALS)"
    Util__die "aborting"
}

Util__continue() {
    [ "$#" -eq 0 ] || Util__die "No argument required for continue(), $# provided"
    printf " (y/n): "
    read INPUT
    IN=$(echo "${INPUT}" | awk '{print tolower($0)}')
    if [ "${IN}" != "yes" ] && [ "${IN}" != "y" ]; then
        Util__die "aborting"
    fi
    printf "\n"
}

Main__create_dir() {
    printf "\n"
    [ "$#" -eq 1 ] || Util__die "1 argument required for create_dir(), $# provided"

    DIR=${1}

    if [ -d "${DIR}" ]; then
        # directory or link exist
        if [ -L "${DIR}" ]; then
            # is a symlink!
            Util__die "${DIR} is a symbolic link, abort"
        else
            # it's a directory!
            echo " * ${DIR} already exist, continue"
        fi
    else
        # directory does not exist, create it
        mkdir -p "${DIR}" || Util__die "Error creating directory"
        echo " * ${DIR} created"
    fi
    return 0
}

Main__move_files() {
    [ "$#" -eq 2 ] || Util__die "2 arguments required for move_files(), $# provided"

    MASK=${1}
    DIR=${2}

    FILES=$(ls -l ${MASK} 2>/dev/null)
    if [ $? -ne 0 ]; then
            echo " * found 0 files matching ${MASK}, continue"
            return 0
    fi

    AMOUNT=$(ls -l ${MASK} | wc -l)
    SIZE=$(find ./ -maxdepth 1 -type f -name "${MASK}" -exec du -shc {} + | tail -1 | awk '{print $1}')

    printf "\n"
    echo " * found ${AMOUNT} files ($SIZE) matching ${MASK} in ${PWD}"
    printf "\n"
    printf " > ${COPYMOVE} ${MASK} (${AMOUNT} files) to ${DIR}"
    Util__continue
    ${COPYMOVE} ${MASK} "${DIR}" || Util__die "Error when trying to ${COPYMOVE} files"

    return 0
}

Main__info_after() {
    [ "$#" -eq 2 ] || Util__die "2 arguments required for info_after(), $# provided"

    MASK=${1}
    DIR=${2}

    FILES=$(ls -l "${DIR}"/${MASK} 2>/dev/null)
    if [ $? -ne 0 ]; then
            echo " * found 0 ${MASK} files in ${DIR}"
            return 0
    fi

    AMOUNT=$(ls -l "${DIR}"/${MASK} | wc -l)
    SIZE=$(find "${DIR}" -maxdepth 1 -type f -name "${MASK}" -exec du -shc {} + | tail -1 | awk '{print $1}')

    echo " * found ${AMOUNT} ${MASK} files, $SIZE, in ${DIR}"

    return 0
}


Main__info_before() {
    echo "--------------------------------------------------------------------"
    echo " Separate raw/jpg files into sub directories                        "
    echo "                                                                    "
    echo " - currently in directory: $PWD                                     "
    echo " - create dir: ${RAWDIR}                                            "
    echo " - create dir: ${JPGDIR}                                            "
    echo " - $COPYMOVE files: ${RAWMASK} to ${RAWDIR}                         "
    echo " - $COPYMOVE files: ${JPGMASK} to ${JPGDIR}                         "
    echo "--------------------------------------------------------------------"
    printf " > continue?"
    Util__continue
}

trap Util__killed $SIGNALS

Main__main() {
        Main__info_before
        Main__create_dir "${RAWDIR}"
        Main__create_dir "${JPGDIR}"
        Main__move_files "${JPGMASK}" "${JPGDIR}"
        Main__move_files "${RAWMASK}" "${RAWDIR}"
        Main__info_after "${JPGMASK}" "${JPGDIR}"
        Main__info_after "${RAWMASK}" "${RAWDIR}"
}

Main__main

trap exit INT TERM EXIT
