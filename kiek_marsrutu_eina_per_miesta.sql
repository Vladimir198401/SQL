SELECT 
    `miestai`.`pav` AS `miestas`
    , COUNT(`marsrutai_miestai`.`id`) AS  `marstrutu_sk`
    , GROUP_CONCAT(`marsrutai`.`pav`) AS `marsrutu_lst`
FROM 
	`marsrutai_miestai` 
LEFT JOIN 
	`miestai` ON (
        `marsrutai_miestai`.`id_miesto`=`miestai`.`id`
     )
LEFT JOIN 
	`marsrutai` ON (
         `marsrutai_miestai`.`id_marsrutu`=`marsrutai`.`id`
     )
GROUP BY
	`id_miesto`