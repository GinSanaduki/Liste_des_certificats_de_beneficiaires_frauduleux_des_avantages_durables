#!/usr/bin/gawk -f
# 40_ExecutePDFToText.awk
# @include "AWKScript/40_ExecutePDFToText.awk"

function ExecutePDFToText(Local_RetCode_EPDFTT){
	Local_RetCode_EPDFTT = system(PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
	close(PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
	
	if(Local_RetCode_EPDFTT != 0){
		print "PDFToText is terminate abnormally. Local_RetCode_EPDFTT : "Local_RetCode_EPDFTT", PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants : "PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants > "/dev/stderr";
		exit 99;
	}
	
	Local_RetCode_EPDFTT = system(PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
	close(PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
	
	if(Local_RetCode_EPDFTT != 0){
		print "PDFToText is terminate abnormally. Local_RetCode_EPDFTT : "Local_RetCode_EPDFTT", PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises : "PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises > "/dev/stderr";
		exit 99;
	}
}

