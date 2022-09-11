#!/usr/bin/gawk -f
# 58_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Trois.awk
# gawk -f AWKScript/58_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Trois.awk
# 「3,000,000 賃貸借契約等について、虚偽の申請があった。
# 2,550,000
# 391,998 虚偽の宣誓があった。」の位置補正
# 行番号削除時についでに上に持ち上げる
BEGIN{
	ComponentCnt = 0;
	InvalidBit = 0;
	StartRow = 0;
	EndRow = 0;
	IssueErrorBit = 0;
	StartCnt = 0;
	arrayReset = 0.01;
	arrayzinbit = 0;
}

{
	arrays[FNR][1] = $0;
	# 先頭番号が出るまでのあぶれ文字
	arrays[FNR][2] = 0;
	# コンポーネント数
	arrays[FNR][3] = 0;
	# 虚偽事由エラー
	arrays[FNR][4] = 0;
	# コンポーネント数エラー
	arrays[FNR][5] = 0;
}

END{
	# 先頭番号が出るまでのあぶれ文字
	for(i in arrays){
		mat = match(arrays[i][1], /,/);
		
		if(mat > 0){
			arrays[i][2] = 1;
		} else if(arrays[i][1] + 0 > 0){
			StartCnt = i;
			break;
		} else {
			arrays[i][2] = 1;
		}
	}
	
	for(i in arrays){
		i = i + 0;
		StartCnt = StartCnt + 0;
		
		if(i < StartCnt){
			continue;
		}
		
		if(arrayzinbit == 1){
			mat = match(arrays[i][1], /,/);
			if(mat == 0){
				arrayzinbit = 0;
				continue;
			}
			arrays[arrayReset][1] = arrays[i][1];
			arrayReset = arrayReset + 0.01;
			arrays[i][1] = "";
			continue;
		}
		mat = match(arrays[i][1], /,/);
		if(mat > 0){
			arrayzinbit = 1;
			continue;
		}
	}
	
	for(i in arrays){
		i = i + 0;
		#if(i < StartCnt && i > 0){
		#	continue;
		#}
		print i","arrays[i][1];
	}
}

