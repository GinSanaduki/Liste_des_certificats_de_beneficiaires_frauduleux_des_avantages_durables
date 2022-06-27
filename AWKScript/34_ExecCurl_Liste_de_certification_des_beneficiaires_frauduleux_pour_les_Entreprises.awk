#!/usr/bin/gawk -f
# 34_ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk
# @include "AWKScript/34_ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises.awk"

function ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_EC_LDCDBFPLE,
	Args_ForceBit_EC_LDCDBFPLE,
	Local_CurlCommand_EC_LDCDBFPLE,
	Local_esc_EC_LDCDBFPLE,
	Local_ArrayCnt_EC_LDCDBFPLE,
	Local_HTTPHeader_Component_EC_LDCDBFPLE,
	Local_mat_EC_LDCDBFPLE,
	Local_ExitStatusBit_EC_LDCDBFPLE,
	Local_ExitStatus_EC_LDCDBFPLE,
	Local_EtagsBit_EC_LDCDBFPLE,
	Local_Etags_EC_LDCDBFPLE,
	Local_GawkCommand_EC_LDCDBFPLE,
	Local_GawkCommand_OutputFileName_EC_LDCDBFPLE,
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_Sha512SumCommand_EC_LDCDBFPLE,
	Local_HashCode_EC_LDCDBFPLE){
		while(4){
			if(CheckExitStatus_LoopCnt < 0){
				print "ERROR : CURL TRYOUT : ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants." > "/dev/stderr";
				exit 99;
			}
			
			# HTTPヘッダ取得
			Local_CurlCommand_EC_LDCDBFPLE = "curl -I --retry 3 -s -H \047"Setter_UserAgent()"\047 "Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_EC_LDCDBFPLE;
			print Local_CurlCommand_EC_LDCDBFPLE > "/dev/stderr";
			delete HTTPHeaderArrays;
			Local_ArrayCnt_EC_LDCDBFPLE = 1;
			
			while(Local_CurlCommand_EC_LDCDBFPLE | getline Local_esc_EC_LDCDBFPLE){
				HTTPHeaderArrays[Local_ArrayCnt_EC_LDCDBFPLE] = Local_esc_EC_LDCDBFPLE;
				Local_ArrayCnt_EC_LDCDBFPLE++;
			}
			
			close(Local_CurlCommand_EC_LDCDBFPLE);
			RetCode_CheckExitStatus = CheckExitStatus();
			
			if(RetCode_CheckExitStatus == 0){
				break;
			}
			
			CheckExitStatus_LoopCnt--;
		}
		Local_Etags_EC_LDCDBFPLE = RetETag();
		INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises();
		
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Local_Etags_EC_LDCDBFPLE) < 1 && Args_ForceBit_EC_LDCDBFPLE == 0){
			ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_EC_LDCDBFPLE);
			# 取得後に更新
			Local_HashCode_EC_LDCDBFPLE = RetHashCode(DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
			
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Local_Etags_EC_LDCDBFPLE, Local_HashCode_EC_LDCDBFPLE);
			return;
		}
		
		Local_HashCode_EC_LDCDBFPLE = RetHashCode(DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
		
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_CODES_DE_HACHAGE(Local_HashCode_EC_LDCDBFPLE) < 1 && Args_ForceBit_EC_LDCDBFPLE == 0){
			ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_EC_LDCDBFPLE);
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Local_Etags_EC_LDCDBFPLE, Local_HashCode_EC_LDCDBFPLE);
			return;
		}
		
}

# -------------------------------------------------------------------------------------------------------------------------

function ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_PRESTATIONS_D_AIDE_AU_LOYER(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_EC_LDCDBFPLE,
	Args_ForceBit_EC_LDCDBFPLE,
	Local_CurlCommand_EC_LDCDBFPLE,
	Local_esc_EC_LDCDBFPLE,
	Local_ArrayCnt_EC_LDCDBFPLE,
	Local_HTTPHeader_Component_EC_LDCDBFPLE,
	Local_mat_EC_LDCDBFPLE,
	Local_ExitStatusBit_EC_LDCDBFPLE,
	Local_ExitStatus_EC_LDCDBFPLE,
	Local_EtagsBit_EC_LDCDBFPLE,
	Local_Etags_EC_LDCDBFPLE,
	Local_GawkCommand_EC_LDCDBFPLE,
	Local_GawkCommand_OutputFileName_EC_LDCDBFPLE,
	Local_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_RetCode_SQLite3Cmd_RENSEIGNEMENTS_SUR_LE_SITE,
	Local_Sha512SumCommand_EC_LDCDBFPLE,
	Local_HashCode_EC_LDCDBFPLE){
		while(4){
			if(CheckExitStatus_LoopCnt < 0){
				print "ERROR : CURL TRYOUT : ExecCurl_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants." > "/dev/stderr";
				exit 99;
			}
			
			# HTTPヘッダ取得
			Local_CurlCommand_EC_LDCDBFPLE = "curl -I --retry 3 -s -H \047"Setter_UserAgent()"\047 "Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_EC_LDCDBFPLE;
			print Local_CurlCommand_EC_LDCDBFPLE > "/dev/stderr";
			delete HTTPHeaderArrays;
			Local_ArrayCnt_EC_LDCDBFPLE = 1;
			
			while(Local_CurlCommand_EC_LDCDBFPLE | getline Local_esc_EC_LDCDBFPLE){
				HTTPHeaderArrays[Local_ArrayCnt_EC_LDCDBFPLE] = Local_esc_EC_LDCDBFPLE;
				Local_ArrayCnt_EC_LDCDBFPLE++;
			}
			
			close(Local_CurlCommand_EC_LDCDBFPLE);
			RetCode_CheckExitStatus = CheckExitStatus();
			
			if(RetCode_CheckExitStatus == 0){
				break;
			}
			
			CheckExitStatus_LoopCnt--;
		}
		Local_Etags_EC_LDCDBFPLE = RetETag();
		INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises();
		
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_EC_LDCDBFPLE) < 1 && Args_ForceBit_EC_LDCDBFPLE == 0){
			ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_EC_LDCDBFPLE);
			# 取得後に更新
			Local_HashCode_EC_LDCDBFPLE = RetHashCode(DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
			
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_EC_LDCDBFPLE, Local_HashCode_EC_LDCDBFPLE);
			return;
		}
		
		Local_HashCode_EC_LDCDBFPLE = RetHashCode(DownLoadPDFName_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises);
		
		if(SELECT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_CODES_DE_HACHAGE_PRESTATIONS_D_AIDE_AU_LOYER(Local_HashCode_EC_LDCDBFPLE) < 1 && Args_ForceBit_EC_LDCDBFPLE == 0){
			ExecCurl_Details_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises(Args_PDF_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_URL_EC_LDCDBFPLE);
			UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_Entreprises_PRESTATIONS_D_AIDE_AU_LOYER(Local_Etags_EC_LDCDBFPLE, Local_HashCode_EC_LDCDBFPLE);
			return;
		}
		
}

