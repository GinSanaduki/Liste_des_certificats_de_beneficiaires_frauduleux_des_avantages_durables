#!/usr/bin/gawk -f
# 03_Get_DownLoadMainPageName.awk
# @include "AWKScript/03_Get_DownLoadMainPageName.awk"

function Get_DownLoadMainPageName(Local_Text_GDLMPN){
	split(MainURL, MainURLArrays, "/");
	Local_Text_GDLMPN = MainURLArrays[length(MainURLArrays)];
	delete MainURLArrays;
	gsub(".html", "", Local_Text_GDLMPN);
	return Local_Text_GDLMPN"_"STRFTIME_YYYYMMDD".html";
}

