#!/usr/bin/gawk -f
# 22_ExistCheck_Component.awk
# @include "AWKScript/22_ExistCheck_Component.awk"

function ExistCheck_Component(Args_DownLoadMainPageName_ECC, RetCode_ECC, Local_ExecCmd_ECC){
	if(Args_DownLoadMainPageName_ECC == ""){
		print "Args_DownLoadMainPageName_ECC IS EMPTY." > "/dev/stderr";
		exit 99;
	}
	
	Local_ExecCmd_ECC = GrepCmd_ExistCheck_Kojin" \047StoredHTML/"Args_DownLoadMainPageName_ECC"\047";
	RetCode_ECC = system(Local_ExecCmd_ECC);
	close(Local_ExecCmd_ECC);
	
	if(RetCode_ECC != "0"){
		print "個人事業主　持続化給付金不正受給者認定一覧が存在しません。" > "/dev/stderr";
		exit 99;
	}
	
	Local_ExecCmd_ECC = GrepCmd_ExistCheck_Houjin" \047StoredHTML/"Args_DownLoadMainPageName_ECC"\047";
	RetCode_ECC = system(Local_ExecCmd_ECC);
	close(Local_ExecCmd_ECC);
	
	if(RetCode_ECC != "0"){
		print "法人　持続化給付金不正受給者認定一覧が存在しません。" > "/dev/stderr";
		exit 99;
	}
}

