#!/usr/bin/gawk -f
# 24_ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk
# @include "AWKScript/24_ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.awk"

function ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECLDCDBFPLTI,
	Local_CurlCommand_ECLDCDBFPLTI,
	Local_esc_ECLDCDBFPLTI,
	Local_ArrayCnt_ECLDCDBFPLTI,
	Local_HTTPHeader_Component_ECLDCDBFPLTI,
	Local_mat_ECLDCDBFPLTI,
	Local_ExitStatusBit_ECLDCDBFPLTI,
	Local_ExitStatus_ECLDCDBFPLTI,
	Local_EtagsBit_ECLDCDBFPLTI,
	Local_Etags_ECLDCDBFPLTI,
	Local_GawkCommand_ECLDCDBFPLTI,
	Local_GawkCommand_OutputFileName_ECLDCDBFPLTI,
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_Sha512SumCommand_ECLDCDBFPLTI,
	Local_HashCode_ECLDCDBFPLTI){
		CheckExitStatus_LoopCnt = 3;
		while(4){
			if(CheckExitStatus_LoopCnt < 0){
				print "ERROR : CURL TRYOUT : ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants." > "/dev/stderr";
				exit 99;
			}
			# HTTPヘッダ取得
			Local_CurlCommand_ECLDCDBFPLTI = "curl -I --retry 3 -s -H \047"Setter_UserAgent()"\047 "Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECLDCDBFPLTI;
			print Local_CurlCommand_ECLDCDBFPLTI > "/dev/stderr";
			delete HTTPHeaderArrays;
			Local_ArrayCnt_ECLDCDBFPLTI = 1;
			
			while(Local_CurlCommand_ECLDCDBFPLTI | getline Local_esc_ECLDCDBFPLTI){
				HTTPHeaderArrays[Local_ArrayCnt_ECLDCDBFPLTI] = Local_esc_ECLDCDBFPLTI;
				Local_ArrayCnt_ECLDCDBFPLTI++;
			}
			
			close(Local_CurlCommand_ECLDCDBFPLTI);
			RetCode_CheckExitStatus = CheckExitStatus();
			
			if(RetCode_CheckExitStatus == 0){
				break;
			}
			
			CheckExitStatus_LoopCnt--;
		}
		
		Local_Etags_ECLDCDBFPLTI = RetETag();
		INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants();
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Local_Etags_ECLDCDBFPLTI) < 1){
			ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECLDCDBFPLTI);
			# 取得後に更新
			Local_HashCode_ECLDCDBFPLTI = RetHashCode(DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
			
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Local_Etags_ECLDCDBFPLTI, Local_HashCode_ECLDCDBFPLTI);
			return;
		}
		
		Local_HashCode_ECLDCDBFPLTI = RetHashCode(DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
		
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_CODES_DE_HACHAGE(Local_HashCode_ECLDCDBFPLTI) < 1){
			ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECLDCDBFPLTI);
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Local_Etags_ECLDCDBFPLTI, Local_HashCode_ECLDCDBFPLTI);
			return;
		}
		
}

# --------------------------------------------------------------------------------------------------------------------------

function ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_PRESTATIONS_D_AIDE_AU_LOYER(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECLDCDBFPLTI,
	Local_CurlCommand_ECLDCDBFPLTI,
	Local_esc_ECLDCDBFPLTI,
	Local_ArrayCnt_ECLDCDBFPLTI,
	Local_HTTPHeader_Component_ECLDCDBFPLTI,
	Local_mat_ECLDCDBFPLTI,
	Local_ExitStatusBit_ECLDCDBFPLTI,
	Local_ExitStatus_ECLDCDBFPLTI,
	Local_EtagsBit_ECLDCDBFPLTI,
	Local_Etags_ECLDCDBFPLTI,
	Local_GawkCommand_ECLDCDBFPLTI,
	Local_GawkCommand_OutputFileName_ECLDCDBFPLTI,
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_Sha512SumCommand_ECLDCDBFPLTI,
	Local_HashCode_ECLDCDBFPLTI){
		CheckExitStatus_LoopCnt = 3;
		while(4){
			if(CheckExitStatus_LoopCnt < 0){
				print "ERROR : CURL TRYOUT : ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants." > "/dev/stderr";
				exit 99;
			}
			# HTTPヘッダ取得
			Local_CurlCommand_ECLDCDBFPLTI = "curl -I --retry 3 -s -H \047"Setter_UserAgent()"\047 "Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECLDCDBFPLTI;
			print Local_CurlCommand_ECLDCDBFPLTI > "/dev/stderr";
			delete HTTPHeaderArrays;
			Local_ArrayCnt_ECLDCDBFPLTI = 1;
			
			while(Local_CurlCommand_ECLDCDBFPLTI | getline Local_esc_ECLDCDBFPLTI){
				HTTPHeaderArrays[Local_ArrayCnt_ECLDCDBFPLTI] = Local_esc_ECLDCDBFPLTI;
				Local_ArrayCnt_ECLDCDBFPLTI++;
			}
			
			close(Local_CurlCommand_ECLDCDBFPLTI);
			RetCode_CheckExitStatus = CheckExitStatus();
			
			if(RetCode_CheckExitStatus == 0){
				break;
			}
			
			CheckExitStatus_LoopCnt--;
		}
		
		Local_Etags_ECLDCDBFPLTI = RetETag();
		INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_PRESTATIONS_D_AIDE_AU_LOYER();
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_ECLDCDBFPLTI) < 1){
			ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECLDCDBFPLTI);
			# 取得後に更新
			Local_HashCode_ECLDCDBFPLTI = RetHashCode(DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
			
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_ECLDCDBFPLTI, Local_HashCode_ECLDCDBFPLTI);
			return;
		}
		
		Local_HashCode_ECLDCDBFPLTI = RetHashCode(DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants);
		
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_CODES_DE_HACHAGE_PRESTATIONS_D_AIDE_AU_LOYER(Local_HashCode_ECLDCDBFPLTI) < 1){
			ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_URL_ECLDCDBFPLTI);
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_ECLDCDBFPLTI, Local_HashCode_ECLDCDBFPLTI);
			return;
		}
		
}

