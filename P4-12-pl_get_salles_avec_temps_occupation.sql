Description de la fonction :

Nom de la fonction :
"gds.pl_get_salles_avec_temps_occupation"

Argument de la fonction :
Aucun

Description :
La fonction retourne la liste des noms de toutes les salles avec leur temps d'occupation respectif ordonnés par temps d'occupation décroissant
puis par nom. 
Cette fonction fera appel à la fonction "gds.pl_calcule_temps_occupation".

CREATE OR REPLACE FUNCTION gds.pl_get_salles_avec_temps_occupation() RETURNS TABLE(nom_salle varchar(250), temps_occupation interval)
AS $$
BEGIN
	RETURN QUERY
			SELECT nom, gds.pl_calcule_temps_occupation(nom) AS tps_occupation
			FROM gds.salle
			ORDER BY tps_occupation DESC, nom;
END;
$$ LANGUAGE plpgsql;
