#!/usr/bin/gawk -f
# 50_ExecuteRegist.awk
# @include "AWKScript/50_ExecuteRegist.awk"

function ExecuteRegist(Local_RetCode_ER){
	Local_RetCode_ER = system(RegistCmd);
	close(RegistCmd);
	
	if(Local_RetCode_ER != 0){
		print "ShellScript/04_Regist.sh is terminate abnormally. Local_RetCode_ER : "Local_RetCode_ER > "/dev/stderr";
		exit 99;
	}
	
}

# ------------------------------------------------------------------

function ExecuteRegist_PRESTATIONS_D_AIDE_AU_LOYER(Local_RetCode_ER){
	Local_RetCode_ER = system(RegistCmd);
	close(RegistCmd);
	
	if(Local_RetCode_ER != 0){
		print "ShellScript/07_Regist_PRESTATIONS_D_AIDE_AU_LOYER.sh is terminate abnormally. Local_RetCode_ER : "Local_RetCode_ER > "/dev/stderr";
		exit 99;
	}
	
}

