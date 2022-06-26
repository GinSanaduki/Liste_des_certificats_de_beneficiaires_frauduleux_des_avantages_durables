#!/usr/bin/gawk -f
# 55_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Deux_Les_Enterprises.awk
# gawk -f AWKScript/55_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Deux_Les_Enterprises.awk
# 「3,000,000 賃貸借契約等について、虚偽の申請があった。
# 391,998 虚偽の宣誓があった。」の位置補正
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
	# 1行セットのコンポーネントの計測
	ArrayLen = length(arrays);
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
			
			if(i + 0 == ArrayLen){
				EndRow = i;
				StartRow = StartRow + 0;
				for(z = StartRow; z <= EndRow; z++){
					arrays[z][3] = ComponentCnt;
					arrays[z][4] = IssueErrorBit;
					if(ComponentCnt < 6){
						arrays[z][5] = 1;
					}
				}
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
					if(ComponentCnt < 6){
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
	
	StartCnt = StartCnt + 0;
	
	for(i in arrays){
		if(i + 0 == ArrayLen){
			if(arrays[i][3] == 7){
				ENDLINE = i;
				STARTLINE = STARTLINE + 0;
				ENDLINE = ENDLINE + 0;
				if(STARTLINE > 0 && ENDLINE > 0){
					arrays[STARTLINE + 0.1][1] = arrays[ENDLINE][1];
					
					for(z = 1; z <= 5; z++){
						delete arrays[ENDLINE][z];
					}
				}
			}
		} else if(arrays[i][3] == 5){
			STARTLINEBIT = 1;
		} else if(arrays[i][3] == 7){
			ENDLINEBIT = 1;
		} else {
			if(STARTLINEBIT == 1){
				STARTLINEBIT = 0;
				STARTLINE = i - 1;
				continue;
			}
			
			if(ENDLINEBIT == 1){
				ENDLINEBIT = 0;
				ENDLINE = i - 1;
			}
			
			STARTLINE = STARTLINE + 0;
			ENDLINE = ENDLINE + 0;
			
			if(STARTLINE > 0 && ENDLINE > 0){
				arrays[STARTLINE + 0.1][1] = arrays[ENDLINE][1];
				
				for(z = 1; z <= 5; z++){
					delete arrays[ENDLINE][z];
				}
				
				# Reset
				STARTLINE = 0;
				ENDLINE = 0;
			}
		}
	}
	
	for(i in arrays){
		print i","arrays[i][1];
	}
}

