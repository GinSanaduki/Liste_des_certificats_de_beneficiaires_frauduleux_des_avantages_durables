#!/usr/bin/gawk -f
# 14_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk
# @include "AWKScript/14_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk"

function SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil(Args_Etags_SRSLSPDA, Local_GawkCommand_OutputFileName_SRSLSPDA, Local_GawkCommand_SRSLSPDA, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_SRSLSPDA, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_RetCount_SRSLSPDA){
	Local_GawkCommand_OutputFileName_SRSLSPDA = "TempSQLScripts/02_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_"STRFTIME_YYYYMMDD_HHMMSS".sql";
	# 改行コードがなぜかCR+LFだったため
	gsub("\r", "", Args_Etags_SRSLSPDA);
	Local_GawkCommand_SRSLSPDA = "gawk -f AWKScript/06_Gsub_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk -v CODE_D_IDENTIFICATION=\042Page d_accueil\042 -v BALISE_ENTITE_ETAG_HTTP=" Args_Etags_SRSLSPDA" SQLScript/02_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.sql > "Local_GawkCommand_OutputFileName_SRSLSPDA;
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

