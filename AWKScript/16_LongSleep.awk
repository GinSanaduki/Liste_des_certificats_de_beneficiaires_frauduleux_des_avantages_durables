#!/usr/bin/gawk -f
# 16_LongSleep.awk
# @include "AWKScript/16_LongSleep.awk"

function LongSleep(){
	system(Commande_de_sommeil_aleatoire_Longue);
	close(Commande_de_sommeil_aleatoire_Longue);
}

