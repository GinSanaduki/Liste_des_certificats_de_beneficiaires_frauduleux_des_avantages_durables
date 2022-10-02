#!/usr/bin/gawk -f
# 04_ExecCurl.awk
# @include "AWKScript/04_ExecCurl.awk"

function ExecCurl(Args_DownLoadMainPageName_EC,
	Local_CurlCommand_EC,
	Local_esc_EC,
	Local_ArrayCnt_EC,
	Local_HTTPHeader_Component_EC,
	Local_mat_EC,
	Local_ExitStatusBit_EC,
	Local_ExitStatus_EC,
	Local_EtagsBit_EC,
	Local_Etags_EC,
	Local_GawkCommand_EC,
	Local_GawkCommand_OutputFileName_EC,
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_Sha512SumCommand_EC,
	Local_HashCode_EC){
		CheckExitStatus_LoopCnt = 3;
		while(4){
			if(CheckExitStatus_LoopCnt < 0){
				print "ERROR : CURL TRYOUT : ExecCurl." > "/dev/stderr";
				exit 99;
			}
			
			# HTTPヘッダ取得
			Local_CurlCommand_EC = "curl -I --retry 3 -s -H \047"Setter_UserAgent()"\047 "MainURL;
			print Local_CurlCommand_EC > "/dev/stderr";
			delete HTTPHeaderArrays;
			Local_ArrayCnt_EC = 1;
			
			while(Local_CurlCommand_EC | getline Local_esc_EC){
				HTTPHeaderArrays[Local_ArrayCnt_EC] = Local_esc_EC;
				Local_ArrayCnt_EC++;
			}
			
			close(Local_CurlCommand_EC);
			RetCode_CheckExitStatus = CheckExitStatus();
			
			if(RetCode_CheckExitStatus == 0){
				break;
			}
			
			CheckExitStatus_LoopCnt--;
		}
		
		Local_Etags_EC = RetETag();
		INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil();
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil(Local_Etags_EC) < 1){
			print Args_DownLoadMainPageName_EC
			ExecCurl_Details(Args_DownLoadMainPageName_EC);
			# 取得後に更新
			Local_HashCode_EC = RetHashCode(Args_DownLoadMainPageName_EC);
			
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil(Local_Etags_EC, Local_HashCode_EC);
			return;
		}
		
		Local_HashCode_EC = RetHashCode(Args_DownLoadMainPageName_EC);
		
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_CODES_DE_HACHAGE(Local_HashCode_EC) < 1){
			ExecCurl_Details(Args_DownLoadMainPageName_EC);
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil(Local_Etags_EC, Local_HashCode_EC);
			return;
		}
		
}

# ---------------------------------------------------------------------------------------------------------

function ExecCurl_Deux(Args_DownLoadMainPageName_EC,
	Local_CurlCommand_EC,
	Local_esc_EC,
	Local_ArrayCnt_EC,
	Local_HTTPHeader_Component_EC,
	Local_mat_EC,
	Local_ExitStatusBit_EC,
	Local_ExitStatus_EC,
	Local_EtagsBit_EC,
	Local_Etags_EC,
	Local_GawkCommand_EC,
	Local_GawkCommand_OutputFileName_EC,
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_Sha512SumCommand_EC,
	Local_HashCode_EC){
		CheckExitStatus_LoopCnt = 3;
		while(4){
			if(CheckExitStatus_LoopCnt < 0){
				print "ERROR : CURL TRYOUT : ExecCurl." > "/dev/stderr";
				exit 99;
			}
			
			# HTTPヘッダ取得
			Local_CurlCommand_EC = "curl -I --retry 3 -s -H \047"Setter_UserAgent()"\047 "MainURL;
			print Local_CurlCommand_EC > "/dev/stderr";
			delete HTTPHeaderArrays;
			Local_ArrayCnt_EC = 1;
			
			while(Local_CurlCommand_EC | getline Local_esc_EC){
				HTTPHeaderArrays[Local_ArrayCnt_EC] = Local_esc_EC;
				Local_ArrayCnt_EC++;
			}
			
			close(Local_CurlCommand_EC);
			RetCode_CheckExitStatus = CheckExitStatus();
			
			if(RetCode_CheckExitStatus == 0){
				break;
			}
			
			CheckExitStatus_LoopCnt--;
		}
		
		Local_Etags_EC = RetETag();
		
		INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_PRESTATIONS_D_AIDE_AU_LOYER();
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_EC) < 1){
			ExecCurl_Details(Args_DownLoadMainPageName_EC);
			# 取得後に更新
			Local_HashCode_EC = RetHashCode(Args_DownLoadMainPageName_EC);
			
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_EC, Local_HashCode_EC);
			return;
		}
		
		Local_HashCode_EC = RetHashCode(Args_DownLoadMainPageName_EC);
		
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_CODES_DE_HACHAGE_PRESTATIONS_D_AIDE_AU_LOYER(Local_HashCode_EC) < 1){
			ExecCurl_Details(Args_DownLoadMainPageName_EC);
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_EC, Local_HashCode_EC);
			return;
		}
		
}

