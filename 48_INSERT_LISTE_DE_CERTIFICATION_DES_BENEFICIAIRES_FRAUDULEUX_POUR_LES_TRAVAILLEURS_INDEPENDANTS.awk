#!/usr/bin/gawk -f
# 48_INSERT_LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS.awk
# gawk -f AWKScript/48_INSERT_LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS.awk

BEGIN{
	FS = "\t";
	LeSerrageBit = 0;
	Generate_Create_Context();
}

{
	if(FNR == 1 || LeSerrageBit == 1){
		if(FNR == 1){
			print "BEGIN TRANSACTION;";
			print "";
		}
		print "INSERT INTO";
		print "	LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS";
		print "WITH PREQUEL_UNE AS (";
	} else if(LeSerrageBit == 0){
		print "	UNION ALL";
	}
	
	print "	SELECT";
	print "		"$1" AS NUMERO_DE_SEQUENCE,";
	print "		\047"$2"\047 AS DATE_DE_CERTIFICATION,";
	print "		\047"$3"\047 AS DATE_DE_CERTIFICATION_DATETIME,";
	
	if($4 == ""){
		print "		NULL AS NOM_DE_LA_PERSONNE_CERTIFIEE,";
	} else {
		print "		\047"$4"\047 AS NOM_DE_LA_PERSONNE_CERTIFIEE,";
	}
	
	if($5 == ""){
		print "		NULL AS EMPLACEMENT,";
	} else {
		print "		\047"$5"\047 AS EMPLACEMENT,";
	}
	
	print "		"$6" AS SOMME_D_ARGENT,";
	print "		\047"$7"\047 AS APERCU";
	
	# https://stackoverflow.com/questions/9527851/sqlite-error-too-many-terms-in-compound-select
	# ios - SQLite error: too many terms in compound SELECT - Stack Overflow
	# The code generator in SQLite processes compound SELECT statements using a recursive algorithm.
	# In order to limit the size of the stack, we therefore limit the number of terms in a compound SELECT.
	# The maximum number of terms is SQLITE_MAX_COMPOUND_SELECT which defaults to 500. 
	if(FNR % 500 == 0){
		Boucle500_LeSerrage();
	} else {
		LeSerrageBit = 0;
	}
}

END{
	if(LeSerrageBit == 1){
		exit;
	}
	
	Boucle500_LeSerrage();
	print "COMMIT;";
	print "";
	print "VACUUM;";
	print "";
}

function Boucle500_LeSerrage(){
	print ")";
	print ", PREQUEL_DEUX AS (";
	print "	SELECT";
	print "		PREQUEL_UNE.NUMERO_DE_SEQUENCE AS NUMERO_DE_SEQUENCE,";
	print "		LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS.NUMERO_DE_SEQUENCE AS NUMERO_DE_SEQUENCE_CH,";
	print "		PREQUEL_UNE.DATE_DE_CERTIFICATION AS DATE_DE_CERTIFICATION,";
	print "		PREQUEL_UNE.DATE_DE_CERTIFICATION_DATETIME AS DATE_DE_CERTIFICATION_DATETIME,";
	print "		PREQUEL_UNE.NOM_DE_LA_PERSONNE_CERTIFIEE AS NOM_DE_LA_PERSONNE_CERTIFIEE,";
	print "		PREQUEL_UNE.EMPLACEMENT AS EMPLACEMENT,";
	print "		PREQUEL_UNE.SOMME_D_ARGENT AS SOMME_D_ARGENT,";
	print "		PREQUEL_UNE.APERCU AS APERCU";
	print "	FROM";
	print "		PREQUEL_UNE";
	print "	LEFT JOIN";
	print "		LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS";
	print "	ON";
	print "		LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS.NUMERO_DE_SEQUENCE = PREQUEL_UNE.NUMERO_DE_SEQUENCE";
	print ")";
	print "SELECT";
	print "	PREQUEL_DEUX.NUMERO_DE_SEQUENCE AS NUMERO_DE_SEQUENCE,";
	print "	PREQUEL_DEUX.DATE_DE_CERTIFICATION AS DATE_DE_CERTIFICATION,";
	print "	PREQUEL_DEUX.DATE_DE_CERTIFICATION_DATETIME AS DATE_DE_CERTIFICATION_DATETIME,";
	print "	PREQUEL_DEUX.NOM_DE_LA_PERSONNE_CERTIFIEE AS NOM_DE_LA_PERSONNE_CERTIFIEE,";
	print "	PREQUEL_DEUX.EMPLACEMENT AS EMPLACEMENT,";
	print "	PREQUEL_DEUX.SOMME_D_ARGENT AS SOMME_D_ARGENT,";
	print "	PREQUEL_DEUX.APERCU AS APERCU";
	print "FROM";
	print "	PREQUEL_DEUX";
	print "WHERE";
	print "	1 = 1";
	print "AND";
	print "	PREQUEL_DEUX.NUMERO_DE_SEQUENCE_CH IS NULL";
	print ";";
	print "";
	LeSerrageBit = 1;
}

function Generate_Create_Context(){
	print "CREATE TABLE IF NOT EXISTS";
	print "LISTE_DE_CERTIFICATION_DES_BENEFICIAIRES_FRAUDULEUX_POUR_LES_TRAVAILLEURS_INDEPENDANTS";
	print "(";
	print "	NUMERO_DE_SEQUENCE INTEGER PRIMARY KEY,";
	print "	DATE_DE_CERTIFICATION TEXT NOT NULL,";
	print "	DATE_DE_CERTIFICATION_DATETIME TEXT NOT NULL,";
	print "	NOM_DE_LA_PERSONNE_CERTIFIEE TEXT,";
	print "	EMPLACEMENT TEXT,";
	print "	SOMME_D_ARGENT INTEGER NOT NULL,";
	print "	APERCU TEXT NOT NULL";
	print ")";
	print ";";
	print "";
}

