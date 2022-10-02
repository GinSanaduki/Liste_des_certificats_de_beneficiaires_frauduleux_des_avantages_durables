#!/usr/bin/gawk -f
# 63_Adjustor_20221001.awk
# gawk -f AWKScript/63_Adjustor_20221001.awk
BEGIN{
	Rowcnt = 0;
	Rowset = "";
	Contents = "";
	SurplusesCnt = 1;
	SurplusesSearchCnt = 1;
	RootCnt = 1;
}

{
	Rowcnt = match($0, /,/);
	Rowset = substr($0, 1, Rowcnt - 1);
	Rowset = Rowset + 0;
	Contents = substr($0, Rowcnt + 1);
	
	if(Rowset < 1){
		surpluses[SurplusesCnt] = Contents;
		SurplusesCnt++;
		next;
	}
	
	switch(RootCnt){
		case "1":
			Contents = Contents + 0;
			if(Contents > 0){
				print Contents;
			} else {
				print surpluses[SurplusesSearchCnt];
				SurplusesSearchCnt++;
			}
			RootCnt++;
			break;
		case "2":
			mat2 = match(Contents, /令和/);
			if(mat2 > 0){
				print Contents;
			} else {
				print surpluses[SurplusesSearchCnt];
				SurplusesSearchCnt++;
			}
			RootCnt++;
			break;
		case "3":
			mat3 = match(Contents, /会社/);
			if(mat3 > 0 || Contents = "-"){
				print Contents;
			} else {
				print surpluses[SurplusesSearchCnt];
				SurplusesSearchCnt++;
			}
			RootCnt++;
			break;
		case "4":
			mat4 = match(Contents, /都/);
			mat5 = match(Contents, /道/);
			mat6 = match(Contents, /府/);
			mat7 = match(Contents, /県/);
			if(mat4 > 0 || mat5 > 0 || mat6 > 0 || mat7 > 0 || Contents = "-"){
				print Contents;
			} else {
				print surpluses[SurplusesSearchCnt];
				SurplusesSearchCnt++;
			}
			RootCnt++;
			break;
		case "5":
			mat8 = match(Contents, /あった。/);
			if(mat8 > 0){
				print Contents;
			} else {
				print surpluses[SurplusesSearchCnt];
				SurplusesSearchCnt++;
			}
			RootCnt = 1;
			break;
	}
}

