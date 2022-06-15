#!/usr/bin/gawk -f
# 01_ExecWhich.awk
# @include "AWKScript/01_ExecWhich.awk"

function ExecWhich(Args_CommandName, Local_Cmd_EW, Local_RetCode_EW){
	if(Args_CommandName == ""){
		print "Args_CommandName Not Found." > "/dev/stderr";
		exit 99;
	}
	
	Local_Cmd_EW = "which "Args_CommandName" > /dev/null 2>&1";
	Local_RetCode_EW = system(Local_Cmd_EW);
	close(Local_Cmd_EW);
	
	if(Local_RetCode_EW != 0){
		print Args_CommandName" is not installed." > "/dev/stderr";
		exit 99;
	}
	
	print "I have confirmed that the "toupper(Args_CommandName)" command is installed." > "/dev/stderr";
}

