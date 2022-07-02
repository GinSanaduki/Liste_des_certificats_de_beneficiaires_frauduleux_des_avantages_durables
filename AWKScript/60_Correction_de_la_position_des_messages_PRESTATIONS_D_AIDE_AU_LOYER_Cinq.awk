#!/usr/bin/gawk -f
# 60_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Cinq.awk
# gawk -f AWKScript/60_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Cinq.awk
BEGIN{
	ComponentCnt = 0;
	InvalidBit = 0;
	StartRow = 0;
	EndRow = 0;
	IssueErrorBit = 0;
	StartCnt = 0;
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
	
	# 1行セットのコンポーネントの計測
	for(i in arrays){
		if(arrays[i][2] != 0){
			continue;
		}
		
		mat = match(arrays[i][1], /,/);
		
		if(mat > 0){
			ComponentCnt++;
			mat2 = match(arrays[i][1], /虚偽の/);
			
			if(mat2 > 0){
				;
			} else {
				IssueErrorBit = 1;
			}
		} else if(arrays[i][1] + 0 > 0){
			if(InvalidBit == 0){
				InvalidBit = 1;
				StartRow = i;
				ComponentCnt++;
			} else {
				EndRow = i - 1;
				StartRow = StartRow + 0;
				for(z = StartRow; z <= EndRow; z++){
					arrays[z][3] = ComponentCnt;
					arrays[z][4] = IssueErrorBit;
					if(ComponentCnt < 5){
						arrays[z][5] = 1;
					}
				}
				ComponentCnt = 1;
				IssueErrorBit = 0;
				StartRow = i;
			}
		} else {
			ComponentCnt++;
		}
	}
	
	abure = 1;
	
	for(i in arrays){
		if(arrays[i][2] != 0){
			continue;
		}
		
		if(arrays[i][3] == 4){
			i = i + 0;
			arrays[i + 3 + 0.1][1] = arrays[abure][1];
			arrays[abure][1] = "";
			abure++;
			arrays[i][3] = 5;
			arrays[i + 1][3] = 5;
			arrays[i + 2][3] = 5;
			arrays[i + 3][3] = 5;
		}
	}
	
	for(i in arrays){
		# print i","arrays[i][1]","arrays[i][2]","arrays[i][3]","arrays[i][4]","arrays[i][5];
		# 特殊フィルタ
		# u20a64
		# PDFの文字埋め込みがこれだけ失敗しているため
		if(arrays[i][1] == "亮太"){
			arrays[i][1] = "𠩤 亮太";
		}
		print i","arrays[i][1];
	}
}

