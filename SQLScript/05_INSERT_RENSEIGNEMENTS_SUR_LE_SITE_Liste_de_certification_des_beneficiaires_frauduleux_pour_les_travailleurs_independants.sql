-- 05_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.sql
-- SQLScript/05_INSERT_RENSEIGNEMENTS_SUR_LE_SITE_Liste_de_certification_des_beneficiaires_frauduleux_pour_les_travailleurs_independants.sql
.bail on
.output stdout

CREATE TABLE IF NOT EXISTS
RENSEIGNEMENTS_SUR_LE_SITE
(
	CODE_D_IDENTIFICATION TEXT CHECK(CODE_D_IDENTIFICATION IN ('Page d_accueil', 'Liste de certification des beneficiaires frauduleux pour les travailleurs independants', 'Liste de certification des beneficiaires frauduleux pour les Entreprises')),
	DATE_ET_HEURE_D_ACQUISITION TEXT,
	BALISE_ENTITE_ETAG_HTTP TEXT,
	CODES_DE_HACHAGE TEXT,
	PRIMARY KEY(CODE_D_IDENTIFICATION, DATE_ET_HEURE_D_ACQUISITION)
)
;

.parameter init
.parameter set @DATE_ET_HEURE_D_ACQUISITION "':DATE_ET_HEURE_D_ACQUISITION'"

BEGIN TRANSACTION;

INSERT INTO
	RENSEIGNEMENTS_SUR_LE_SITE
SELECT
	'Liste de certification des beneficiaires frauduleux pour les travailleurs independants' AS CODE_D_IDENTIFICATION,
	@DATE_ET_HEURE_D_ACQUISITION AS DATE_ET_HEURE_D_ACQUISITION,
	NULL AS BALISE_ENTITE_ETAG_HTTP,
	NULL AS CODES_DE_HACHAGE
on conflict ( CODE_D_IDENTIFICATION, DATE_ET_HEURE_D_ACQUISITION)
do nothing
;

COMMIT;

