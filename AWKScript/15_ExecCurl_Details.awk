#!/usr/bin/gawk -f
# 15_ExecCurl_Details.awk
# @include "AWKScript/15_ExecCurl_Details.awk"

function ExecCurl_Details(Args_DownLoadMainPageName_ECD, Local_CurlCommand_ECD, Local_RetCode_ECD){
	Local_CurlCommand_ECD = "curl --retry 3 -s -H \047"Setter_UserAgent()"\047 "MainURL " > StoredHTML/"Args_DownLoadMainPageName_ECD;
	print Local_CurlCommand_ECD > "/dev/stderr";
	Mkdir(MkdirCmd_StoredHTML);
	LongSleep();
	Local_RetCode_ECD = system(Local_CurlCommand_ECD);
	close(Local_CurlCommand_ECD);
	
	if(Local_RetCode_ECD != 0){
		print "ERROR : "Local_CurlCommand_ECD > "/dev/stderr";
		exit 99;
	}
}

