-- 09_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_PRESTATIONS_D_AIDE_AU_LOYER.sql
-- SQLScript/09_UPDATE_RENSEIGNEMENTS_SUR_LE_SITE_Page_d_accueil_PRESTATIONS_D_AIDE_AU_LOYER.sql
.bail on
.output stdout

.parameter init
.parameter set @CODE_D_IDENTIFICATION "':CODE_D_IDENTIFICATION'"
.parameter set @DATE_ET_HEURE_D_ACQUISITION "':DATE_ET_HEURE_D_ACQUISITION'"
.parameter set @BALISE_ENTITE_ETAG_HTTP "':BALISE_ENTITE_ETAG_HTTP'"
.parameter set @CODES_DE_HACHAGE "':CODES_DE_HACHAGE'"

BEGIN TRANSACTION;

UPDATE
	RENSEIGNEMENTS_SUR_LE_SITE_PRESTATIONS_D_AIDE_AU_LOYER
SET
	BALISE_ENTITE_ETAG_HTTP = @BALISE_ENTITE_ETAG_HTTP,
	CODES_DE_HACHAGE = @CODES_DE_HACHAGE
WHERE
	CODE_D_IDENTIFICATION = @CODE_D_IDENTIFICATION
AND
	DATE_ET_HEURE_D_ACQUISITION = @DATE_ET_HEURE_D_ACQUISITION
;

COMMIT;

