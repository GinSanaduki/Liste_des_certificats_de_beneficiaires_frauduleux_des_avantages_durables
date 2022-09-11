#!/usr/bin/gawk -f
# 57_Detection_de_fichiers_en_double_a_supprimer.awk
# gawk -f AWKScript/57_Detection_de_fichiers_en_double_a_supprimer.awk

BEGIN{
	Hash = "";
}

{
	if(Hash != $1){
		Hash = $1;
		next;
	}
	
	print $2;
}

