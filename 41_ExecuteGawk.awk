#!/usr/bin/gawk -f
# 41_ExecuteGawk.awk
# @include "AWKScript/41_ExecuteGawk.awk"

function ExecuteGawk(Args_GawkCommand_EG, Local_RetCode_EG){
	if(Args_GawkCommand_EG == ""){
		print "Args_GawkCommand_EG IS EMPTY." > "/dev/stderr";
		exit 99;
	}
	
	Local_RetCode_EG = system(Args_GawkCommand_EG);
	close(Args_GawkCommand_EG);
	
	if(Local_RetCode_EG != 0){
		print "GawkCommand is terminate abnormally. Local_RetCode_EG : "Local_RetCode_EG", Args_GawkCommand_EG : "Args_GawkCommand_EG > "/dev/stderr";
		exit 99;
	}
}

