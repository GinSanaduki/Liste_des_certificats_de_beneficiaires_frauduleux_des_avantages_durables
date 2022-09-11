#!/usr/bin/gawk -f
# 08_Setter_UserAgent.awk
# @include "AWKScript/08_Setter_UserAgent.awk"

function Setter_UserAgent(Local_UA_SUA, Local_ContinueCnt){
	Local_ContinueCnt = 3;
	
	while(4){
		if(Local_ContinueCnt < 0){
			print "The number of retries has exceeded the specified value." > "/dev/stderr";
			exit 99;
		}
		
		Local_UA_SUA = UserAgents[Get_Nombres_Pseudo_Aleatoires()];
		
		if(Local_UA_SUA != ""){
			break;
		}
		
		Local_ContinueCnt--;
		system(Commande_de_sommeil_aleatoire_courte);
		close(Commande_de_sommeil_aleatoire_courte);
	}
	
	return UserAgents[Get_Nombres_Pseudo_Aleatoires()];
}

