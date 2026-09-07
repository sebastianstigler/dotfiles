#!/bin/bash
# vim: ft=sh:tw=80:ts=4:sta:sw=4:si:ci
#************************************************************** SHELL SCRIPT ***
#   NAME
#       <+FILE NAME+><+NOTE+>
#
#   DESCRIPTION
#       <+?DESCRIPTION?+>
#
#   FIRST RELEASE
#       <+DATE+>  <+AUTHOR+>		<+EMAIL+>
#
#   COPYRIGHT (C) <+call:strftime('%Y')+>
#*******************************************************************************
#** debug
#
#    set -xv
#    exec 2>/tmp/<+FILE NAME+>.$$.log
#
#*******************************************************************************
#** function usage
#
#    usage() {
#        echo "USAGE: `basename $0` [-h|--help] [{-b|--b-long arg} arg]"
#        exit 1
#    }
#
#*******************************************************************************
#** declaration
     <+CURSOR+>
#*******************************************************************************
#** usage verification
#
#    TEMP=$(getopt -o hb: --long b-long:,help \
#           -n '<+FILE NAME+>' -- "$@")
#
#    if [ ${?} != 0 ] ; then usage; fi
#
#    eval set -- "${TEMP}"
#
#    while true ; do
#        case "${1}" in
#            -b|--b-long) echo "Option b, argument '${2}'" ; shift 2 ;;
#            -h|--help)   usage                            ; shift   ;;
#            --)          shift                            ; break   ;;
#             *)          echo "Internal error!"           ; exit 1  ;;
#        esac
#    done
#
#*******************************************************************************
#** initiation

#*******************************************************************************
#** start main program
    <+MAIN+>
#*******************************************************************************
#** clean up
#
#    rm -f /tmp/<+FILE NAME+>.$$.log
#
#*********************************************************************** END ***
