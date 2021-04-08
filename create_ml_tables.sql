-- this sql file is used to create 3 new tables after having the original table cleaned and formatted to support ML
-- ml_vax_plus_symptoms is a very wide table that joins the clean_vaersvax table to the clean_vaerssymptoms table.
-- ml_vax_plus_allergies is a very wide table that joins the clean_vaersvax table to the allergy_table.
-- ml_vax_plus_symptoms_plus_allergies joins the clean_vaersvax table to the clean_vaerssymptoms table and the allergy_table.
SELECT * from vaerscombined_2;

-- altering column name for vaers_id in clean_symptoms and allergy tables
--ALTER TABLE clean_vaerssymptoms 
--RENAME COLUMN "VS_ID" TO "VAERS_ID";

--ALTER TABLE "Allergy_Table" 
--RENAME COLUMN "VA_ID" TO "VAERS_ID";


-- create vaersvax and vaerssymptoms combined table that pulls needed fields from respective cleaned tables
SELECT 
	clean_vaersvax."VAERS_ID",
	clean_vaersvax."VAX_MANU",
	clean_vaersvax."VAX_LOT",
	clean_vaersvax."VAX_DOSE_SERIES",
	vaerscombined_2."AGE_YRS",
	vaerscombined_2."SEX",
	vaerscombined_2."DIED",
	vaerscombined_2."L_THREAT",
	vaerscombined_2."HOSPITAL",
	clean_vaerssymptoms."SYMPTOM1",
	clean_vaerssymptoms."SYMPTOM2",
	clean_vaerssymptoms."SYMPTOM3",
	clean_vaerssymptoms."SYMPTOM4",
	clean_vaerssymptoms."SYMPTOM5",
	clean_vaerssymptoms."SYMPTOM6",
	clean_vaerssymptoms."SYMPTOM7",
	clean_vaerssymptoms."SYMPTOM8",
	clean_vaerssymptoms."SYMPTOM9",
	clean_vaerssymptoms."SYMPTOM10",
	clean_vaerssymptoms."SYMPTOM11",
	clean_vaerssymptoms."SYMPTOM12",
	clean_vaerssymptoms."SYMPTOM13",
	clean_vaerssymptoms."SYMPTOM14",
	clean_vaerssymptoms."SYMPTOM15",
	clean_vaerssymptoms."SYMPTOM16",
	clean_vaerssymptoms."SYMPTOM17",
	clean_vaerssymptoms."SYMPTOM18",
	clean_vaerssymptoms."SYMPTOM19",
	clean_vaerssymptoms."SYMPTOM20",
	clean_vaerssymptoms."SYMPTOM21",
	clean_vaerssymptoms."SYMPTOM22",
	clean_vaerssymptoms."SYMPTOM23",
	clean_vaerssymptoms."SYMPTOM24",
	clean_vaerssymptoms."SYMPTOM25",
	clean_vaerssymptoms."SYMPTOM26",
	clean_vaerssymptoms."SYMPTOM27",
	clean_vaerssymptoms."SYMPTOM28",
	clean_vaerssymptoms."SYMPTOM29",
	clean_vaerssymptoms."SYMPTOM30",
	clean_vaerssymptoms."SYMPTOM31",
	clean_vaerssymptoms."SYMPTOM32",
	clean_vaerssymptoms."SYMPTOM33",
	clean_vaerssymptoms."SYMPTOM34",
	clean_vaerssymptoms."SYMPTOM35",
	clean_vaerssymptoms."SYMPTOM36",
	clean_vaerssymptoms."SYMPTOM37",
	clean_vaerssymptoms."SYMPTOM38",
	clean_vaerssymptoms."SYMPTOM39",
	clean_vaerssymptoms."SYMPTOM40",
	clean_vaerssymptoms."SYMPTOM41",
	clean_vaerssymptoms."SYMPTOM42",
	clean_vaerssymptoms."SYMPTOM43",
	clean_vaerssymptoms."SYMPTOM44",
	clean_vaerssymptoms."SYMPTOM45",
	clean_vaerssymptoms."SYMPTOM46",
	clean_vaerssymptoms."SYMPTOM47",
	clean_vaerssymptoms."SYMPTOM48",
	clean_vaerssymptoms."SYMPTOM49",
	clean_vaerssymptoms."SYMPTOM50",
	clean_vaerssymptoms."SYMPTOM51",
	clean_vaerssymptoms."SYMPTOM52",
	clean_vaerssymptoms."SYMPTOM53",
	clean_vaerssymptoms."SYMPTOM54",
	clean_vaerssymptoms."SYMPTOM55",
	clean_vaerssymptoms."SYMPTOM56",
	clean_vaerssymptoms."SYMPTOM57",
	clean_vaerssymptoms."SYMPTOM58",
	clean_vaerssymptoms."SYMPTOM59",
	clean_vaerssymptoms."SYMPTOM60",
	clean_vaerssymptoms."SYMPTOM61",
	clean_vaerssymptoms."SYMPTOM62",
	clean_vaerssymptoms."SYMPTOM63",
	clean_vaerssymptoms."SYMPTOM64",
	clean_vaerssymptoms."SYMPTOM65",
	clean_vaerssymptoms."SYMPTOM66",
	clean_vaerssymptoms."SYMPTOM67",
	clean_vaerssymptoms."SYMPTOM68",
	clean_vaerssymptoms."SYMPTOM69",
	clean_vaerssymptoms."SYMPTOM70",
	clean_vaerssymptoms."SYMPTOM71",
	clean_vaerssymptoms."SYMPTOM72",
	clean_vaerssymptoms."SYMPTOM73",
	clean_vaerssymptoms."SYMPTOM74",
	clean_vaerssymptoms."SYMPTOM75",
	clean_vaerssymptoms."SYMPTOM76",
	clean_vaerssymptoms."SYMPTOM77",
	clean_vaerssymptoms."SYMPTOM78",
	clean_vaerssymptoms."SYMPTOM79",
	clean_vaerssymptoms."SYMPTOM80",
	clean_vaerssymptoms."SYMPTOM81",
	clean_vaerssymptoms."SYMPTOM82",
	clean_vaerssymptoms."SYMPTOM83",
	clean_vaerssymptoms."SYMPTOM84",
	clean_vaerssymptoms."SYMPTOM85",
	clean_vaerssymptoms."SYMPTOM86",
	clean_vaerssymptoms."SYMPTOM87",
	clean_vaerssymptoms."SYMPTOM88",
	clean_vaerssymptoms."SYMPTOM89",
	clean_vaerssymptoms."SYMPTOM90",
	clean_vaerssymptoms."SYMPTOM91",
	clean_vaerssymptoms."SYMPTOM92",
	clean_vaerssymptoms."SYMPTOM93",
	clean_vaerssymptoms."SYMPTOM94",
	clean_vaerssymptoms."SYMPTOM95",
	clean_vaerssymptoms."SYMPTOM96",
	clean_vaerssymptoms."SYMPTOM97",
	clean_vaerssymptoms."SYMPTOM98",
	clean_vaerssymptoms."SYMPTOM99",
	clean_vaerssymptoms."SYMPTOM100",
	clean_vaerssymptoms."SYMPTOM101",
	clean_vaerssymptoms."SYMPTOM102",
	clean_vaerssymptoms."SYMPTOM103",
	clean_vaerssymptoms."SYMPTOM104",
	clean_vaerssymptoms."SYMPTOM105",
	clean_vaerssymptoms."SYMPTOM106",
	clean_vaerssymptoms."SYMPTOM107",
	clean_vaerssymptoms."SYMPTOM108",
	clean_vaerssymptoms."SYMPTOM109",
	clean_vaerssymptoms."SYMPTOM110",
	clean_vaerssymptoms."SYMPTOM111",
	clean_vaerssymptoms."SYMPTOM112",
	clean_vaerssymptoms."SYMPTOM113",
	clean_vaerssymptoms."SYMPTOM114",
	clean_vaerssymptoms."SYMPTOM115",
	clean_vaerssymptoms."SYMPTOM116",
	clean_vaerssymptoms."SYMPTOM117",
	clean_vaerssymptoms."SYMPTOM118",
	clean_vaerssymptoms."SYMPTOM119",
	clean_vaerssymptoms."SYMPTOM120"
