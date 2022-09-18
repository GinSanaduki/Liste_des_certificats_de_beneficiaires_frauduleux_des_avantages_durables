#!/usr/bin/gawk -f
# 61_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Six.awk
# gawk -f AWKScript/61_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Six.awk
BEGIN{
	ComponentCnt = 0;
	InvalidBit = 0;
	StartRow = 0;
	EndRow = 0;
	IssueErrorBit = 0;
	StartCnt = 0;
	StartCnt2 = 0;
	StartCnt3 = 1;
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
	StartCnt2 = 0;
	# 1行セットのコンポーネントの計測
	for(i in arrays){
		if(arrays[i][2] != 0){
			continue;
		}
		StartCnt2++;
		if(StartCnt2 == 5){
			mat = match(arrays[i][1], /,/);
			mat2 = match(arrays[i][1], /虚偽/);
			if(mat == 0 || mat2 == 0){
				arrays[i][1] = arrays[StartCnt3][1];
				delete arrays[StartCnt3][1];
				StartCnt3++;
				if(StartCnt3 >= StartCnt){
					break;
				}
			}
		}
	}
	
	for(i in arrays){
		print i","arrays[i][1];
	}
	
}

