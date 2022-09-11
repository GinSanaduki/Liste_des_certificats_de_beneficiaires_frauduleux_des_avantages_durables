#!/usr/bin/gawk -f
# 31_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk
# @include "AWKScript/31_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"

function SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_CODES_DE_HACHAGE(Args_HashCode_SRSLS_LDCDBFPLTI_CDH, Local_GawkCommand_OutputFileName_SRSLS_LDCDBFPLTI_CDH, Local_GawkCommand_SRSLS_LDCDBFPLTI_CDH, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH){
	Local_GawkCommand_OutputFileName_SRSLS_LDCDBFPLTI_CDH = "TempSQLScripts/04_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_CODES_DE_HACHAGE_"STRFTIME_YYYYMMDD_HHMMSS".sql";
	# 改行コードがなぜかCR+LFだったため
	gsub("\r", "", Args_HashCode_SRSLS_LDCDBFPLTI_CDH);
	print "Args_HashCode_SRSLS_LDCDBFPLTI_CDH : "Args_HashCode_SRSLS_LDCDBFPLTI_CDH;
	Local_GawkCommand_SRSLS_LDCDBFPLTI_CDH = "gawk -f AWKScript/21_Gsub_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_CODES_DE_HACHAGE.awk -v CODE_D_IDENTIFICATION=\042Liste de certification des beneficiaires frauduleux pour les travailleurs independants\042 -v CODES_DE_HACHAGE=" Args_HashCode_SRSLS_LDCDBFPLTI_CDH" SQLScript/04_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_CODES_DE_HACHAGE.sql > "Local_GawkCommand_OutputFileName_SRSLS_LDCDBFPLTI_CDH;
	print Local_GawkCommand_SRSLS_LDCDBFPLTI_CDH > "/dev/stderr";
	ExecuteGawk(Local_GawkCommand_SRSLS_LDCDBFPLTI_CDH);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH = SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE Local_GawkCommand_OutputFileName_SRSLS_LDCDBFPLTI_CDH;
	print Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH > "/dev/stderr";
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH = 0;
	
	while(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH | getline Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH){
		break;
	}
	
	close(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH = Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH + 0;
	return Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH;
}

# ----------------------------------------------------------------------------------------------------------------------

function SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_CODES_DE_HACHAGE_PRESTATIONS_D_AIDE_AU_LOYER(Args_HashCode_SRSLS_LDCDBFPLTI_CDH, Local_GawkCommand_OutputFileName_SRSLS_LDCDBFPLTI_CDH, Local_GawkCommand_SRSLS_LDCDBFPLTI_CDH, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH){
	Local_GawkCommand_OutputFileName_SRSLS_LDCDBFPLTI_CDH = "TempSQLScripts/04_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_CODES_DE_HACHAGE_"STRFTIME_YYYYMMDD_HHMMSS".sql";
	# 改行コードがなぜかCR+LFだったため
	gsub("\r", "", Args_HashCode_SRSLS_LDCDBFPLTI_CDH);
	print "Args_HashCode_SRSLS_LDCDBFPLTI_CDH : "Args_HashCode_SRSLS_LDCDBFPLTI_CDH;
	Local_GawkCommand_SRSLS_LDCDBFPLTI_CDH = "gawk -f AWKScript/21_Gsub_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_CODES_DE_HACHAGE.awk -v CODE_D_IDENTIFICATION=\042Liste de certification des beneficiaires frauduleux pour les travailleurs independants\042 -v CODES_DE_HACHAGE=" Args_HashCode_SRSLS_LDCDBFPLTI_CDH" SQLScript/10_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_CODES_DE_HACHAGE_PRESTATIONS_D_AIDE_AU_LOYER.sql > "Local_GawkCommand_OutputFileName_SRSLS_LDCDBFPLTI_CDH;
	print Local_GawkCommand_SRSLS_LDCDBFPLTI_CDH > "/dev/stderr";
	ExecuteGawk(Local_GawkCommand_SRSLS_LDCDBFPLTI_CDH);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH = SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE Local_GawkCommand_OutputFileName_SRSLS_LDCDBFPLTI_CDH;
	print Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH > "/dev/stderr";
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH = 0;
	
	while(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH | getline Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH){
		break;
	}
	
	close(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLS_LDCDBFPLTI_CDH);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH = Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH + 0;
	return Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLS_LDCDBFPLTI_CDH;
}

