#!/usr/bin/gawk -f
# 37_ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk
# @include "AWKScript/37_ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"

function ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_ECD_LDCDBFPLE, Local_CurlCommand_ECD_LDCDBFPLE, Local_RetCode_ECD_LDCDBFPLE){
	Local_CurlCommand_ECD_LDCDBFPLE = "curl --retry 3 -s -H \047"Setter_UserAgent()"\047 "Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_ECD_LDCDBFPLE " > StoredHTML/"DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises;
	print Local_CurlCommand_ECD_LDCDBFPLE > "/dev/stderr";
	Mkdir(MkdirCmd_StoredHTML);
	LongSleep();
	Local_RetCode_ECD_LDCDBFPLE = system(Local_CurlCommand_ECD_LDCDBFPLE);
	close(Local_CurlCommand_ECD_LDCDBFPLE);
	
	if(Local_RetCode_ECD_LDCDBFPLE != 0){
		print "ERROR : "Local_CurlCommand_ECD_LDCDBFPLE > "/dev/stderr";
		exit 99;
	}
}

