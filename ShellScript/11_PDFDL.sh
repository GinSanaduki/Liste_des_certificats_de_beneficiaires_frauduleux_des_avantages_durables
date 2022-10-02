#!/bin/sh
# 11_PDFDL.sh
# sh ShellScript/11_PDFDL.sh

mkdir 'PDFDL' > /dev/null 2>&1
dates=`date '+%Y%m%d'`
jfn_dl="PDFDL/jizokuka_fusei_nintei_"$dates".html"
wget https://www.meti.go.jp/covid-19/jizokuka_fusei_nintei.html -O $jfn_dl

sleep 10

grep -F '/covid-19/pdf/' $jfn_dl | \
awk '{gsub(" ", ""); print;}' | \
awk '{gsub(/>.*/, ""); print;}' | \
gawk '{gsub("<ahref=", ""); gsub("\042", ""); split($0, arrays, "/"); fname = arrays[length(arrays)]; gsub("?", "_"strftime("%Y%m%d",systime()), fname); fname = fname".pdf"; print "wget https://www.meti.go.jp"$0" -O PDFDL/"fname; print "sleep 10";}' | \
sh

jfn_dl="PDFDL/yachin_kyufu_fusei_nintei_"$dates".html"
wget https://www.meti.go.jp/covid-19/yachin-kyufu/fusei_nintei.html -O $jfn_dl

sleep 10

grep -F 'yachin-kyufu/dl/' $jfn_dl | \
awk '{gsub(" ", ""); print;}' | \
awk '{gsub(/>.*/, ""); print;}' | \
gawk '{gsub("<ahref=", ""); gsub("\042", ""); split($0, arrays, "/"); fname = arrays[length(arrays)]; gsub("?", "_"strftime("%Y%m%d",systime()), fname); fname = fname".pdf"; print "wget https://www.meti.go.jp"$0" -O PDFDL/"fname; print "sleep 10";}' | \
sh

exit 0
