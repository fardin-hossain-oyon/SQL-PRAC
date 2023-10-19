SELECT nineteen_early.reg, nineteen_early.earliest_19, latest_entry.camera, latest_entry.latest
FROM
(
	SELECT  camera
	       ,reg 
	       ,MIN(whn) AS earliest_19
	FROM image
	WHERE camera = 19
	GROUP BY  camera
	         ,reg 
) nineteen_early,
(   
    SELECT i.camera, i.reg, t.latest 
    FROM(
    SELECT reg, MAX(whn) AS latest
    FROM image
    GROUP BY reg
    ) t, image i
    WHERE i.reg = t.reg
    AND i.whn = latest
) latest_entry
WHERE nineteen_early.reg = latest_entry.reg
