#!/usr/bin/gawk -f
# 42_Exclure_les_lignes_vides.awk
# gawk -f AWKScript/42_Exclure_les_lignes_vides.awk
/./{
	print;
}

