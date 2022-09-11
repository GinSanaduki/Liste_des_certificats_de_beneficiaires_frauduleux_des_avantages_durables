#!/usr/bin/gawk -f
# 09_CheckExitStatus.awk
# @include "AWKScript/09_CheckExitStatus"

function CheckExitStatus(Local_ExitStatusBit_CES, Local_HTTPHeader_Component_CES, Local_mat_CES, Local_ExitStatus_CES){
	Local_ExitStatusBit_CES = 0;
	delete ExitStatuses;
	
	for(i in HTTPHeaderArrays){
		Local_HTTPHeader_Component_CES = HTTPHeaderArrays[i];
		Local_mat_CES = match(Local_HTTPHeader_Component_CES, /^HTTP\//);
		
		if(Local_mat_CES > 0){
			split(Local_HTTPHeader_Component_CES, ExitStatuses);
			Local_ExitStatus_CES = ExitStatuses[2] + 0;
			delete ExitStatuses;
			
			if(Local_ExitStatus_CES == 200){
				Local_ExitStatusBit_CES = 1;
				break;
			}
		}
	}
	
	if(Local_ExitStatusBit_CES != 1){
		print "The exit code in the HTTP header could not be found." > "/dev/stderr";
		return 99;
	}
	
	return 0;
}

