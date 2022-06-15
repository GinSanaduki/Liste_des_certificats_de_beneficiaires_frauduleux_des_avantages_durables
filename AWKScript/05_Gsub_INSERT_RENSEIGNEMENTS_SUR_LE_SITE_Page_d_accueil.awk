#!/usr/bin/gawk -f
# 05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk
# gawk -f AWKScript/05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk SQLScript/01_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.sql > SQLScript/01_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil2.sql

BEGIN{
	DATE_ET_HEURE_D_ACQUISITION = strftime("%Y-%m-%d", systime())" 00:00:00";
}

{
	gsub(":DATE_ET_HEURE_D_ACQUISITION", DATE_ET_HEURE_D_ACQUISITION);
	print;
}

