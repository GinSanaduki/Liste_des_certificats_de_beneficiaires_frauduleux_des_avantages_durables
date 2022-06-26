#!/bin/sh
# 05_HashCheck_StoredHTML.sh
# sh ShellScript/05_HashCheck_StoredHTML.sh

test -d ./StoredHTML
test $? -ne 0 && echo "ERROR : StoredHTML IS NOT EXIST." && exit 99

find ./StoredHTML | \
grep -E -v '^\.\/StoredHTML$' | \
awk 'BEGIN{print ":";}{print "sha512sum \042"$0"\042";}' | \
sh | \
sort | \
tac | \
cat > ./HashList_StoredHTML.txt

gawk -f AWKScript/57_Detection_de_fichiers_en_double_a_supprimer.awk HashList_StoredHTML.txt | \
cat > ./DeleteTarget_StoredHTML.txt

exit 0

