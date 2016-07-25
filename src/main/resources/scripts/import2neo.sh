#!/bin/bash - 
#===============================================================================
#
#          FILE: import2neo.sh
# 
#         USAGE: ./import2neo.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Sebastian Schüpbach (), sebastian.schuepbach@unibas.ch
#  ORGANIZATION: Project Swissbib
#       CREATED: 02.07.2016 14:25
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

rela=($(ls | grep "-"))
nodes=($(ls | grep -v "-"))

neo4j-import --into gnd.db --id-type string --nodes $(echo nodes) --relationships $(echo rela)
