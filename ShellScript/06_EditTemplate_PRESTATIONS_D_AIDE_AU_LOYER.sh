#!/bin/sh
# 06_EditTemplate_PRESTATIONS_D_AIDE_AU_LOYER.sh
# sh ShellScript/06_EditTemplate_PRESTATIONS_D_AIDE_AU_LOYER.sh StoredHTML/個人事業主_持続化給付金不正受給者認定一覧_20220615.txt StoredHTML/個人事業主_持続化給付金不正受給者認定一覧_20220615_Edited.tsv

test $# != 2 && echo "ERROR : Insufficient arguments." && exit 99;
test -z $1 && echo "ERROR : The first argument is the empty string." && exit 99;
test -z $2 && echo "ERROR : The second argument is the empty string." && exit 99;

cat "$1" | \
fgrep -v -e '個人事業主）' -e '不正受給認定日' -e '不正受給認定者' -e '所在地' -e '不正受給金額' -e '（単位：円）' -e '不正の概要' -e '（法人' -e '代表者氏名' | \
gawk -f AWKScript/42_Exclure_les_lignes_vides.awk | \
fgrep -v -e '最終更新日: ' -e '※' | \
sed -e '$d' | \
gawk -f AWKScript/43_Supprimer_le_numero_de_page_dans_le_pied_de_page.awk | \
gawk -f AWKScript/51_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER.awk | \
sort -k 1n,1 -t ',' | \
awk '{mat = match($0, /,/); print substr($0, mat + 1);}' | \
gawk -f AWKScript/52_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Deux.awk | \
sort -k 1n,1 -t ',' | \
awk '{mat = match($0, /,/); print substr($0, mat + 1);}' | \
awk '/./{print;}' | \
awk '{if(NR%5)ORS="\t";else ORS="\n";print}' | \
gawk -f AWKScript/46_EditComponent.awk | \
cat > "$2"

exit 0

