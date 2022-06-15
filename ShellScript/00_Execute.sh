#!/bin/sh
# 00_Execute.sh
# sh ShellScript/00_Execute.sh

gawk -f AWKScript/00_ControleurPrincipal.awk
RetCode=$?

exit $RetCode

