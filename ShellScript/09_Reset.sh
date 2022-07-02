#!/bin/sh
# 09_Reset.sh
# sh ShellScript/09_Reset.sh

sqlite3 SQLITE3/RENSEIGNEMENTS_SUR_LE_SITE.sqlite3 < SQLScript/13_RESET.sql
rm -f TempSQLScripts/*.* > /dev/null 2>&1
exit 0

