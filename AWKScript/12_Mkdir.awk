#!/usr/bin/gawk -f
# 12_Mkdir.awk
# @include "AWKScript/12_Mkdir.awk"

function Mkdir(Args_Dir_MD){
	if(Args_Dir_MD == ""){
		return;
	}
	system(Args_Dir_MD);
	close(Args_Dir_MD);
}

