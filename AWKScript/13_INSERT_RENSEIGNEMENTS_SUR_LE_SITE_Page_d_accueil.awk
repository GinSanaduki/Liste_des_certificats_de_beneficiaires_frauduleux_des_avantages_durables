#!/usr/bin/gawk -f
# 13_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk
# @include "AWKScript/13_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk"

function INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil(Local_GawkCommand_OutputFileName_EC, Local_GawkCommand_EC, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE, Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE){
	Local_GawkCommand_OutputFileName_EC = "TempSQLScripts/01_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_"STRFTIME_YYYYMMDD_HHMMSS".sql";
	Local_GawkCommand_EC = GawkCommand_05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil Local_GawkCommand_OutputFileName_EC;
	Mkdir(MkdirCmd_TempSQLScripts);
	ExecuteGawk(Local_GawkCommand_EC);
	Mkdir(MkdirCmd_SQLITE3);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE = SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE Local_GawkCommand_OutputFileName_EC;
	print Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE > "/dev/stderr";
	Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE = system(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE);
	close(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE);
	
	# https://runebook.dev/ja/docs/sqlite/rescode
	if(Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE != 0){
		print "ERROR : "Local_GawkCommand_OutputFileName_EC > "/dev/stderr";
		exit 99;
	}
}

# ---------------------------------------------------------------------------------------------------------------------------

function INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_PRESTATIONS_D_AIDE_AU_LOYER(Local_GawkCommand_OutputFileName_EC, Local_GawkCommand_EC, Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE, Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE){
	Local_GawkCommand_OutputFileName_EC = "TempSQLScripts/01_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_PRESTATIONS_D_AIDE_AU_LOYER_"STRFTIME_YYYYMMDD_HHMMSS".sql";
	Local_GawkCommand_EC = GawkCommand_05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil Local_GawkCommand_OutputFileName_EC;
	Mkdir(MkdirCmd_TempSQLScripts);
	ExecuteGawk(Local_GawkCommand_EC);
	Mkdir(MkdirCmd_SQLITE3);
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE = SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE Local_GawkCommand_OutputFileName_EC;
	print Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE > "/dev/stderr";
	Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE = system(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE);
	close(Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE);
	
	# https://runebook.dev/ja/docs/sqlite/rescode
	if(Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE != 0){
		print "ERROR : "Local_GawkCommand_OutputFileName_EC > "/dev/stderr";
		exit 99;
	}
}