INTO ml_vax_plus_symptoms
FROM clean_vaersvax
LEFT JOIN clean_vaerssymptoms
ON clean_vaersvax."VAERS_ID" = clean_vaerssymptoms."VAERS_ID"
LEFT JOIN vaerscombined_2
ON clean_vaersvax."VAERS_ID" = vaerscombined_2."VAERS_ID";


-- create vaersvax and allergies combined table that pulls needed fields from all 3 cleaned tables
SELECT 
	clean_vaersvax."VAERS_ID",
	vaerscombined_2."AGE_YRS",
	vaerscombined_2."SEX",
	vaerscombined_2."DIED",
	vaerscombined_2."L_THREAT",
	vaerscombined_2."HOSPITAL",
	clean_vaersvax."VAX_MANU",
	clean_vaersvax."VAX_LOT",
	clean_vaersvax."VAX_DOSE_SERIES",
	"Allergy_Table"."Allergy_1",
	"Allergy_Table"."Allergy_2",
	"Allergy_Table"."Allergy_3",
	"Allergy_Table"."Allergy_4",
	"Allergy_Table"."Allergy_5",
	"Allergy_Table"."Allergy_6",
	"Allergy_Table"."Allergy_7",
	"Allergy_Table"."Allergy_8",
	"Allergy_Table"."Allergy_9",
	"Allergy_Table"."Allergy_10",
	"Allergy_Table"."Allergy_11",
	"Allergy_Table"."Allergy_12",
	"Allergy_Table"."Allergy_13",
	"Allergy_Table"."Allergy_14",
	"Allergy_Table"."Allergy_15",
	"Allergy_Table"."Allergy_16",
	"Allergy_Table"."Allergy_17",
	"Allergy_Table"."Allergy_18",
	"Allergy_Table"."Allergy_19",
	"Allergy_Table"."Allergy_20",
	"Allergy_Table"."Allergy_21",
	"Allergy_Table"."Allergy_22",
	"Allergy_Table"."Allergy_23",
	"Allergy_Table"."Allergy_24",
	"Allergy_Table"."Allergy_25",
	"Allergy_Table"."Allergy_26",
	"Allergy_Table"."Allergy_27"
