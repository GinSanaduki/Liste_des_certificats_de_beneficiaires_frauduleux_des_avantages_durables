#!/usr/bin/gawk -f
# 07_Get_Nombres_Pseudo_Aleatoires.awk
# @include "AWKScript/07_Get_Nombres_Pseudo_Aleatoires.awk"

function Get_Nombres_Pseudo_Aleatoires(Local_esc_GNPA){
	while(Command_Generation_de_nombres_pseudo_aleatoires | getline Local_esc_GNPA){
		break;
	}
	
	close(Command_Generation_de_nombres_pseudo_aleatoires);
	return Local_esc_GNPA % (UserAgents_Len - 1);
}

