#!/usr/bin/gawk -f
# 17_ShortSleep.awk
# @include "AWKScript/17_ShortSleep.awk"

function ShortSleep(){
	system(Commande_de_sommeil_aleatoire_Longue);
	close(Commande_de_sommeil_aleatoire_Longue);
}

