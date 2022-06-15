#!/usr/bin/gawk -f
# 46_EditComponent.awk
# gawk -f AWKScript/46_EditComponent.awk

BEGIN{
	reiwa_gan = 2019;
}

{
	split($0, arrays, "\t");
	Cols2 = arrays[2];
	gsub("令和", "", Cols2);
	gsub("年", "/", Cols2);
	gsub("月", "/", Cols2);
	gsub("日", "", Cols2);
	split(Cols2, Gengous, "/");
	# https://qiita.com/baikichiz/items/7a8398257114f9e666a7
	# SQLiteで日時を扱う - Qiita
	Converted_YYYYMMDD = Gengou_Converted(Gengous[1]) "-" Zero_Padding2(Gengous[2]) "-" Zero_Padding2(Gengous[3]) " 00:00:00";
	delete Gengous;
	split(arrays[5], arrays_Amounts);
	Amount = arrays_Amounts[1];
	gsub(",", "", Amount);
	Issue = arrays_Amounts[2];
	delete arrays_Amounts;
	if(arrays[3] == "-"){
		Cols3 = "";
	} else {
		Cols3 = arrays[3];
	}
	if(arrays[4] == "-"){
		Cols4 = "";
	} else {
		Cols4 = arrays[4];
	}
	delete arrays;
	print $1"\t"$2"\t"Converted_YYYYMMDD"\t"Cols3"\t"Cols4"\t"Amount"\t"Issue;
}

function Gengou_Converted(Args_Gengou){
	# 元年は0
	Args_Gengou = Args_Gengou + 0;
	if(Args_Gengou == 0){
		return reiwa_gan;
	}
	return reiwa_gan -1 + Args_Gengou;
}

function Zero_Padding2(Args_Target){
	if(length(Args_Target) == 0){
		return "00";
	} else if(length(Args_Target) == 1){
		return "0"Args_Target;
	} else {
		return Args_Target;
	}
}

