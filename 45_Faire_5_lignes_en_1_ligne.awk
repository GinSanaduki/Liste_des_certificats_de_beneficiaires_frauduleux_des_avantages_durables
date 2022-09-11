#!/usr/bin/gawk -f
# 45_Faire_5_lignes_en_1_ligne.awk
# gawk -f AWKScript/45_Faire_5_lignes_en_1_ligne.awk

{
	if(NR%5){
		ORS="\t";
	} else {
		ORS="\n";
	}
	
	print;
}

