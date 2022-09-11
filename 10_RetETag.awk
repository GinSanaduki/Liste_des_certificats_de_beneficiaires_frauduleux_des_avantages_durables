#!/usr/bin/gawk -f
# 10_RetETag.awk
# @include "AWKScript/10_RetETag.awk"

function RetETag(Local_mat_RET, Local_HTTPHeader_Component_RET, Local_Etags_RET){
	Local_mat_RET = 0;
	Local_Etags_RET = "";
	
	for(i in HTTPHeaderArrays){
		Local_HTTPHeader_Component_RET = HTTPHeaderArrays[i];
		Local_mat_RET = match(Local_HTTPHeader_Component_RET, /^ETag:/);
		
		if(Local_mat_RET > 0){
			Local_Etags_RET = Local_HTTPHeader_Component_RET;
			gsub("ETag: \042", "", Local_Etags_RET);
			gsub("\042", "", Local_Etags_RET);
			break;
		}
	}
	
	if(Local_Etags_RET == ""){
		Local_Etags_RET = "FACTICE";
	}
	
	return Local_Etags_RET;
}

