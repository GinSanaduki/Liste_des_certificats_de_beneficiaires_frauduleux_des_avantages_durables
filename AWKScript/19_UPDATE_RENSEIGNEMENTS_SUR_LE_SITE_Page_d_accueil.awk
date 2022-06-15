#!/usr/bin/gawk -f
# 19_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk
# @include "AWKScript/19_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk"

function UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil(Args_Etags_URSLSPDA, Args_HashCode_URSLSPDA, Local_GawkCommand_OutputFileName_URSLSPDA, Local_GawkCommand_URSLSPDA, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLSPDA){
	if(Args_Etags_URSLSPDA == ""){
		Args_Etags_URSLSPDA = "FACTICE";
	}
	
	if(Args_HashCode_URSLSPDA == ""){
		Args_HashCode_URSLSPDA = "FACTICE";
	}
	
	# 改行コードがなぜかCR+LFだったため
	gsub("\r", "", Args_Etags_URSLSPDA);
	
	# 改行コードがなぜかCR+LFだったため
	gsub("\r", "", Args_HashCode_URSLSPDA);
	
	Local_GawkCommand_OutputFileName_URSLSPDA = "TempSQLScripts/03_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_"STRFTIME_YYYYMMDD_HHMMSS".sql";
	Local_GawkCommand_URSLSPDA = "gawk -f AWKScript/11_Gsub_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk -v CODE_D_IDENTIFICATION=\042Page d_accueil\042 -v BALISE_ENTITE_ETAG_HTTP=" Args_Etags_URSLSPDA" -v CODES_DE_HACHAGE="Args_HashCode_URSLSPDA" SQLScript/03_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.sql > "Local_GawkCommand_OutputFileName_URSLSPDA;
	print Local_GawkCommand_URSLSPDA > "/dev/stderr";
	ExecuteGawk(Local_GawkCommand_URSLSPDA);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLSPDA = SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE Local_GawkCommand_OutputFileName_URSLSPDA;
	print Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLSPDA > "/dev/stderr";
	system(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLSPDA);
	close(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE_URSLSPDA);
}

