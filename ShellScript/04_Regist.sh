#!/bin/sh
# 04_Regist.sh
# sh ShellScript/04_Regist.sh "StoredHTML/個人事業主_持続化給付金不正受給者認定一覧_20220615_Edited.tsv" "TempSQLScripts/08_個人事業主_持続化給付金不正受給者認定一覧_20220615_Regist.sql" "StoredHTML/法人_持続化給付金不正受給者認定一覧_20220615_Edited.tsv" "TempSQLScripts/09_法人_持続化給付金不正受給者認定一覧_20220615_Regist.sql"

test $# != 4 && echo "ERROR : Insufficient arguments." && exit 99;
test -z $1 && echo "ERROR : The first argument is the empty string." && exit 99;
test -z $2 && echo "ERROR : The second argument is the empty string." && exit 99;
test -z $3 && echo "ERROR : The third argument is the empty string." && exit 99;
test -z $4 && echo "ERROR : The fourth argument is the empty string." && exit 99;

gawk -f AWKScript/48_INSERT_LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS.awk $1 > $2
RetCode=$?

test $RetCode -ne 0 && echo "ERROR : AWKScript/48_INSERT_LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS.awk is terminated abnormally." && exit 99;

sqlite3 SQLITE3/RENSEIGNEMENTS_SUR_LE_SITE.sqlite3 < $2
RetCode=$?

test $RetCode -ne 0 && echo "ERROR : SQLITE3/LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS.sqlite3 is terminated abnormally." && exit 99;

gawk -f AWKScript/49_INSERT_LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_ENTREPRISES.awk $3 > $4
RetCode=$?

test $RetCode -ne 0 && echo "ERROR : AWKScript/49_INSERT_LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_ENTREPRISES.awk is terminated abnormally." && exit 99;

sqlite3 SQLITE3/RENSEIGNEMENTS_SUR_LE_SITE.sqlite3 < $4
RetCode=$?

test $RetCode -ne 0 && echo "ERROR : SQLITE3/LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_ENTREPRISES.sqlite3 is terminated abnormally." && exit 99;

exit 0

