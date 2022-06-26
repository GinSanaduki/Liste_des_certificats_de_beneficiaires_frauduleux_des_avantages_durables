#!/usr/bin/gawk -f
# 00_ControleurPrincipal.awk
# gawk -f AWKScript/00_ControleurPrincipal.awk
@include "AWKScript/01_ExecWhich.awk"
@include "AWKScript/02_InitConst.awk"
@include "AWKScript/03_Get_DownLoadMainPageName.awk"
@include "AWKScript/04_ExecCurl.awk"
@include "AWKScript/07_Get_Nombres_Pseudo_Aleatoires.awk"
@include "AWKScript/08_Setter_UserAgent.awk"
@include "AWKScript/09_CheckExitStatus"
@include "AWKScript/10_RetETag.awk"
@include "AWKScript/12_Mkdir.awk"
@include "AWKScript/13_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk"
@include "AWKScript/14_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk"
@include "AWKScript/15_ExecCurl_Details.awk"
@include "AWKScript/16_LongSleep.awk"
@include "AWKScript/17_ShortSleep.awk"
@include "AWKScript/18_ExecSha512sum.awk"
@include "AWKScript/19_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk"
@include "AWKScript/20_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_CODES_DE_HACHAGE.awk"
@include "AWKScript/22_ExistCheck_Component.awk"
@include "AWKScript/23_GrepComponent_Component.awk"
@include "AWKScript/24_ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"
@include "AWKScript/27_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"
@include "AWKScript/28_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"
@include "AWKScript/29_ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"
@include "AWKScript/30_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"
@include "AWKScript/31_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"
@include "AWKScript/33_RetHashCode.awk"
@include "AWKScript/34_ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"
@include "AWKScript/35_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"
@include "AWKScript/36_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"
@include "AWKScript/37_ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"
@include "AWKScript/38_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"
@include "AWKScript/39_SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"
@include "AWKScript/40_ExecutePDFToText.awk"
@include "AWKScript/41_ExecuteGawk.awk"
@include "AWKScript/47_ExecuteEditPipe.awk"
@include "AWKScript/50_ExecuteRegist.awk"
BEGIN{
	# ---------------------------------------------------------
	# 持続化給付金の不正受給者の認定及び公表について
	# ---------------------------------------------------------
	InitConst();
	ExecWhich("curl");
	ExecWhich("gawk");
	ExecWhich("pdftotext");
	ExecWhich("sqlite3");
	#DownLoadMainPageName = Get_DownLoadMainPageName();
	#print "DownLoadMainPageName : " DownLoadMainPageName > "/dev/stderr";
	#ExecCurl(DownLoadMainPageName);
	#ExistCheck_Component(DownLoadMainPageName);
	#PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL = GrepComponent_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(DownLoadMainPageName);
	#print PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL;
	#ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL);
	#PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL = GrepComponent_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(DownLoadMainPageName);
	#print PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL;
	#ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL);
	#ExecutePDFToText();
	#ExecuteEditPipe();
	#ExecuteRegist();
	# ---------------------------------------------------------
	# 家賃支援給付金の不正受給者の認定及び公表について
	# ---------------------------------------------------------
	InitConst_Deux();
	DownLoadMainPageName = Get_DownLoadMainPageName();
	print "DownLoadMainPageName : " DownLoadMainPageName > "/dev/stderr";
	ExecCurl_Deux(DownLoadMainPageName);
	ExistCheck_Component(DownLoadMainPageName);
	PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL = GrepComponent_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(DownLoadMainPageName);
	print PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL;
	ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL);
	PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL = GrepComponent_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(DownLoadMainPageName);
	print PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL;
	ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL);
	ExecutePDFToText();
	ExecuteEditPipe_PRESTATIONS_D_AIDE_AU_LOYER();
	ExecuteRegist_PRESTATIONS_D_AIDE_AU_LOYER();
}

