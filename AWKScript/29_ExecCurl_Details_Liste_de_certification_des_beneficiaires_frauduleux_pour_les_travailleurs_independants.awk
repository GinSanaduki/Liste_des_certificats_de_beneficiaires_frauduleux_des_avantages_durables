#!/usr/bin/gawk -f
# 29_ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk
# @include "AWKScript/29_ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"

function ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECD_LDCDBFPLTI, Local_CurlCommand_ECD_LDCDBFPLTI, Local_RetCode_ECD_LDCDBFPLTI){
	Local_CurlCommand_ECD_LDCDBFPLTI = "curl --retry 3 -s -H \047"Setter_UserAgent()"\047 "Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECD_LDCDBFPLTI " > StoredHTML/"DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants;
	print Local_CurlCommand_ECD_LDCDBFPLTI > "/dev/stderr";
	Mkdir(MkdirCmd_StoredHTML);
	LongSleep();
	Local_RetCode_ECD_LDCDBFPLTI = system(Local_CurlCommand_ECD_LDCDBFPLTI);
	close(Local_CurlCommand_ECD_LDCDBFPLTI);
	
	if(Local_RetCode_ECD_LDCDBFPLTI != 0){
		print "ERROR : "Local_CurlCommand_ECD_LDCDBFPLTI > "/dev/stderr";
		exit 99;
	}
}

