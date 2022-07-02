#!/usr/bin/gawk -f
# 59_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Quatre.awk
# gawk -f AWKScript/59_Correction_de_la_position_des_messages_PRESTATIONS_D_AIDE_AU_LOYER_Quatre.awk
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
	
	StartCnt = StartCnt + 0;
	
	for(i in arrays){
		i = i + 0;
		if(i >= StartCnt){
			break;
		}
		mat = match(arrays[i][1], /,/);
		mat2 = match(arrays[i][1], /虚偽の/);
		
		if(mat > 0 && mat2 > 0){
			# 金額+事由
			arrays[arrayReset][1] = arrays[i][1];
			arrayReset = arrayReset + 0.01;
			arrays[i][1] = "";
		} else if(mat > 0){
			# 金額のみ
			zinc = i + 1;
			Text = arrays[i][1]" ";
			arrays[i][1] = "";
			for(z = zinc; z <= StartCnt - 1; z++){
				mat3 = match(arrays[z][1], /,/);
				mat4 = match(arrays[z][1], /虚偽の/);
				mat5 = match(arrays[z][1], /。/);
				if(mat3 > 0 && mat4 > 0){
					continue;
				}
				if(mat4 > 0 || mat5 > 0){
					Text = Text arrays[z][1];
					arrays[z][1] = "";
					if(mat5 > 0){
						arrays[arrayReset][1] = Text;
						arrayReset = arrayReset + 0.01;
						break;
					}
				}
			}
		} else {
			# 事由スタート
			if(arrays[i][1] == ""){
				continue;
			}
			zinc = i + 1;
			Text = arrays[i][1];
			arrays[i][1] = "";
			for(z = zinc; z <= StartCnt; z++){
				mat3 = match(arrays[z][1], /,/);
				mat4 = match(arrays[z][1], /虚偽の/);
				mat5 = match(arrays[z][1], /。/);
				if(mat3 > 0 && mat4 > 0){
					continue;
				}
				if(mat3 > 0){
					Text = arrays[z][1]" "Text;
					arrays[z][1] = "";
					continue;
				}
				if(mat4 > 0 || mat5 > 0){
					Text = Text arrays[z][1];
					arrays[z][1] = "";
					if(mat5 > 0){
						arrays[arrayReset][1] = Text;
						arrayReset = arrayReset + 0.01;
						break;
					}
				}
			}
		}
	}
	
	for(i in arrays){
		i = i + 0;
		#if(i < StartCnt){
			print i","arrays[i][1];
		#}
	}
}

