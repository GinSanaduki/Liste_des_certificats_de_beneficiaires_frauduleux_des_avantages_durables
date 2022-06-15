#!/usr/bin/gawk -f
# 02_InitConst.awk
# @include "AWKScript/02_InitConst.awk"

function InitConst(){
	MainURL = "https://www.meti.go.jp/covid-19/jizokuka_fusei_nintei.html";
	Command_Generation_de_nombres_pseudo_aleatoires = "od -A n -t u4 -N 4 /dev/urandom | sed \047s/[^0-9]//g\047";
	Commande_de_sommeil_aleatoire_courte = "sh ShellScript/01_RandomSleep_Une.sh";
	Commande_de_sommeil_aleatoire_Longue = "sh ShellScript/02_RandomSleep_Deux.sh";
	GetUserAgentList();
	UserAgents_Len = length(UserAgents);
	GawkCommand_05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil = "gawk -f AWKScript/05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk SQLScript/01_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.sql > ";
	MkdirCmd_TempSQLScripts = "mkdir \042TempSQLScripts\042 > /dev/null 2>&1";
	MkdirCmd_StoredHTML = "mkdir \042StoredHTML\042 > /dev/null 2>&1";
	MkdirCmd_SQLITE3 = "mkdir \042SQLITE3\042 > /dev/null 2>&1";
	SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE = "sqlite3 SQLITE3/RENSEIGNEMENTS_SUR_LE_SITE.sqlite3 < ";
	SearchTargetText_Kojin = "個人事業主　持続化給付金不正受給者認定一覧（PDF形式：";
	SearchTargetText_Houjin = "法人　持続化給付金不正受給者認定一覧（PDF形式：";
	GrepCmd_ExistCheck_Kojin = "grep -F -q \047"SearchTargetText_Kojin"\047";
	GrepCmd_ExistCheck_Houjin = "grep -F -q \047"SearchTargetText_Houjin"\047";
	GrepCmd_Component_Kojin = "grep -F \047"SearchTargetText_Kojin"\047";
	GrepCmd_Component_Houjin = "grep -F \047"SearchTargetText_Houjin"\047";
	ComponentURL_Main = "https://www.meti.go.jp";
	STRFTIME_YYYYMMDD = strftime("%Y%m%d",systime());
	STRFTIME_YYYYMMDD_HHMMSS = strftime("%Y%m%d_%H%M%S", systime());
	DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants = "個人事業主_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD".pdf";
	PDFToText_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants = "個人事業主_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD".txt";
	Edited_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants = "個人事業主_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD"_Edited.tsv";
	Registed_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants = "08_個人事業主_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD"_Registed.sql";
	TSV_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants = "個人事業主_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD".tsv";
	
	GawkCommand_05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants = "gawk -f AWKScript/05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk SQLScript/05_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.sql > ";
	DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises = "法人_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD".pdf";
	PDFToText_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises = "法人_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD".txt";
	Edited_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises = "法人_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD"_Edited.tsv";
	Registed_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises = "09_法人_持続化給付金不正受給者認定一覧_"STRFTIME_YYYYMMDD"_Registed.sql";
	GawkCommand_05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises = "gawk -f AWKScript/05_Gsub_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil.awk SQLScript/06_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.sql > ";
	PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants = "pdftotext \042StoredHTML/"DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants"\042 \042StoredHTML/"PDFToText_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants"\042";
	PDFToTextCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises = "pdftotext \042StoredHTML/"DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises"\042 \042StoredHTML/"PDFToText_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises"\042";
	EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants = "sh ShellScript/03_EditTemplate.sh \042StoredHTML/"PDFToText_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants"\042 \042StoredHTML/"Edited_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants"\042";
	EditCmd_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises = "sh ShellScript/03_EditTemplate.sh \042StoredHTML/"PDFToText_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises"\042 \042StoredHTML/"Edited_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises"\042";
	RegistCmd = "sh ShellScript/04_Regist.sh \042StoredHTML/"Edited_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants"\042 \042TempSQLScripts/"Registed_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants"\042 \042StoredHTML/"Edited_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises"\042 \042TempSQLScripts/"Registed_OutputFileName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises"\042";
}

function GetUserAgentList(){
	delete UserAgents;
	UserAgents[0] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36";
	UserAgents[1] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:65.0) Gecko/20100101 Firefox/65.0";
	UserAgents[2] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.3 Safari/605.1.15";
	UserAgents[3] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36";
	UserAgents[4] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763";
	UserAgents[5] = "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko";
	UserAgents[6] = "Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) CriOS/31.0.1650.18 Mobile/11B554a Safari/8536.25";
	UserAgents[7] = "Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12F70 Safari/600.1.4";
	UserAgents[8] = "Mozilla/5.0 (Linux; Android 4.2.1; M040 Build/JOP40D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.59 Mobile Safari/537.36";
	UserAgents[9] = "Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; M351 Build/KTU84P) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30";
}

