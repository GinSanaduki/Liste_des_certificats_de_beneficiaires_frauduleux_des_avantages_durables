#!/bin/sh
# 09_Reset.sh
# sh ShellScript/09_Reset.sh

sqlite3 SQLITE3/RENSEIGNEMENTS_SUR_LE_SITE.sqlite3 < SQLScript/13_RESET.sql
rm -f TempSQLScripts/*.* > /dev/null 2>&1
Date=`date '+%Y%m%d'`
ls -1 "./StoredHTML/" | \
grep -F $Date | \
awk 'BEGIN{print ":";}{print "rm -f \047"$0"\047 > /dev/null 2>&1";}' | \
sh
exit 0

