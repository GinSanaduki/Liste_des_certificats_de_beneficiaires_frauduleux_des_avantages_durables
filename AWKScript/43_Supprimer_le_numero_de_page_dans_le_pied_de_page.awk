#!/usr/bin/gawk -f
# 43_Supprimer_le_numero_de_page_dans_le_pied_de_page.awk
# gawk -f AWKScript/43_Supprimer_le_numero_de_page_dans_le_pied_de_page.awk
# フッタページ番号を除去
BEGIN{
	cnt = 0;
	textcnt = 0;
}

{
	textcnt = $0 + 0;
	mat = match($0, /。/);
	if(mat > 0){
		print;
		next;
	}
	if(textcnt == 0){
		print;
		next;
	}
	if(textcnt < cnt){
		mat = match($0, /,/);
		if(mat > 0){
			print;
		}
		next;
	}
	print;
	cnt = textcnt;
}

