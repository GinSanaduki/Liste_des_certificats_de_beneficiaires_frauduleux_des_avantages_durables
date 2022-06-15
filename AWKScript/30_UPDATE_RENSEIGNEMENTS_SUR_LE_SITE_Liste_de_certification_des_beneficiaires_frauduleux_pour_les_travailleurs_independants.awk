#!/usr/bin/gawk -f
# 30_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk
# @include "AWKScript/30_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"

function UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Args_Etags_URSLS_LDCDBFPLTI, Args_HashCode_URSLS_LDCDBFPLTI, Local_GawkCommand_OutputFileName_URSLS_LDCDBFPLTI, Local_GawkCommand_URSLS_LDCDBFPLTI, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLS_LDCDBFPLTI){
	if(Args_Etags_URSLS_LDCDBFPLTI == ""){
		Args_Etags_URSLS_LDCDBFPLTI = "FACTICE";
	}
	
	if(Args_HashCode_URSLS_LDCDBFPLTI == ""){
		Args_HashCode_URSLS_LDCDBFPLTI = "FACTICE";
	}
	
	# 改行コードがなぜかCR+LFだったため
	gsub("\r", "", Args_Etags_URSLS_LDCDBFPLTI);
	
	# 改行コードがなぜかCR+LFだったため
	gsub("\r", "", Args_HashCode_URSLS_LDCDBFPLTI);
	
	Local_GawkCommand_OutputFileName_URSLS_LDCDBFPLTI = "TempSQLScripts/07_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_"STRFTIME_YYYYMMDD_HHMMSS".sql";
	Local_GawkCommand_URSLS_LDCDBFPLTI = "gawk -f AWKScript/11_Gsub_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk -v CODE_D_IDENTIFICATION=\042Liste de certification des beneficiaires frauduleux pour les travailleurs independants\042 -v BALISE_ENTITE_ETAG_HTTP=" Args_Etags_URSLS_LDCDBFPLTI" -v CODES_DE_HACHAGE="Args_HashCode_URSLS_LDCDBFPLTI" SQLScript/03_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.sql > "Local_GawkCommand_OutputFileName_URSLS_LDCDBFPLTI;
	print Local_GawkCommand_URSLS_LDCDBFPLTI > "/dev/stderr";
	ExecuteGawk(Local_GawkCommand_URSLS_LDCDBFPLTI);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLS_LDCDBFPLTI = SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE Local_GawkCommand_OutputFileName_URSLS_LDCDBFPLTI;
	print Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLS_LDCDBFPLTI > "/dev/stderr";
	system(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLS_LDCDBFPLTI);
	close(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLS_LDCDBFPLTI);
}

