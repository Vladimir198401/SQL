-- atliekamas pries tai atlikus priekiu gavimo balansa---
INSERT INTO prekiu_balansas (`menuo`,`id_prekes`,`id_grupes`, `kiekis_parduota`, `suma_parduota`) 
SELECT
	YEAR(`prekes_pardavimai`.`data`)*100 + MONTH(`prekes_pardavimai`.`data`) AS `menuo`
    ,`prekes`.`id` AS `id_prekes`
    ,`prekes`.`id_grupes` AS `id_grupes`
    , SUM(`prekes_pardavimai`.`kiekis`) AS `kiekis_parduota`
    , SUM(`prekes_pardavimai`.`vnt_kaina`*`prekes_pardavimai`.`kiekis`) AS `suma_parduota`
FROM 
	 `prekes`
LEFT JOIN 
	`prekes_tiekejai` ON (
       `prekes_tiekejai`.`id_prekes`=`prekes`.`id`  
     )
LEFT JOIN
	`prekes_gavimai` ON (
      `prekes_gavimai`.`barkodas`=`prekes_tiekejai`.`barkodas`      
     )
LEFT JOIN 
	`prekes_pardavimai` ON (
      `prekes_pardavimai`.`id_prekes_gavimo`=`prekes_gavimai`.`id`      
     )
GROUP BY 
	YEAR(`prekes_pardavimai`.`data`)*100 + MONTH(`prekes_pardavimai`.`data`), `prekes`.`id`
ON DUPLICATE KEY UPDATE 
	`kiekis_parduota`=VALUES(`kiekis_parduota`)
    , `suma_parduota`=VALUES(`suma_parduota`)