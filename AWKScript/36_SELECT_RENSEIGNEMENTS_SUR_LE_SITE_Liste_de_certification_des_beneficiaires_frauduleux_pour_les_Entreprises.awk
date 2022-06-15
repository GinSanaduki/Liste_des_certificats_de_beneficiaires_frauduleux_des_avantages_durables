#!/usr/bin/gawk -f
# 36_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk
# @include "AWKScript/36_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"

function SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Args_Etags_SRSLSPDA, Local_GawkCommand_OutputFileName_SRSLSPDA, Local_GawkCommand_SRSLSPDA, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLSPDA, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLSPDA){
	Local_GawkCommand_OutputFileName_SRSLSPDA = "TempSQLScripts/05_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_"STRFTIME_YYYYMMDD_HHMMSS".sql";
	# ���s�R�[�h���Ȃ���CR+LF����������
	gsub("\r", "", Args_Etags_SRSLSPDA);
	Local_GawkCommand_SRSLSPDA = "gawk -f AWKScript/06_Gsub_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk -v CODE_D_IDENTIFICATION=\042Liste de certification des beneficiaires frauduleux pour les Entreprises\042 -v BALISE_ENTITE_ETAG_HTTP=" Args_Etags_SRSLSPDA" SQLScript/02_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.sql > "Local_GawkCommand_OutputFileName_SRSLSPDA;
	print Local_GawkCommand_SRSLSPDA > "/dev/stderr";
	ExecuteGawk(Local_GawkCommand_SRSLSPDA);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLSPDA = SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE Local_GawkCommand_OutputFileName_SRSLSPDA;
	print Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLSPDA > "/dev/stderr";
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLSPDA = 0;
	
	while(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLSPDA | getline Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLSPDA){
		break;
	}
	
	close(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLSPDA);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLSPDA = Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLSPDA + 0;
	return Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLSPDA;
}

