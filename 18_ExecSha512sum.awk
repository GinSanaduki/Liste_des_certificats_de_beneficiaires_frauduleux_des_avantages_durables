#!/usr/bin/gawk -f
# 18_ExecSha512sum.awk
# @include "AWKScript/18_ExecSha512sum.awk"

function ExecSha512sum(Args_FileName_ESS, Local_Sha512SumCommand_ESS, Local_HashCode_ESS){
	if(Args_FileName_ESS == ""){
		return "";
	}
	
	Local_Sha512SumCommand_ESS = "sha512sum "Args_FileName_ESS;
	
	while(Local_Sha512SumCommand_ESS | getline Local_HashCode_ESS){
		break;
	}
	
	close(Local_Sha512SumCommand_ESS);
	return substr(Local_HashCode_ESS, 1, 64);
}