INTO ml_vax_plus_allergies
FROM clean_vaersvax
LEFT JOIN "Allergy_Table"
ON clean_vaersvax."VAERS_ID" = "Allergy_Table"."VAERS_ID"
LEFT JOIN vaerscombined_2
ON clean_vaersvax."VAERS_ID" = vaerscombined_2."VAERS_ID";





-- create vaersvax and allergies combined table that pulls needed fields from all 3 cleaned tables: symptoms, allergies and vax
SELECT 
	clean_vaersvax."VAERS_ID",
	vaerscombined_2."AGE_YRS",
	vaerscombined_2."SEX",
	vaerscombined_2."DIED",
	vaerscombined_2."L_THREAT",
	vaerscombined_2."HOSPITAL",
	clean_vaersvax."VAX_MANU",
	clean_vaersvax."VAX_LOT",
	clean_vaersvax."VAX_DOSE_SERIES",
	clean_vaerssymptoms."SYMPTOM1",
	clean_vaerssymptoms."SYMPTOM2",
	clean_vaerssymptoms."SYMPTOM3",
	clean_vaerssymptoms."SYMPTOM4",
	clean_vaerssymptoms."SYMPTOM5",
	clean_vaerssymptoms."SYMPTOM6",
	clean_vaerssymptoms."SYMPTOM7",
	clean_vaerssymptoms."SYMPTOM8",
	clean_vaerssymptoms."SYMPTOM9",
	clean_vaerssymptoms."SYMPTOM10",
	clean_vaerssymptoms."SYMPTOM11",
	clean_vaerssymptoms."SYMPTOM12",
	clean_vaerssymptoms."SYMPTOM13",
	clean_vaerssymptoms."SYMPTOM14",
	clean_vaerssymptoms."SYMPTOM15",
	clean_vaerssymptoms."SYMPTOM16",
	clean_vaerssymptoms."SYMPTOM17",
	clean_vaerssymptoms."SYMPTOM18",
	clean_vaerssymptoms."SYMPTOM19",
	clean_vaerssymptoms."SYMPTOM20",
	clean_vaerssymptoms."SYMPTOM21",
	clean_vaerssymptoms."SYMPTOM22",
	clean_vaerssymptoms."SYMPTOM23",
	clean_vaerssymptoms."SYMPTOM24",
	clean_vaerssymptoms."SYMPTOM25",
	clean_vaerssymptoms."SYMPTOM26",
	clean_vaerssymptoms."SYMPTOM27",
	clean_vaerssymptoms."SYMPTOM28",
	clean_vaerssymptoms."SYMPTOM29",
	clean_vaerssymptoms."SYMPTOM30",
	clean_vaerssymptoms."SYMPTOM31",
	clean_vaerssymptoms."SYMPTOM32",
	clean_vaerssymptoms."SYMPTOM33",
	clean_vaerssymptoms."SYMPTOM34",
	clean_vaerssymptoms."SYMPTOM35",
	clean_vaerssymptoms."SYMPTOM36",
	clean_vaerssymptoms."SYMPTOM37",
	clean_vaerssymptoms."SYMPTOM38",
	clean_vaerssymptoms."SYMPTOM39",
	clean_vaerssymptoms."SYMPTOM40",
	clean_vaerssymptoms."SYMPTOM41",
	clean_vaerssymptoms."SYMPTOM42",
	clean_vaerssymptoms."SYMPTOM43",
	clean_vaerssymptoms."SYMPTOM44",
	clean_vaerssymptoms."SYMPTOM45",
	clean_vaerssymptoms."SYMPTOM46",
	clean_vaerssymptoms."SYMPTOM47",
	clean_vaerssymptoms."SYMPTOM48",
	clean_vaerssymptoms."SYMPTOM49",
	clean_vaerssymptoms."SYMPTOM50",
	clean_vaerssymptoms."SYMPTOM51",
	clean_vaerssymptoms."SYMPTOM52",
	clean_vaerssymptoms."SYMPTOM53",
	clean_vaerssymptoms."SYMPTOM54",
	clean_vaerssymptoms."SYMPTOM55",
	clean_vaerssymptoms."SYMPTOM56",
	clean_vaerssymptoms."SYMPTOM57",
	clean_vaerssymptoms."SYMPTOM58",
	clean_vaerssymptoms."SYMPTOM59",
	clean_vaerssymptoms."SYMPTOM60",
	clean_vaerssymptoms."SYMPTOM61",
	clean_vaerssymptoms."SYMPTOM62",
	clean_vaerssymptoms."SYMPTOM63",
	clean_vaerssymptoms."SYMPTOM64",
	clean_vaerssymptoms."SYMPTOM65",
	clean_vaerssymptoms."SYMPTOM66",
	clean_vaerssymptoms."SYMPTOM67",
	clean_vaerssymptoms."SYMPTOM68",
	clean_vaerssymptoms."SYMPTOM69",
	clean_vaerssymptoms."SYMPTOM70",
	clean_vaerssymptoms."SYMPTOM71",
	clean_vaerssymptoms."SYMPTOM72",
	clean_vaerssymptoms."SYMPTOM73",
	clean_vaerssymptoms."SYMPTOM74",
	clean_vaerssymptoms."SYMPTOM75",
	clean_vaerssymptoms."SYMPTOM76",
	clean_vaerssymptoms."SYMPTOM77",
	clean_vaerssymptoms."SYMPTOM78",
	clean_vaerssymptoms."SYMPTOM79",
	clean_vaerssymptoms."SYMPTOM80",
	clean_vaerssymptoms."SYMPTOM81",
	clean_vaerssymptoms."SYMPTOM82",
	clean_vaerssymptoms."SYMPTOM83",
	clean_vaerssymptoms."SYMPTOM84",
	clean_vaerssymptoms."SYMPTOM85",
	clean_vaerssymptoms."SYMPTOM86",
	clean_vaerssymptoms."SYMPTOM87",
	clean_vaerssymptoms."SYMPTOM88",
	clean_vaerssymptoms."SYMPTOM89",
	clean_vaerssymptoms."SYMPTOM90",
	clean_vaerssymptoms."SYMPTOM91",
	clean_vaerssymptoms."SYMPTOM92",
	clean_vaerssymptoms."SYMPTOM93",
	clean_vaerssymptoms."SYMPTOM94",
	clean_vaerssymptoms."SYMPTOM95",
	clean_vaerssymptoms."SYMPTOM96",
	clean_vaerssymptoms."SYMPTOM97",
	clean_vaerssymptoms."SYMPTOM98",
	clean_vaerssymptoms."SYMPTOM99",
	clean_vaerssymptoms."SYMPTOM100",
	clean_vaerssymptoms."SYMPTOM101",
	clean_vaerssymptoms."SYMPTOM102",
	clean_vaerssymptoms."SYMPTOM103",
	clean_vaerssymptoms."SYMPTOM104",
	clean_vaerssymptoms."SYMPTOM105",
	clean_vaerssymptoms."SYMPTOM106",
	clean_vaerssymptoms."SYMPTOM107",
	clean_vaerssymptoms."SYMPTOM108",
	clean_vaerssymptoms."SYMPTOM109",
	clean_vaerssymptoms."SYMPTOM110",
	clean_vaerssymptoms."SYMPTOM111",
	clean_vaerssymptoms."SYMPTOM112",
	clean_vaerssymptoms."SYMPTOM113",
	clean_vaerssymptoms."SYMPTOM114",
	clean_vaerssymptoms."SYMPTOM115",
	clean_vaerssymptoms."SYMPTOM116",
	clean_vaerssymptoms."SYMPTOM117",
	clean_vaerssymptoms."SYMPTOM118",
	clean_vaerssymptoms."SYMPTOM119",
	clean_vaerssymptoms."SYMPTOM120",
	"Allergy_Table"."Allergy_1",
	"Allergy_Table"."Allergy_2",
	"Allergy_Table"."Allergy_3",
	"Allergy_Table"."Allergy_4",
	"Allergy_Table"."Allergy_5",
	"Allergy_Table"."Allergy_6",
	"Allergy_Table"."Allergy_7",
	"Allergy_Table"."Allergy_8",
	"Allergy_Table"."Allergy_9",
	"Allergy_Table"."Allergy_10",
	"Allergy_Table"."Allergy_11",
	"Allergy_Table"."Allergy_12",
	"Allergy_Table"."Allergy_13",
	"Allergy_Table"."Allergy_14",
	"Allergy_Table"."Allergy_15",
	"Allergy_Table"."Allergy_16",
	"Allergy_Table"."Allergy_17",
	"Allergy_Table"."Allergy_18",
	"Allergy_Table"."Allergy_19",
	"Allergy_Table"."Allergy_20",
	"Allergy_Table"."Allergy_21",
	"Allergy_Table"."Allergy_22",
	"Allergy_Table"."Allergy_23",
	"Allergy_Table"."Allergy_24",
	"Allergy_Table"."Allergy_25",
	"Allergy_Table"."Allergy_26",
	"Allergy_Table"."Allergy_27"
INTO ml_vax_plus_symptoms_plus_allergies
FROM clean_vaersvax
LEFT JOIN clean_vaerssymptoms

ON clean_vaersvax."VAERS_ID" = clean_vaerssymptoms."VAERS_ID"
LEFT JOIN "Allergy_Table"
ON clean_vaersvax."VAERS_ID" = "Allergy_Table"."VAERS_ID"
LEFT JOIN vaerscombined_2
ON clean_vaersvax."VAERS_ID" = vaerscombined_2."VAERS_ID";

SELECT * FROM ml_vax_plus_allergies;

SELECT * FROM ml_vax_plus_symptoms;

SELECT * FROM ml_vax_plus_symptoms_plus_allergies;
