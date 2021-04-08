

select *
from information_schema.columns
where table_name = 'vaersdata_raw';

select *
from information_schema.columns
where table_name = 'vaersvax_raw';

--Recreating the vaerscombined_2 with the more updated data on 4/5/21
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
LEFT JOIN vaersvax_raw
ON vaersdata_raw."VAERS_ID" = vaersvax_raw."VAERS_ID";


select *
from information_schema.columns
where table_name = 'vaerscombined_2';


select count(*) from vaerscombined_2
where "DIED" = 'Y' and "VAX_TYPE" = 'COVID19';