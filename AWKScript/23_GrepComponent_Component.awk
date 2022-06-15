#!/usr/bin/gawk -f
# 23_GrepComponent_Component.awk
# @include "AWKScript/23_GrepComponent_Component.awk"

function GrepComponent_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Args_DownLoadMainPageName_GCK, RetCode_GCK, Local_ExecCmd_GCK, Local_esc_GCK, Local_ComponentURL_GCK){
	if(Args_DownLoadMainPageName_GCK == ""){
		print "Args_DownLoadMainPageName_GCK IS EMPTY." > "/dev/stderr";
		exit 99;
	}
	
	Local_ExecCmd_GCK = GrepCmd_Component_Kojin" \047StoredHTML/"Args_DownLoadMainPageName_GCK"\047";
	while(Local_ExecCmd_GCK | getline Local_esc_GCK){
		break;
	}
	close(Local_ExecCmd_GCK);
	return ComponentEdit(Local_esc_GCK);
}

function GrepComponent_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Args_DownLoadMainPageName_GCH, RetCode_GCH, Local_ExecCmd_GCH, Local_esc_GCH, Local_ComponentURL_GCH){
	if(Args_DownLoadMainPageName_GCH == ""){
		print "Args_DownLoadMainPageName_GCH IS EMPTY." > "/dev/stderr";
		exit 99;
	}
	
	Local_ExecCmd_GCH = GrepCmd_Component_Houjin" \047StoredHTML/"Args_DownLoadMainPageName_GCH"\047";
	while(Local_ExecCmd_GCH | getline Local_esc_GCH){
		break;
	}
	close(Local_ExecCmd_GCH);
	return ComponentEdit(Local_esc_GCH);
}

function ComponentEdit(Args_TargetText_CE){
	if(Args_TargetText_CE == ""){
		print "Args_TargetText_CE IS EMPTY." > "/dev/stderr";
		exit 99;
	}
	gsub(" ", "", Args_TargetText_CE);
	gsub(/>.*/, "", Args_TargetText_CE);
	gsub("<ahref=", "", Args_TargetText_CE);
	gsub("\042", "", Args_TargetText_CE);
	return ComponentURL_Main Args_TargetText_CE;
}

