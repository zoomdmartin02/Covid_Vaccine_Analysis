select count (*) from machinelearning_source_table
where "Med_1" = 'MISC';

select count (*) from ml_source_table
where "Med_1" = 'Flonase';

select count (*) from machinelearning_source_table;

SELECT "VAERS_ID", COUNT(*)
FROM machinelearning_source_table
GROUP BY "VAERS_ID"
HAVING COUNT(*) > 1;

-- Creating VAERSCOMBINED_2 (2nd time) for the machine learning model when we realized that the original file vaerscombined_2 had duplicate VAERS_ID in them.
SELECT
vaersdata_raw."VAERS_ID",
vaersdata_raw."AGE_YRS",
vaersdata_raw."SEX",
vaersdata_raw."DIED",
vaersdata_raw."L_THREAT",
vaersdata_raw."HOSPITAL",
vaersdata_raw."OTHER_MEDS",
vaersdata_raw."CUR_ILL",
vaersdata_raw."HISTORY",
vaersdata_raw."ALLERGIES",
vaersvax_raw."VAX_TYPE",
vaersvax_raw."VAX_MANU",
vaersvax_raw."VAX_LOT",
vaersvax_raw."VAX_DOSE_SERIES",
vaersvax_raw."VAX_SITE",
vaersvax_raw."VAX_NAME"
INTO VAERSCOMBINED_2
FROM vaersdata_raw
INNER JOIN vaersvax_raw
ON vaersdata_raw."VAERS_ID" = vaersvax_raw."VAERS_ID"
WHERE vaersvax_raw."VAX_TYPE" = 'COVID19'
;
--Deleting dups
DELETE FROM VAERSCOMBINED_2 a USING (
      SELECT MIN(ctid) as ctid, "VAERS_ID"
        FROM VAERSCOMBINED_2 
        GROUP BY "VAERS_ID" HAVING COUNT(*) > 1
      ) b
      WHERE a."VAERS_ID" = b."VAERS_ID" 
      AND a.ctid <> b.ctid
	  
	  
-- identifying duplicates for cleaning
SELECT "VAERS_ID", COUNT(*)
FROM VAERSCOMBINED_2
GROUP BY "VAERS_ID"
HAVING COUNT(*) > 1;

-- identifying duplicates for cleaning
SELECT "VAERS_ID", COUNT(*)
FROM "Allergy_Table"
GROUP BY "VAERS_ID"
HAVING COUNT(*) > 1;


-- identifying duplicates for cleaning
SELECT "VAERS_ID", COUNT(*)
FROM "Med_Table"
GROUP BY "VAERS_ID"
HAVING COUNT(*) > 1;