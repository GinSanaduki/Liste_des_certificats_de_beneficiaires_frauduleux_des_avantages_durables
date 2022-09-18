#!/usr/bin/gawk -f
# 62_Adjustor_20220918.awk
# gawk -f AWKScript/62_Adjustor_20220918.awk
BEGIN{
	MensongeArraysCnt = 1;
	Seek_MensongeArraysCnt = 1;
	Autre_que_FauxArraysCnt = 1;
}

/虚偽/{
	MensongeArrays[MensongeArraysCnt] = $0;
	MensongeArraysCnt++;
	next;
}

{
	Autre_que_FauxArrays[Autre_que_FauxArraysCnt] = $0;
	Autre_que_FauxArraysCnt++;
	next;
}

END{
	for(i in Autre_que_FauxArrays){
		print Autre_que_FauxArrays[i];
		if(i % 5 == 0){
			print MensongeArrays[Seek_MensongeArraysCnt];
			Seek_MensongeArraysCnt++;
		}
	}
}

