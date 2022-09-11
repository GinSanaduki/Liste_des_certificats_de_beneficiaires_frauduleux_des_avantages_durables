#!/usr/bin/gawk -f
# 33_RetHashCode.awk
# @include "AWKScript/33_RetHashCode.awk"

function RetHashCode(Args_DownLoadMainPageName_RHC, Local_HashCode_RHC){
	Local_HashCode_RHC = ExecSha512sum("StoredHTML/"Args_DownLoadMainPageName_RHC);
	
	if(Local_HashCode_RHC == ""){
		Local_HashCode_RHC = "FACTICE";
	}
	
	print "Local_HashCode_RHC : " Local_HashCode_RHC > "/dev/stderr";
	return Local_HashCode_RHC;
}

