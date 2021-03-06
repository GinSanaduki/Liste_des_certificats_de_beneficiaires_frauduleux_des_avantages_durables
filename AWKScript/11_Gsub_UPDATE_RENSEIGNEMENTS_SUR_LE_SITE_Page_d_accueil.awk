#!/usr/bin/gawk -f
# 11_Gsub_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk
# gawk -f AWKScript/11_Gsub_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk -v CODE_D_IDENTIFICATION=CODE_D_IDENTIFICATION -v BALISE_ENTITE_ETAG_HTTP=BALISE_ENTITE_ETAG_HTTP -v CODES_DE_HACHAGE=CODES_DE_HACHAGE SQLScript/03_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.sql > SQLScript/03_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil2.sql

BEGIN{
	if(CODE_D_IDENTIFICATION == ""){
		CODE_D_IDENTIFICATION = "FACTICE";
	}
	if(BALISE_ENTITE_ETAG_HTTP == ""){
		BALISE_ENTITE_ETAG_HTTP = "FACTICE";
	}
	if(CODES_DE_HACHAGE == ""){
		CODES_DE_HACHAGE = "FACTICE";
	}
	
	DATE_ET_HEURE_D_ACQUISITION = strftime("%Y-%m-%d", systime())" 00:00:00";
}

{
	gsub(":CODE_D_IDENTIFICATION", CODE_D_IDENTIFICATION);
	gsub(":DATE_ET_HEURE_D_ACQUISITION", DATE_ET_HEURE_D_ACQUISITION);
	gsub(":BALISE_ENTITE_ETAG_HTTP", BALISE_ENTITE_ETAG_HTTP);
	gsub(":CODES_DE_HACHAGE", CODES_DE_HACHAGE);
	print;
}

