-- Loose definition of UML cluster 0 is high incident to Moderna

SELECT * FROM uml_allergies_class0_results WHERE "DIED" = 'Y' AND "Allergy_1" = 'Penicillin' OR "Allergy_2" = 'Penicilin' AND "Allergy_1" = 'Sulfa' OR "Allergy_2" = 'Sulfa';

SELECT * FROM uml_allergies_class0_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class0_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class0_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class0_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class0_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class0_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';


-- Loose definition of UML cluster 1 is high incidnts to Pfizer

SELECT * FROM uml_allergies_class1_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class1_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class1_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class1_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class1_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class1_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

-- Loose definition of UML cluster 2 is high incidnts to 

SELECT * FROM uml_allergies_class2_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class2_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class2_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class2_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class2_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class2_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

-- Loose definition of UML cluster 3 is high incidnts to 

SELECT * FROM uml_allergies_class3_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class3_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class3_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class3_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class3_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class3_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

-- Loose definition of UML cluster 4 is high incidnts to 

SELECT * FROM uml_allergies_class4_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class4_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class4_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class4_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class4_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class4_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

-- Loose definition of UML cluster 5 is high incidnts to 

SELECT * FROM uml_allergies_class5_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class5_results WHERE "DIED" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class5_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class5_results WHERE "L_THREAT" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

SELECT * FROM uml_allergies_class5_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'MODERNA';

SELECT * FROM uml_allergies_class5_results WHERE "HOSPITAL" = 'Y' AND "VAX_MANU" = 'PFIZERBIONTECH';

