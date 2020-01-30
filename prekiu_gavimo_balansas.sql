INSERT INTO prekiu_balansas (`menuo`,`id_prekes`,`id_grupes`, `kiekis_gauta`, `suma_gauta`) 
SELECT
	YEAR(`data`)*100 + MONTH(`data`) AS `menuo`
    ,`prekes`.`id` AS `id_prekes`
    ,`prekes`.`id_grupes` AS `id_grupes`
    , SUM(`prekes_gavimai`.`kiekis`) AS `kiekis_gauta`
    , SUM(`prekes_gavimai`.`vnt_kaina`*`prekes_gavimai`.`kiekis`) AS `suma_gauta`
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
GROUP BY 
	YEAR(`data`)*100 + MONTH(`data`), `prekes`.`id`