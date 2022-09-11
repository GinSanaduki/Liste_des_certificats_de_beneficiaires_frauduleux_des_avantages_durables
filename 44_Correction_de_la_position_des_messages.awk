#!/usr/bin/gawk -f
# 44_Correction_de_la_position_des_messages.awk
# gawk -f AWKScript/44_Correction_de_la_position_des_messages.awk
# 「確定申告書等の申請書類の偽造があった。」の位置補正
BEGIN{
	cnt = 0;
	textcnt = 0;
	arrays_alterCnt = 1;
	Desalignement_de_la_ligne_une = 0;
	Desalignement_de_la_ligne_deux = 0;
	skipbit = 0;
}

{
	arrays[FNR] = $0;
}

END{
	for(i in arrays){
		if(skipbit == 1){
			skipbit = 0;
			continue;
		}
		#if(i != 11){
		#	continue;
		#}
		textcnt = arrays[i] + 0;
		# print "arrays["i"] : "arrays[i] > "/dev/stderr";
		mat = match(arrays[i], /。/);
		if(mat > 0){
			if(Desalignement_de_la_ligne_une == 0){
				arrays_alter[arrays_alterCnt] = arrays[i];
				arrays_alterCnt++;
				# print "length(arrays_alter) : "length(arrays_alter) > "/dev/stderr";
				continue;
			}
			
			if(Desalignement_de_la_ligne_une > 0){
				mat2 = match(arrays[i + 1], /。/);
				if(mat2 > 0){
					Desalignement_de_la_ligne_deux = i + 1;
					arrays_alter[arrays_alterCnt] = arrays[Desalignement_de_la_ligne_deux];
					arrays_alterCnt++;
					# print "Desalignement_de_la_ligne_une : "Desalignement_de_la_ligne_une > "/dev/stderr";
					# print "i : "i > "/dev/stderr";
					for(j = Desalignement_de_la_ligne_une; j <= i; j++){
						#print "arrays_alter["arrays_alterCnt"] = arrays["j"];" > "/dev/stderr";
						#print "arrays["j"] : "arrays[j] > "/dev/stderr";
						arrays_alter[arrays_alterCnt] = arrays[j];
						arrays_alterCnt++;
					}
					
					# print "length(arrays_alter) : "length(arrays_alter) > "/dev/stderr";
					#break;
					Desalignement_de_la_ligne_une = 0;
					Desalignement_de_la_ligne_deux = 0;
					skipbit = 1;
					continue;
				}
			}
			continue;
		}
		# 文字列の場合
		if(textcnt == 0){
			if(Desalignement_de_la_ligne_une == 0){
				arrays_alter[arrays_alterCnt] = arrays[i];
				arrays_alterCnt++;
				continue;
			}
			continue;
		}
		
		# 以降はシーケンスNoの場合
		
		# 前行が「確定申告書等の申請書類の偽造があった。」などのメッセージでない場合
		# ズレが発生している
		if(i + 0 < 2){
			arrays_alter[arrays_alterCnt] = arrays[i];
			arrays_alterCnt++;
			continue;
		}
		
		mat = match(arrays[i - 1], /。/);
		
		if(mat == 0){
			Desalignement_de_la_ligne_une = i;
			# print "Desalignement_de_la_ligne_une : "Desalignement_de_la_ligne_une > "/dev/stderr";
		} else {
			if(Desalignement_de_la_ligne_une == 0){
				arrays_alter[arrays_alterCnt] = arrays[i];
				arrays_alterCnt++;
			}
		}
	}
	
	for(i in arrays_alter){
		# print "arrays_alter["i"] : "arrays_alter[i] > "/dev/stderr";
		print arrays_alter[i];
	}
}

