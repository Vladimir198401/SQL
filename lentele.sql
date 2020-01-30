SELECT
	`prekes`.`preke` AS `preke`
    ,`id_prekes`
    ,`kiekis_gauta`
    ,`kiekis_parduota`
    , `kiekis_gauta`-`kiekis_parduota` AS `likutis_po`
    , `suma_gauta`-`suma_parduota` AS `suma`
FROM 
	 `prekiu_balansas`
LEFT JOIN 
	`prekes`ON(
       `prekiu_balansas`.`id_prekes` = `prekes`.`id`
    )