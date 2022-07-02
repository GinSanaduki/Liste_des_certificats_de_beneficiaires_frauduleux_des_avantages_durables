#!/usr/bin/gawk -f
# 51_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER.awk
# gawk -f AWKScript/51_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER.awk
# 「賃貸借契約及び賃料支払実績等について、虚偽の申請
# があった。」の位置補正
# と
# 「賃貸借契約及び賃料支払実績について、虚偽の申請が
# 1,695,996
# あった。」の位置補正
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
	
	# 先頭番号が出るまでのあぶれ文字を分類
	Text = "";
	Amount = "";
	for(i in arrays){
		if(arrays[i][2] == 0){
			continue;
		}
		
		arraysText = arrays[i][1];
		mat2 = match(arraysText, /虚偽の/);
		
		if(mat2 > 0){
			if(Text == ""){
				Text = arraysText;
			} else {
				# この時点で適用
				if(Amount == ""){
					# 虚偽事由エラー
					for(y in arrays){
						if(arrays[y][4] != 1){
							continue;
						}
						arrays[y + 4][1] = arrays[y + 4][1]" "Text;
						y = y + 0;
						for(x = 0; x <= 4; x++){
							arrays[y + x][4] = 0;
						}
					}
				} else {
					# コンポーネント数エラー
					for(y in arrays){
						if(arrays[y][5] != 1){
							continue;
						}
						arrays[y + 3 + 0.1][1] = Amount" "Text;
						y = y + 0;
						for(x = 0; x <= 3; x++){
							# print "L124 : y + x : " y + x > "/dev/stderr";
							arrays[y + x][5] = 0;
						}
					}
				}
				# リセット
				Text = arraysText;
				Amount = "";
			}
		} else {
			mat = match(arraysText, /,/);
			if(mat > 0){
				Amount = arraysText;
			} else {
				Text = Text arraysText;
			}
		}
	}
	
	if(Text != ""){
		if(Amount == ""){
			# 虚偽事由エラー
			for(y in arrays){
				if(arrays[y][4] != 1){
					continue;
				}
				arrays[y + 4][1] = arrays[y + 4][1]" "Text;
				y = y + 0;
				for(x = 0; x <= 4; x++){
					arrays[y + x][4] = 0;
				}
				break;
			}
		} else {
			# コンポーネント数エラー
			for(y in arrays){
				if(arrays[y][5] != 1){
					continue;
				}
				y = y + 0;
				arrays[y + 3 + 0.1][1] = Amount" "Text;
				for(x = 0; x <= 3; x++){
					arrays[y + x][5] = 0;
				}
				break;
			}
		}
	}
	
	StartCnt = StartCnt + 0;
	
	for(i in arrays){
		i = i + 0;
		if(i < StartCnt){
			continue;
		}
		print i","arrays[i][1];
	}
}

