#!/usr/bin/gawk -f
# 47_ExecuteEditPipe.awk
# @include "AWKScript/47_ExecuteEditPipe.awk"

function ExecuteEditPipe(Local_RetCode_EEP){
	Local_RetCode_EEP = system(EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
	close(EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
	
	if(Local_RetCode_EEP != 0){
		print "ShellScript/03_EditTemplate.sh is terminate abnormally. Local_RetCode_EEP : "Local_RetCode_EEP > "/dev/stderr";
		exit 99;
	}
	
	Local_RetCode_EEP = system(EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
	close(EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
	
	if(Local_RetCode_EEP != 0){
		print "ShellScript/03_EditTemplate.sh is terminate abnormally. Local_RetCode_EEP : "Local_RetCode_EEP > "/dev/stderr";
		exit 99;
	}
}

# ---------------------------------------------------------------------------------------------------------------------

function ExecuteEditPipe_PRESTATIONS_D_AIDE_AU_LOYER(Local_RetCode_EEP){
	Local_RetCode_EEP = system(EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
	close(EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
	
	if(Local_RetCode_EEP != 0){
		print "ShellScript/06_EditTemplate_PRESTATIONS_D_AIDE_AU_LOYER.sh is terminate abnormally. Local_RetCode_EEP : "Local_RetCode_EEP > "/dev/stderr";
		exit 99;
	}
	
	Local_RetCode_EEP = system(EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
	close(EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
	
	if(Local_RetCode_EEP != 0){
		print "ShellScript/08_EditTemplate_PRESTATIONS_D_AIDE_AU_LOYER_Les_Enterprises.sh is terminate abnormally. Local_RetCode_EEP : "Local_RetCode_EEP > "/dev/stderr";
		exit 99;
	}
}

